# init package system for yum

package "yum-plugin-priorities" do
    action :install
end

execute "yum_update" do
    user "root"
    command "yum -y update"
    action :nothing
end

template "/etc/yum.repos.d/CentOS-Base.repo" do
    source "CentOS-Base.repo.erb"
    notifies :run, "execute[yum_update]"
end

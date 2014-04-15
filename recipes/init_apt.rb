# init package system for yum

execute "aptget_update" do
    user "root"
    command "apt-get update -y"
end

execute "aptget_upgrade" do
    user "root"
    command "apt-get upgrade -y"
end

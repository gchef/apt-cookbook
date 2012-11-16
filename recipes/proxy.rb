if servers.length > 0
  Chef::Log.info("apt-cacher server found on #{servers[0]}.")
  proxy = "Acquire::http::Proxy \"http://#{servers[0].ipaddress}:3142\";"
  file "/etc/apt/apt.conf.d/01proxy" do
    owner "root"
    group "root"
    mode "0644"
    content proxy
    action :create
  end
else
  Chef::Log.info("No apt-cacher server found.")
  file "/etc/apt/apt.conf.d/01proxy" do
    action :delete
    only_if {File.exists?("/etc/apt/apt.conf.d/01proxy")}
  end
end

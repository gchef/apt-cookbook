apt_repository "ubuntu-additions" do
  uri "http://us.archive.ubuntu.com/ubuntu/"
  sources %w[deb deb-src]
  distributions [
    node[:lsb][:codename],
    "#{node[:lsb][:codename]}-updates",
    "#{node[:lsb][:codename]}-backports"
  ]
  components %w[main universe multiverse restricted]
  action :add
end

# Clean-up
file "/etc/apt/sources.list.d/ubuntu_additions-source.list" do
  action :delete
end

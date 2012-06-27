lsb_codename = node[:lsb][:codename]
ubuntu_additions_sources = node[:apt][:ubuntu][:additions][:sources].map { |source| "#{lsb_codename}-#{source}" }

apt_repository "additions" do
  uri node[:apt][:ubuntu][:additions][:uri]
  sources %w[deb deb-src]
  distributions ubuntu_additions_sources
  components node[:apt][:ubuntu][:additions][:components]
end



### Clean-up
#

file "/etc/apt/sources.list.d/ubuntu-additions-source.list" do
  action :delete
end

file "/etc/apt/sources.list.d/ubuntu_additions-source.list" do
  action :delete
end

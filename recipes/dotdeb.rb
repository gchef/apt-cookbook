apt_repository "dotdeb" do
  uri           "http://packages.dotdeb.org"
  key           "http://www.dotdeb.org/dotdeb.gpg"
  sources       %w[deb deb-src]
  distributions %w[oldstable]
  components    %w[all]
  action        :add
end

# Clean-up
file "/etc/apt/sources.list.d/packages.dotdeb-source.list" do
  action :delete
end

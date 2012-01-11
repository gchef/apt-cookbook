apt_repository "php53-dotdeb" do
  uri           "http://php53.dotdeb.org"
  key           "http://www.dotdeb.org/dotdeb.gpg"
  sources       %w[deb deb-src]
  distributions %w[oldstable]
  components    %w[all]
  action        :add
end

# Clean-up
file "/etc/apt/sources.list.d/php53.dotdeb-source.list" do
  action :delete
end

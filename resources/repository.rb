actions :add, :remove

attribute :repo_name,      :kind_of => String,  :name_attribute => true
attribute :key,            :kind_of => String,  :default => nil
attribute :keyserver,      :kind_of => String,  :default => nil
attribute :uri,            :kind_of => String
attribute :sources,        :kind_of => Array,   :default => ["deb"]
attribute :distributions,  :kind_of => Array,   :default => [node[:lsb][:codename]]
attribute :components,     :kind_of => Array,   :default => ["main"]
# Compatibility with the default apt_repository provider
# No used anywhere, :distributions is more versatile
attribute :distribution

def initialize(*args)
  super
  @action = :add
end

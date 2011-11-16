actions :add, :remove

attribute :repo_name,      :kind_of => String,  :name_attribute => true
attribute :key,            :kind_of => String,  :default => nil
attribute :keyserver,      :kind_of => String,  :default => nil
attribute :uri,            :kind_of => String
attribute :sources,        :kind_of => Array,   :default => ["deb"]
attribute :distributions,  :kind_of => Array,   :default => [`lsb_release -cs`.chomp]
attribute :components,     :kind_of => Array,   :default => ["main"]

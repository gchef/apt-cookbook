actions :add

attribute :package_name,  :kind_of => String, :name_attribute => true
attribute :version,       :kind_of => String
attribute :freeze,        :kind_of => [FalseClass, TrueClass], :default => false
attribute :options,       :kind_of => String,                  :default => ""
attribute :keep_conf,     :kind_of => [FalseClass, TrueClass], :default => false

def initialize(*args)
  super
  @action = :add
end

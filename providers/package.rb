action :add do
  package_options = new_resource.options
  package_options += ' -o Dpkg::Options::="--force-confold"' if new_resource.keep_conf
  package_status = new_resource.freeze ? 'h' : 'i'

  package new_resource.name do
    action :install
    version new_resource.version
    options package_options
    only_if "[ $(dpkg -l #{new_resource.name} 2>&1 | grep #{new_resource.version}.* | grep -c '^#{package_status}[ic] ') = 0 ]"
  end

  # Legacy, calling the hold/unhold action is the recommended way
  #
  if new_resource.freeze
    freeze
  else
    unfreeze
  end
end

action :hold do
  hold # defined in Apt::SetSelections
end

action :unhold do
  unhold # defined in Apt::SetSelections
end

def load_current_resource
  extend Apt::SetSelections
end

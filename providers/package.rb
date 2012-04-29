action :add do
  package_options = new_resource.options
  package_options += ' -o Dpkg::Options::="--force-confold"' if new_resource.keep_conf
  package_status = new_resource.freeze ? '^h' : '^i'

  package new_resource.name do
    action :install
    version new_resource.version
    options package_options
    only_if "[ $(dpkg -l #{new_resource.name} 2>&1 | grep #{new_resource.version} | grep -c '#{package_status}[ic] ') = 0 ]"
  end

  if new_resource.freeze
    bash "freeze #{new_resource.name} package" do
      code "echo #{new_resource.name} hold | dpkg --set-selections"
      only_if "[ $(dpkg --get-selections | grep '#{new_resource.name}' | grep -c 'hold') = 0 ] "
    end
  end
end

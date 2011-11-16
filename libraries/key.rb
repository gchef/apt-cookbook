module Apt
  module Key
    def add_key!
      if new_resource.key && new_resource.keyserver
        key_from_keyserver
      elsif new_resource.key
        key_from_file
      end
    end

    def key_from_keyserver
      execute "install-key #{new_resource.key}" do
        command "apt-key adv --keyserver #{new_resource.keyserver} --recv #{new_resource.key}"
      end
    end

    def key_from_file
      execute "install-key #{new_resource.key}" do
        command %{
          tmp_key=$(mktemp /tmp/key.XXXXX)
          curl #{new_resource.key} -o $tmp_key
          apt-key add $tmp_key
          rm $tmp_key
        }
      end
    end
  end
end

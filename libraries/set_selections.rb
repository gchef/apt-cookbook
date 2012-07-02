module Apt
  module SetSelections
    def hold
      bash "Hold #{new_resource.name} package" do
        code "echo #{new_resource.name} hold | dpkg --set-selections"
        not_if held?
      end
    end
    alias :freeze :hold

    def unhold
      bash "Remove #{new_resource.name} package hold" do
        code "echo #{new_resource.name} install | dpkg --set-selections"
        only_if held?
      end
    end
    alias :unfreeze :unhold

    def held?
      %{
        test "$(dpkg --get-selections | awk '/^#{new_resource.name}.+/ { print $2 }')" = "hold"
      }
    end
  end
end

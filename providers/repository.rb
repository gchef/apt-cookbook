action :add do
  return if Chef::Util.respond_to?(:wan_up?) && !Chef::Util.wan_up?

  unless ::File.exists?("/etc/apt/sources.list.d/#{new_resource.repo_name}-source.list")
    Chef::Log.info "Adding #{new_resource.repo_name} repository to /etc/apt/sources.list.d/#{new_resource.repo_name}-source.list"
    add_key!
    create_or_update_repository!
    update_repositories!
  end
end

action :remove do
  if ::File.exists?("/etc/apt/sources.list.d/#{new_resource.repo_name}-source.list")
    Chef::Log.info "Removing #{new_resource.repo_name} repository from /etc/apt/sources.list.d/"
    file "/etc/apt/sources.list.d/#{new_resource.repo_name}-source.list" do
      action :delete
    end
    new_resource.updated_by_last_action(true)
  end
end

def load_current_resource
  self.extend(Apt::Key)
  self.extend(Apt::Repository)
end

module Apt
  module Repository
    def create_or_update_repository!
      all_repositories = []
      new_resource.sources.each do |source|
        distributions.each do |distribution|
          all_repositories << (
            "#{source} " <<
            "#{new_resource.uri} " <<
            "#{distribution} " <<
            new_resource.components.join(" ")
          )
        end
      end

      # write out the file, replace it if it already exists
      file "/etc/apt/sources.list.d/#{new_resource.repo_name}-source.list" do
        owner "root"
        group "root"
        mode 0644
        content all_repositories.join("\n") + "\n"
        action :create
      end
    end

    def update_repositories!
      e = execute "update package index" do
        command "apt-get update"
        action :run
      end
      e.run_action(:run)
      new_resource.updated_by_last_action(true)
    end

    private

      def distributions
        if new_resource.distribution
          [new_resource.distribution]
        else
          new_resource.distributions
        end
      end
  end
end

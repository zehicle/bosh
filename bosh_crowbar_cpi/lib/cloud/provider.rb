# Copyright (c) 2015 RackN, Inc.
# Provisder under Apache 2 License

module Bosh::Crowbar
  class Provider
    def self.create(cloud_config, director_uuid)
      if cloud_config.has_key?('provider')
        ExternalCpiProvider.create(cloud_config['provider']['path'], director_uuid)
      else
        PluginCloudProvider.create(cloud_config['plugin'], cloud_config['properties'])
      end
    end
  end

  private

  class PluginCloudProvider
    def self.create(plugin, options)
      begin
        require "cloud/#{plugin}"
      rescue LoadError => error
        raise CloudError, "Could not load Cloud Provider Plugin: #{plugin}, with error #{error.inspect}"
      end

      Bosh::Crowbar.const_get(plugin.capitalize).new(options)
    end
  end

  class ExternalCpiProvider
    def self.create(cpi_job_path, director_uuid)
      ExternalCpi.new(cpi_job_path, director_uuid)
    end
  end
end

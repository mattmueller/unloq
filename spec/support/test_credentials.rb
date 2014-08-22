class TestCredentials
  class << self
    def api_key
      credentials['api_key'] || '123456'
    end

    def namespace
      credentials['namespace'] || 'app-dev'
    end

    def client_args
      {
        api_key: api_key,
        namespace: namespace
      }
    end

    private

    def credentials
      @credentials ||= begin
        credentials_file = File.expand_path(File.join('..', '..', 'credentials.yml'), __FILE__)
        if File.exist?(credentials_file)
          YAML.load_file(credentials_file)
        else
          {}
        end
      end
    end

  end
end
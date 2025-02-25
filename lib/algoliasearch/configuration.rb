module AlgoliaSearch
  module Configuration
    def initiliaze
      @client = nil
    end

    def configuration
      @@configuration || raise(NotConfigured, "Please configure AlgoliaSearch. Set AlgoliaSearch.configuration = {application_id: 'YOUR_APPLICATION_ID', api_key: 'YOUR_API_KEY'}")
    end

    def configuration=(configuration)
      @@configuration = configuration.merge(
        :user_agent => "Algolia for Rails (#{AlgoliaSearch::VERSION}); Rails (#{Rails::VERSION::STRING})",
        :symbolize_keys => false
      )
    end

    def client
      if @client.nil?
        setup_client
      end

      @client
    end

    def setup_client
      @client = Algolia::Search::Client.create_with_config(Algolia::Search::Config.new(@@configuration))
    end
  end
end

module OptaSD
  class Core

    PARAMETERS = YAML::load(File.open('./config/parameters.yml'))
    attr_reader :data

    # The Initialize
    def initialize
      get_configuration
      @params = Hash.new
    end

    # Build the Request and get the Data
    def get
      http = Net::HTTP.get(build_uri)
      data = JSON.parse(http)
      fail OptaSD::Error.new(data) if data['errorCode']
      @data = data
      process_data(data)
      self
    end

    # Data will be Processed here in Chiled Classes
    def process_data(data)
      fail NotImplementedError
    end

    # Define Core API Parameters
    PARAMETERS['core'].keys.each do |param_name|
      define_method param_name do |value|
        @params[PARAMETERS['core'][param_name].to_sym] = value
        self
      end
    end

    private

    # Load OPTA SD API Configurations from './config/opta_sd_api.yml'
    def get_configuration
      config      = YAML::load(File.open('./config/opta_sd.yml'))
      @domain     = config['opta_domain']
      @auth_token = config['opta_auth_token']
    end

    # Build the Base URL of the Request
    def build_url
      [
        @domain,
        @sport,
        @feed_name,
        @auth_token,
        @resource
      ].compact.join('/')
    end

    # Convert Params from Hash To URI Query
    def build_params
      self._format('json')._rt('b')
      URI.encode_www_form(@params)
    end

    # Generate valid URI for the request
    def build_uri
      # puts "#{build_url}?#{build_params}"
      URI.parse([build_url, build_params].join('?'))
    end

    ## ---------------------------------------- ##

    # Define resource for Boolean Parameters
    def self.boolean_params(model , *args)
      args.each do |param_name|
        define_method param_name do |value = true|
          @params[PARAMETERS[model.to_s][param_name.to_s]] = value ? 'yes' : 'no'
          self
        end
      end
    end

    # Define Pesource Parameters
    def self.resource_params(model, *args)
      args.each do |param_name|
        define_method param_name do |value|
          @params[PARAMETERS[model.to_s][param_name.to_s] || param_name.to_s] = value
          self
        end
      end
    end

  end
end

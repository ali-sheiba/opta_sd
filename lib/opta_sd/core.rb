module OptaSD
  class Core

    PARAMETERS = YAML::load(File.open('./config/parameters.yml'))

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

      process_data(data)
      self
    end

    # Data will be Processed here in Chiled Classes
    def process_data(data)
      fail NotImplementedError
    end
    #
    # # The Core Parameters setter
    # %w(_rt _lcl _fmt _clbk _ordSrt _pgNm _pgSz).each do |param_name|
    #   define_method param_name do |value|
    #     @params[param_name.to_sym] = value
    #     self
    #   end
    # end

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


  end
end

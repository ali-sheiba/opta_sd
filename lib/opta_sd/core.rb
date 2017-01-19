module OptaSD
  class Core

    attr_reader :domain, :auth_token, :params

    def initialize#(argument)
      get_configuration
    end

    # Load OPTA SD API Configurations from './config/opta_sd_api.yml'
    def get_configuration
      config      = YAML::load(File.open('./config/opta_sd.yml'))
      @domain     = config['opta_domain']
      @auth_token = config['opta_auth_token']
      @params     = Hash.new
    end

    def build_url
      [
        domain,
        @sport,
        @feed_name,
        auth_token,
        @resource
      ].compact.join('/')
    end

    def build_params
      @params['_fmt']   = 'json'
      @params['_rt']    = 'b'
      URI.encode_www_form(@params)
    end

    def build_uri
      # puts "#{build_url}?#{build_params}"
      URI.parse([build_url, build_params].join('?'))
    end

    def get
      http  = Net::HTTP.get(build_uri)
      @data = JSON.parse(http)
      fail OptaSD::Error.new(@data) if @data['errorCode']
      self
    end

    def data
      @data
    end

    def parse_data
      #code
    end
  end
end

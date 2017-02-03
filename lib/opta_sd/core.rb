module OptaSD
  class Core

    PARAMETERS = YAML::load(File.open(File.expand_path('../../../config/parameters.yml', __FILE__)))

    attr_reader :data

    # The Initialize
    def initialize
      set_configuration
      @params = Hash.new
    end

    # Build the Request and get the Data
    def get
      response = Net::HTTP.get(build_uri)
      @data = parse_data(response)
      self
    end

    # Parse The Response
    def parse_data(response)
      case @params[:_fmt]
      when 'json' then parse_json(response)
      when 'xml'  then parse_xml(response)
      else response end
    end

    # Parse JSON Response
    def parse_json(response)
      data = JSON.parse(response)
      fail OptaSD::Error.new(data), ErrorMessage.get_message(data['errorCode'].to_i) if data['errorCode']
      data
    end

    # Parse XML Response
    def parse_xml(response)
      data = Nokogiri::XML(response) do |config| config.strict.noblanks end
      fail OptaSD::Error.new(xml_error_to_hast(data)), ErrorMessage.get_message(data.children.first.content.to_i) if data.css('errorCode').first.present?
      data
    end

    # Define Core API Parameters
    PARAMETERS['core'].keys.each do |param_name|
      define_method param_name do |value|
        @params[PARAMETERS['core'][param_name].to_sym] = value
        self
      end
    end

    private

    # Load OPTA SD API Configurations from `config_file`
    def set_configuration
      config      = config_file
      @domain     = config['opta_domain']
      @auth_token = config['opta_auth_token']
    end

    # Load Configurations file 'config/opta_sd_api.yml'
    def config_file
      YAML::load(File.open(File.expand_path('../../../config/opta_sd.yml', __FILE__)))
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
      self._format('json') unless @params[:_fmt]
      self._rt('b')        unless @params[:_rt]
      URI.encode_www_form(@params)
    end

    # Generate valid URI for the request
    def build_uri
      # puts [build_url, build_params].join('?')
      URI.parse([build_url, build_params].join('?'))
    end

    def xml_error_to_hast(data)
      {
        "errorCode" => data.children.first.content.to_i,
        "token"     => data.children.first['token']
      }
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

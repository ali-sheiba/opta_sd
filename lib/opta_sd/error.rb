module OptaSD
  class Error < StandardError

    attr_reader :response, :message, :error_code, :token

    def initialize(response)
      unless response.instance_of? Hash
        fail ::ArgumentError, 'Response passed to OptaSD::Error must be a hash'
      end

      @error_code = response[:errorCode]
      @message    = load_errors[@error_code.to_i]
      @token      = response[:token]

      log_error
    end

    private

    def load_errors
      YAML::load(File.open('./errors.yml'))
    end

    def log_error
    end
  end
end

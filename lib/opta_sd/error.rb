module OptaSD
  class Error < StandardError
    attr_reader :env, :message
    attr_reader :response, :error_code, :token

    def initialize(response)

      unless response.instance_of? Hash
        fail ::ArgumentError, 'Response passed to OptaSD::Error must be a hash'
      end

      @error_code = response["errorCode"]
      @message    = ErrorMessage.get_message(@error_code.to_i)
      @token      = response["token"]

      log_error
    end

    private

    def log_error
    end
  end

  class ErrorMessage
    def self.get_message(error_code)
      errors = YAML::load(File.open('./errors.yml'))
      errors[error_code.to_i]
    end
  end
end

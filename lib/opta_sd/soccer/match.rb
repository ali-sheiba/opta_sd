module OptaSD
  module Soccer
    class Match < OptaSD::Soccer::SoccerCore

      attr_accessor :params, :data

      def initialize
        super
        @feed_name = 'match'
      end


      PARAMETERS['match'].keys.each do |param_name|
        if BOOLEAN_PARAMS.include?(param_name)
          define_method param_name do |value = true|
            @params[PARAMETERS['match'][param_name]] = value ? 'yes' : 'no'
            self
          end
        else
          define_method param_name do |value|
            @params[PARAMETERS['match'][param_name]] = value
            self
          end
        end
      end

      def process_data(data)
        OptaSD::MatchWrapper.new(data)
      end

    end
  end
end

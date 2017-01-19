module OptaSD
  module Soccer
    class Match < OptaSD::Soccer::SoccerCore

      attr_accessor :params

      def initialize
        super
        @feed_name = 'match'
      end

      def resource(resource_id)
        @resource = resource_id
        self
      end

      # Params

      def live(value = true)
        @params['live'] = value ? 'yes' : 'no'
        self
      end

      def lineups(value = true)
        @params['lineups'] = value ? 'yes' : 'no'
        self
      end
    end
  end
end

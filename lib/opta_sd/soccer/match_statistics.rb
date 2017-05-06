module OptaSD
  module Soccer
    class MatchStatistics < OptaSD::Soccer::SoccerCore

      boolean_params  :detailed
      resource_params :fixture

      def initialize
        super
        @feed_name = 'matchstats'
      end
    end
  end
end

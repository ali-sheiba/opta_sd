module OptaSD
  module Soccer
    class MatchStatistics < OptaSD::Soccer::SoccerCore

      boolean_params  'matchstats', :detailed
      resource_params 'matchstats', :fixture

      def initialize
        super
        @feed_name = 'matchstats'
      end
    end
  end
end

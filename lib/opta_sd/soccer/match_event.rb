module OptaSD
  module Soccer
    class MatchEvent < OptaSD::Soccer::SoccerCore

      resource_params :fixture

      def initialize
        super
        @feed_name = 'matchevent'
      end
    end
  end
end

module OptaSD
  module Soccer
    class MatchFacts < OptaSD::Soccer::SoccerCore

      resource_params :fixture

      def initialize
        super
        @feed_name = 'matchfacts'
      end

    end
  end
end

module OptaSD
  module Soccer
    class MatchFacts < OptaSD::Soccer::SoccerCore

      resource_params 'matchfacts', :fixture

      def initialize
        super
        @feed_name = 'matchfacts'
      end

    end
  end
end

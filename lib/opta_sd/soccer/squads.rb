module OptaSD
  module Soccer
    class Squads < OptaSD::Soccer::SoccerCore

      boolean_params  :people, :detailed
      resource_params :tournament, :contestant

      def initialize
        super
        @feed_name = 'squads'
      end
    end
  end
end

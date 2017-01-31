module OptaSD
  module Soccer
    class Squads < OptaSD::Soccer::SoccerCore

      boolean_params  'squads', :people, :detailed
      resource_params 'squads', :tournament, :contestant

      def initialize
        super
        @feed_name = 'squads'
      end
    end
  end
end

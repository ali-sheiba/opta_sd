module OptaSD
  module Soccer
    class Venues < OptaSD::Soccer::SoccerCore

      resource_params 'venues', :tournament, :contestant, :venue

      def initialize
        super
        @feed_name = 'venues'
      end
    end
  end
end

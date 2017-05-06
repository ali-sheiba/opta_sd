module OptaSD
  module Soccer
    class SeasonalStats < OptaSD::Soccer::SoccerCore

      resource_params :tournament, :contestant, :competition

      def initialize
        super
        @feed_name = 'seasonstats'
      end

    end
  end
end

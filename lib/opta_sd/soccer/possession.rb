module OptaSD
  module Soccer
    class Possession < OptaSD::Soccer::SoccerCore

      resource_params 'possession', :fixture

      def initialize
        super
        @feed_name = 'possession'
      end
    end
  end
end

module OptaSD
  module Soccer
    class Rankings < OptaSD::Soccer::SoccerCore

      resource_params :tournament

      def initialize
        super
        @feed_name = 'rankings'
      end

    end
  end
end

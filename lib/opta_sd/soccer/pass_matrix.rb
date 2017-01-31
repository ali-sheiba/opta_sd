module OptaSD
  module Soccer
    class PassMatrix < OptaSD::Soccer::SoccerCore

      resource_params 'passmatrix', :fixture

      def initialize
        super
        @feed_name = 'passmatrix'
      end

    end
  end
end

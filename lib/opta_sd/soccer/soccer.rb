module OptaSD
  module Soccer
    class SoccerCore < OptaSD::Core

      def initialize
        super
        @sport = 'soccerdata'
      end

      def resource(resource_id)
        @resource = resource_id
        self
      end

    end
  end
end

module OptaSD
  module Soccer
    class PlayerCareer < OptaSD::Soccer::SoccerCore

      boolean_params  :active
      resource_params :person, :contestant

      def initialize
        super
        @feed_name = 'playercareer'
      end

    end
  end
end

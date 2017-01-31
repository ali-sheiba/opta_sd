module OptaSD
  module Soccer
    class PlayerCareer < OptaSD::Soccer::SoccerCore

      boolean_params  'playercareer', :active
      resource_params 'playercareer', :person, :contestant

      def initialize
        super
        @feed_name = 'playercareer'
      end

    end
  end
end

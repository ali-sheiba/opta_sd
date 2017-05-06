module OptaSD
  module Soccer
    class TournamentSchedule < OptaSD::Soccer::SoccerCore

      resource_params :tournament

      def initialize
        super
        @feed_name = 'tournamentschedule'
      end

    end
  end
end

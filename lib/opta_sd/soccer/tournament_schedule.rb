module OptaSD
  module Soccer
    class TournamentSchedule < OptaSD::Soccer::SoccerCore

      resource_params 'tournamentschedule', :tournament

      def initialize
        super
        @feed_name = 'tournamentschedule'
      end

    end
  end
end

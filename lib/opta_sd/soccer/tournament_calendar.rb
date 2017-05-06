module OptaSD
  module Soccer
    class TournamentCalendar < OptaSD::Soccer::SoccerCore

      resource_params :competition

      def initialize
        super
        @feed_name = 'tournamentcalendar'
      end

      def active
        @resource = @resource ? @resource + '/active' : 'active'
        self
      end

      def authorized
        @resource = @resource ? @resource + '/authorized' : 'authorized'
        self
      end

    end
  end
end

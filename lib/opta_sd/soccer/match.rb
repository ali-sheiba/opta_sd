module OptaSD
  module Soccer
    class Match < OptaSD::Soccer::SoccerCore

      boolean_params  :live,    :lineups
      resource_params :fixture, :tournament, :stage, :competition, :contestant, :match_time, :match_date, :status

      def initialize
        super
        @feed_name = 'match'
      end

      def time_range(from, to)
        match_time("[#{from.utc.iso8601} TO #{to.utc.iso8601}]")
        return self
      end
    end
  end
end

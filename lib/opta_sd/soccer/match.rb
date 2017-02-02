module OptaSD
  module Soccer
    class Match < OptaSD::Soccer::SoccerCore

      boolean_params  'match', :live,    :lineups
      resource_params 'match', :fixture, :tournament, :stage, :competition, :contestant, :match_time, :match_date, :status

      def initialize
        super
        @feed_name = 'match'
      end

      def time_range(from, to)
        match_time("[#{from.strftime('%Y-%m-%dT%H:%M:%SZ')} TO #{to.strftime('%Y-%m-%dT%H:%M:%SZ')}]")
        return self
      end

    end
  end
end

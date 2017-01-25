module OptaSD
  module Soccer
    class Match < OptaSD::Soccer::SoccerCore

      attr_accessor :params, :data

      boolean_params  'match', :live,    :lineups
      resource_params 'match', :fixture, :tournament, :stage, :competition, :contestant, :match_time, :match_date, :status

      def initialize
        super
        @feed_name = 'match'
      end

      def process_data(data)
        OptaSD::MatchWrapper.new(data)
      end

    end
  end
end

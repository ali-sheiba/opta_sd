module OptaSD
  module Soccer
    class TeamStandings < OptaSD::Soccer::SoccerCore

      boolean_params  'standings', :live
      resource_params 'standings', :stage, :tournament, :type

      def initialize
        super
        @feed_name = 'standings'
      end

      %w(total home away form-total form-home form-away).each do |type_value|
        define_method type_value.gsub('-','_') do
          self.type(type_value)
          self
        end
      end

    end
  end
end

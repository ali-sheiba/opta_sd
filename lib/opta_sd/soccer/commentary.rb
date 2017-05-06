module OptaSD
  module Soccer
    class Commentary < OptaSD::Soccer::SoccerCore

      resource_params :fixture, :type

      def initialize
        super
        @feed_name = 'commentary'
      end

      %w(auto fallback manual).each do |type_value|
        define_method type_value do
          self.type(type_value)
          self
        end
      end

    end
  end
end

module Geocoder
  module Result
    class IziGeoip < Geocoder::Result::Base
      attr_reader :request_country

      def address(format = :full)
        fail
      end

      def coordinates
        [@data['location_latitude'].to_f, @data['location_longitude'].to_f]
      end

      def latitude
        @data['location_latitude'].to_f
      end

      def longitude
        @data['location_longitude'].to_f
      end

      def state
        fail
      end

      def province
        fail
      end

      def state_code
        fail
      end

      def province_code
        fail
      end

      def country
        @data['country_name']
      end

      def country_code
        @data['country_code']
      end

      def in_eu?
        if @data['in_eu'].present?
          return @data['in_eu'] unless @data['in_eu'].is_a?(String)
          if defined?(ActiveRecord::ConnectionAdapters::Column.value_to_boolean)
            ActiveRecord::ConnectionAdapters::Column.value_to_boolean(@data['in_eu'])
          elsif ActiveRecord::Type::Boolean.method_defined?(:type_cast_from_database)
            ActiveRecord::Type::Boolean.new.type_cast_from_database(@data['in_eu'])
          else
            !!@data['in_eu']
          end
        elsif defined? Country
          @request_country ||= Country[country_code]
          return false if @request_country.blank?
          return false unless @request_country.respond_to?(:in_eu?)

          @request_country.in_eu?
        else
          false
        end
      end
    end
  end
end

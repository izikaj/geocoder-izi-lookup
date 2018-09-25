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
          ActiveRecord::ConnectionAdapters::Column.value_to_boolean(@data['in_eu'])
        else
          @request_country ||= Country[country_code]
          @request_country.present? && @request_country.in_eu?
        end
      end
    end
  end
end

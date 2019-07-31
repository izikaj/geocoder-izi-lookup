module Geocoder
  module Lookup
    class IziGeoip < Geocoder::Lookup::Base
      def name
        'IziGeoip'
      end

      def base_query_url(query)
        "#{host}/#{path}?"
      end

      def query_url(query)
        "#{host}/#{path}?#{param_name}=#{query.sanitized_text}"
      end

      def cache_key(query)
        "ip=#{query.sanitized_text}"
      end

      def supported_protocols
        host =~ /https/ ? [:https] : [:http]
      end

      private

      def results(query)
        return [reserved_result(query.text)] if query.loopback_ip_address?
        if (doc = fetch_data(query)).nil? || doc['country_code'].blank? || empty_result?(doc)
          []
        else
          [doc]
        end
      end

      def host
        configuration[:host] || 'localhost:3000'
      end

      def path
        configuration[:path] || 'geocode.json'
      end

      def param_name
        configuration[:param_name] || 'ip'
      end

      def empty_result?(doc)
        !doc.is_a?(Hash) || doc.keys == ['ip']
      end

      def reserved_result(ip)
        {
          'ip'                  => ip,
          'continent_code'      => '',
          'continent_name'      => '',
          'country_code'        => 'RD',
          'country_name'        => '',
          'location_latitude'   => '',
          'location_longitude'  => '',
          'location_time_zone'  => '',
          'postal_code'         => ''
        }
      end

      def query_url_params(query)
        super
      end
    end
  end
end

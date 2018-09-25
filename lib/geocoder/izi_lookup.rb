require 'geocoder'
require_relative './lookups/izi_geoip'
require_relative './results/izi_geoip'

module Geocoder
  module IziLookup
    class << self
      def load
        Geocoder::Lookup.ip_services.push(:izi_geoip)
      end
    end
  end
end

Geocoder::IziLookup.load

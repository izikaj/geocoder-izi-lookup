# Geocoder::Izi::Lookup
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'geocoder'
gem 'geocoder-izi-lookup', require: 'geocoder/izi_lookup'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install geocoder-izi-lookup
```

Now you can use this configuration to use own lookup service:
```ruby
Geocoder.configure(
  cache: Rails.cache,
  cache_prefix: 'geocoder:',
  ip_lookup: :izi_geoip,
  izi_geoip: {
    host: 'https://[YOUR_LOOKUP_SERVICE]'
  }
)
```

your service should respond by url:
```
https://[YOUR_LOOKUP_SERVICE]/geocode.json?ip=[IP_FOR_LOOKUP]
```
and return value:
```json
{
  "ip": "123.45.67.89",
  "continent_code": "EU",
  "continent_name": "Europe",
  "country_code": "UA",
  "country_name": "Ukraine",
  "location_latitude": "",
  "location_longitude": "",
  "location_time_zone": "",
  "postal_code": "",
  "version": "0.1.1",
  "in_eu": "false"
}
```

## Contributing
Contribution directions go here.
TODO
### Tests
TODO

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

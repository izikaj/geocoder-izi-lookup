$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'geocoder/izi_lookup/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'geocoder-izi-lookup'
  s.version     = Geocoder::IziLookup::VERSION
  s.authors     = ['IzikAJ']
  s.email       = ['izikaj@gmail.com']
  s.homepage    = ''
  s.summary     = 'Summary of Geocoder::Izi::Lookup.'
  s.description = 'Description of Geocoder::Izi::Lookup.'
  s.license     = 'MIT'
  s.require_paths = ['lib']

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md'
  ]

  # s.add_dependency 'rails', '~> 4.0.0'
  s.add_dependency 'geocoder', '> 1.3.0'

  # s.add_development_dependency "sqlite3"
end

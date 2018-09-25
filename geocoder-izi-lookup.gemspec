$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'geocoder/izi_lookup/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'geocoder-izi-lookup'
  s.version     = Geocoder::IziLookup::VERSION
  s.authors     = ['IzikAJ']
  s.email       = ['izikaj@gmail.com']
  s.homepage    = 'https://github.com/IzikAJ/geocoder-izi-lookup'
  s.summary     = 'One more useless plugin'
  s.description = 'Simple geocoder gem extention to use custom ip lookup api'
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
end

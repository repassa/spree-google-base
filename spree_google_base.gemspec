Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_google_base'
  s.version     = '2.3.1'
  s.summary     = 'Google Merchant for Spree'
  s.description = 'Provide rake task to generate XML for Google Base and so on.'
  s.required_ruby_version = '>= 1.9.3'

  s.authors  = ['Steph Skardal', 'Ryan Siddle', 'Roman Smirnov', 'Denis Ivanov']
  s.homepage = 'http://github.com/repassa/spree-google-merchant'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree', '~> 2.3.1')

  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'factory_girl', '~> 2.6'
end

# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-services'
  s.authors           = ['Aaron Liu', 'David Chen']
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Services extension for Refinery CMS'
  s.date              = '2013-07-02'
  s.summary           = 'Services extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.10'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.10'
end

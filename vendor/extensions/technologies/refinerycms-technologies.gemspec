# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-technologies'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Technologies extension for Refinery CMS'
  s.authors           = ['David Chen', 'Aaron Liu']
  s.date              = '2013-07-12'
  s.summary           = 'Technologies extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.10'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.10'
end

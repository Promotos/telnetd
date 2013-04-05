require 'rake'

Gem::Specification.new do |spec|
  spec.name        = 'telnetd'
  spec.version     = '0.0.1.alpha.1'
  spec.date        = '2013-04-04'
  spec.summary     = "Simple telnet daemon"
  spec.description = "Simple telnet daemon to be used from the command line or as embedded service."
  spec.authors     = ["Promotos"]
  spec.email       = 'promotos@gmx.de'
  spec.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*', 'test/**/*'].to_a
  spec.executables << 'telnetd'
  spec.homepage    = 'http://rubygems.org/gems/telnetd'
end
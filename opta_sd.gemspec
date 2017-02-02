$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "opta_sd/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "opta_sd"
  s.version     = OptaSD::VERSION
  s.authors     = ["Ali Al-Sheiba"]
  s.email       = ["m.sheiba@clickapps.co"]
  # s.homepage    = "TODO"
  s.summary     = "Opta Sports Data Soccer API."
  s.description = "Opta Sports Data Soccer API."
  s.license     = "MIT"

  s.files         = Dir["{config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)\/})
  s.require_paths = ['lib']

  s.add_dependency "rspec"
  s.add_dependency "nokogiri", '~> 1.7', '>= 1.7.0.1'
  s.add_dependency "json"
  s.add_dependency "bundler"
end

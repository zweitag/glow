# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "glow/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "glow"
  s.version     = Glow::VERSION
  s.authors     = ["Daniel Kirsch", "Klaus Fleerkötter"]
  s.email       = ["daniel.kirsch@zweitag.de"]
  s.homepage    = "https://github.com/zweitag/glow"
  s.summary     = "Javascript Flash Hash handling for Rails."
  s.description = <<-DESC
    Handles Flash messages in Javascript for Rails xhr-responses. Fires a dom event when flash messages are present.
  DESC

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.rdoc_options = ['--main', 'README.md', '--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'MIT-LICENSE']

  s.add_dependency "rails", ">= 3.0.0", "< 3.2.0"
  s.add_dependency "jquery-rails"
end

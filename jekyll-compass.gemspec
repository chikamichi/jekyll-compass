lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/compass/version'

Gem::Specification.new do |spec|
  spec.name        = 'jekyll-compass'
  spec.version     = Jekyll::Compass::VERSION
  spec.summary     = "Jekyll generator plugin to build Compass projects during site build"
  spec.description = <<-EOF
    A Jekyll plugin enabling the Compass framework.
    Jekyll website. Compass is an extension library for the CSS preprocessor Sass.
  EOF
  spec.license     = 'MIT'
  spec.authors     = ["Matthew Scharley", "Jean-Denis Vauguet"]
  spec.email       = 'jd@vauguet.fr'
  spec.files       = [*Dir["lib/**/*.rb"], "README.md", "LICENSE"]
  spec.homepage    = 'https://github.com/chikamichi/jekyll-compass'

  spec.add_runtime_dependency 'compass', '~> 1.0'
end

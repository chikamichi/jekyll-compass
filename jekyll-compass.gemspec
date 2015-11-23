Gem::Specification.new do |s|
  s.name        = 'jekyll-compass'
  s.version     = '2.0.1'
  s.summary     = "Jekyll generator plugin to build Compass projects during site build"
  s.description = <<-EOF
    A Jekyll plugin enabling the Compass framework.
    Jekyll website. Compass is an extension library for the CSS preprocessor Sass.
  EOF
  s.license     = 'MIT'
  s.authors     = ["Matthew Scharley", "Jean-Denis Vauguet"]
  s.email       = 'jd@vauguet.fr'
  s.files       = [*Dir["lib/**/*.rb"], "README.md", "LICENSE"]
  s.homepage    = 'https://github.com/chikamichi/jekyll-compass'

  s.add_runtime_dependency 'compass', '~> 1.0'
end

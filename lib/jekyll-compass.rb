
# Require external dependencies
require 'sass/plugin'
require 'fileutils'
require 'compass'
require 'compass/app_integration'
require 'compass/installers'
require 'compass/commands'
require 'yaml'

module Jekyll
  module Compass

    # plugin requires
    autoload :CompassConfiguration, 'jekyll/compass/compass_configuration.rb'
    autoload :CompassFile, 'jekyll/compass/compass_file.rb'
    autoload :CompassInstaller, 'jekyll/compass/compass_installer.rb'
    autoload :VERSION, 'jekyll/compass/version.rb'
  end
end

# Compass app integration for jekyll and jekyll generator
require 'jekyll/compass/compass_app_integration.rb'
require 'jekyll/compass/generator.rb'

module Jekyll
  module Compass
    #
    class CompassInstaller < ::Compass::AppIntegration::StandAlone::Installer

      def prepare
        config_file = targetize('_data/compass.yml')
        directory targetize('.compass')
        write_file targetize('.compass/config.rb'), compass_config_contents
        return if config_files_exist?

        directory File.dirname(config_file)
        write_file config_file, config_contents
      end

      def config_files_exist?
        File.exists? targetize('_data/compass.yml')
      end

      def config_contents
        config = ::Compass.configuration
        contents = {}

        required = (config.required_libraries.to_a || [])
        load = (config.loaded_frameworks.to_a || [])
        discover = (config.framework_path.to_a || [])

        contents['require'] = required if required.any?
        contents['load'] = load if load.any?
        contents['discover'] = discover if discover.any?

        (::Compass::Configuration::ATTRIBUTES + ::Compass::Configuration::ARRAY_ATTRIBUTES).each do |prop|
          process_property(config, prop, contents)
        end

        contents.to_yaml
      end

      def compass_config_contents
        config = ::Compass.configuration
        contents = ''

        contents << "require 'jekyll-compass'\n"
        contents << config.serialize_property(:project_type, config.project_type)
        contents
      end

      def finalize(options = {})
        if options[:create] && !manifest.welcome_message_options[:replace]
          puts <<-NEXTSTEPS

*********************************************************************
Congratulations! Your jekyll-compass project has been created.

Don't forget to add jekyll-compass to the list of gem plugins in _config.yml.

You may now add and edit Sass stylesheets in the #{::Compass.configuration.sass_dir} subdirectory of your project.

Sass files beginning with an underscore are called partials and won't be
compiled to CSS, but they can be imported into other sass stylesheets.

You can configure your project by editing the _data/compass.yml configuration file.

If you are using the jekyll new site template installed with `jekyll new` then
you may wish to move some of the files from _sass to _compass and then remove
this folder along with the css folder.

You must compile your Sass stylesheets into CSS when they change.
This can be done in one of the following ways:
  1. To compile on demand:
     compass compile (just compile your Sass)
     jekyll build (compile your entire website, including Sass)
  2. To monitor your project for changes and automatically recompile:
     compass watch (just watches your Sass)
     jekyll serve --watch (watch your entire website, including Sass)

More Resources:
  * Website: http://compass-style.org/
  * Sass: http://sass-lang.com
  * Community: http://groups.google.com/group/compass-users/
  * Jekyll: http://jekyllrb.com/
  * jekyll-compass: https://github.com/mscharley/jekyll-compass
          NEXTSTEPS
        end
        puts manifest.welcome_message if manifest.welcome_message
      end

      def process_property(config, prop, contents)
        value = config.send("#{prop}_without_default")
        if value.is_a?(Proc)
          $stderr.puts "WARNING: #{prop} is code and cannot be written to a file. You'll need to copy it yourself."
          return
        end
        return if [:project_type].include? prop
        return if value.nil?

        if value.is_a? Symbol
          contents[prop.to_s] = value.to_s
        else
          contents[prop.to_s] = value
        end
      end
    end
  end
end

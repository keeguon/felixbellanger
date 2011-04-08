module FelixBellanger
  class Base < Sinatra::Base
    # Sinatra configuration
    configure do
      mongoid_config = YAML.load_file(File.join(File.dirname(__FILE__), '..', '..', 'config', 'mongoid.yml'))
      Mongoid.configure do |config|
        config.from_hash(mongoid_config['development'])
      end

      set :views, File.join(File.dirname(__FILE__), '..', 'views')
    end

    not_found do
      erb(:"../404", {
        :layout => :"../layout",
        :locals => {
          :title           => "Felix Bellanger / 404",
          :description     => "This is not the web page you are looking for...",
          :author          => "Felix Bellanger <felix.bellanger@gmail.com>",
          :analyticssiteid => "UA-16260080-1"
        }
      })
    end
  end
end


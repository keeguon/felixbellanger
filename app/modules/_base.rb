module FelixBellanger
  class Base < Sinatra::Base
    # Sinatra configuration
    configure do
      mongoid_config = YAML.load_file(File.join(File.dirname(__FILE__), '..', '..', 'config', 'mongoid.yml'))
      Mongoid.configure do |config|
        config.from_hash(mongoid_config['development'])
      end
    end
  end
end


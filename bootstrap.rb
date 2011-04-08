# Require gems
%w{yaml}.each { |lib| require lib }

# YAML config
YAML::ENGINE.yamler= 'syck'

# Require app code
Dir.glob(File.join(File.dirname(__FILE__), 'app', 'models', '**', '*.rb')).sort.each { |req| require req }
Dir.glob(File.join(File.dirname(__FILE__), 'app', 'modules', '*.rb')).sort.each { |req| require req }


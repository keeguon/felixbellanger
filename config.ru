require 'rubygems'
require 'bundler'

Bundler.require

require File.join(File.dirname(__FILE__), 'bootstrap')

# Serve static files
use Rack::Static, :urls => ['/css', '/images', '/js', '/favicon.ico'], :root => './public'

# Map the different modules to virtual subfolders
run Rack::URLMap.new(
  '/'     => FelixBellanger::Pages.new,
  '/blog' => FelixBellanger::Posts.new
)


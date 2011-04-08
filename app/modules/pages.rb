class FelixBellanger::Pages < FelixBellanger::Base
  configure do
    set :views, File.join(File.dirname(__FILE__), '..', 'views', 'pages')
  end

  # Default index
  get '/' do
    redirect to('/blog')
  end

  # About page
  get '/about' do
    erb :about, {:layout => :"../layout"}
  end
end


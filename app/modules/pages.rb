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
    erb(:about, {
      :layout => :"../layout",
      :locals => {
        :title           => "Felix Bellanger / About",
        :description     => "Who am I",
        :author          => "Felix Bellanger <felix.bellanger@gmail.com>",
        :analyticssiteid => "UA-16260080-1"
      }
    })
  end
end


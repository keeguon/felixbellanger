class FelixBellanger::Pages < FelixBellanger::Base
  register Sinatra::Contrib
  set :json_encoder, :to_json
  respond_to :html, :json

  # Default index
  get '/' do
    redirect to('/blog')
  end

  # Default page
  get '/about' do
    @page =  Page.first(:conditions => { :slug => 'about' })
    respond_with :"pages/page", @page  
  end
end


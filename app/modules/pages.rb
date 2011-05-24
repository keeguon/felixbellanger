class FelixBellanger::Pages < FelixBellanger::Base
  # Sinatra contrib
  register Sinatra::Contrib
  set :json_encoder, :to_json
  respond_to :html, :json
    
  # Mustache
  require File.join(File.dirname(__FILE__), '..', 'views', 'pages')

  # Default index
  get '/' do
    redirect to('/blog')
  end

  # Default page
  get '/about' do
    @page =  Page.first(:conditions => { :slug => 'about' })
    respond_with @page do |format|
      format.html { mustache :page, :locals => @page.as_document }
    end
  end
end


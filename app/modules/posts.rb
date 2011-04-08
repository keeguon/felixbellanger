class FelixBellanger::Posts < FelixBellanger::Base
  configure do
    set :views, File.join(File.dirname(__FILE__), '..', 'views', 'posts')
  end

  get '/' do
    status, headers, body = call! request.env.merge("PATH_INFO" => '/1')
    [status, body]
  end

  get '/:page' do
    # Pagination logic
    per_page = 5
    @pagination = {
      :current_page => params[:page],
      :total_pages => (Post.count(conditions: { published: true }) / per_page) + 1
    }
    
    # Retrieve things from the DB
    @posts = Post.paginate(
      conditions: { published: true },
      sort: [[ :created_at, :desc ]],
      page: params[:page],
      per_page: per_page
    )

    erb(:index, {
      :layout => :"../layout",
      :locals => {
        :title           => "Felix Bellanger / Blog",
        :description     => "Stuffs about my life and my work",
        :author          => "Felix Bellanger <felix.bellanger@gmail.com>",
        :analyticssiteid => "UA-16260080-1"
      }
    })
  end
end


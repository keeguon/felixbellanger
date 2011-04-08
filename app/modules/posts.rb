class FelixBellanger::Posts < FelixBellanger::Base
  configure do
    set :views, File.join(File.dirname(__FILE__), '..', 'views', 'posts')
  end

  get %r{/([0-9]*)} do |page|
    if page.to_i == 0
      page = 1
    end

    # Pagination logic
    per_page = 5
    @pagination = {
      :current_page => page,
      :total_pages => (Post.count(conditions: { published: true }) / per_page) + 1
    }
    
    # Retrieve things from the DB
    @posts = Post.paginate(
      conditions: { published: true },
      sort: [[ :created_at, :desc ]],
      page: page.to_i,
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


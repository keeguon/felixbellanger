class FelixBellanger::Posts < FelixBellanger::Base
  register Sinatra::Contrib
  set :json_encoder, :to_json
  respond_to :html, :json

  get '/:year/:month/:day/:slug' do
    @post = Post.first(:conditions => {
      :slug => params[:slug],
      :created_at.gte => Time.local(params[:year].to_i, params[:month].to_i, params[:day].to_i),
      :created_at.lt => Time.local(params[:year].to_i, params[:month].to_i, params[:day].to_i + 1),
      :published => true
    })

    if @post.nil?
      halt 404
    end

    respond_with :"posts/post", @post
  end

  get %r{/([0-9]*)} do |page|
    if page.to_i == 0
      page = 1
    end

    # Retrieve things from the DB
    @posts = Post.paginate(
      conditions: { published: true },
      sort: [[ :created_at, :desc ]],
      page: page.to_i,
      per_page: 5
    )

    respond_with :"posts/index", @posts
  end
end


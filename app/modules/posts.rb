class FelixBellanger::Posts < FelixBellanger::Base
  # Sinatra contrib
  register Sinatra::Contrib
  set :json_encoder, :to_json
  respond_to :html, :json

  # Mustache
  require File.join(File.dirname(__FILE__), '..', 'views', 'posts')

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

    respond_with @post do |format|
      format.html { mustache :post }
    end
  end

  get %r{/([0-9]*)} do |page|
    # retrieve the page
    if page.to_i == 0
      page = 1
    end

    # retrieve limit (per page)
    limit = (params.has_key?("limit") && params["limit"].to_i) || 5 

    # Retrieve things from the DB
    posts = Post.all(conditions: { published: true }, sort: [[ :created_at, :desc ]], skip: limit * (page.to_i - 1), limit: limit)
    count = Post.count(conditions: { published: true })

    # Create the output Hash
    @posts = Hash[
      "current_page"  => page.to_i,
      "per_page"      => limit,
      "total_entries" => count,
      "total_pages"   => (count.to_f / limit.to_f).ceil,
      "items"         => Array.new
    ]

    # Add posts into our hash
    posts.each { |post| @posts["items"].push(post.serializable_hash) }

    respond_with @posts do |format|
      format.html { mustache :index }
    end
  end
end


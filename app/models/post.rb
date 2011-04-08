class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  # Fields
  field :title, type: String
  field :body, type: String
  field :published, type: Boolean

  # Extras
  slug :title
end


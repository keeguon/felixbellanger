class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  # Fields
  field :name, type: String
  field :title, type: String
  field :content, type: String

  # Extras
  slug :name
end


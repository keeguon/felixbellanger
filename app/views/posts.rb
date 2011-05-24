require File.join(File.dirname(__FILE__), "helpers", "date.rb")
require File.join(File.dirname(__FILE__), "helpers", "permalink.rb")
require File.join(File.dirname(__FILE__), "helpers", "will_paginate.rb")

class FelixBellanger::Posts
  module Views
    class Layout < Mustache
      def self.template_file
        File.join(File.dirname(__FILE__), '../templates/layout.mustache')
      end
    end

    class Index < Layout
      include ViewHelpers

      def self.template_file
        File.join(File.dirname(__FILE__), '../templates/posts/index.mustache')
      end

      def title
        "Blog"
      end

      def items
        @posts["items"]
      end

      def pagination
        Hash["current_page" => @posts["current_page"], "total_pages" => @posts["total_pages"]]
      end
    end

    class Post < Layout
      def self.template_file
        File.join(File.dirname(__FILE__), '../templates/posts/post.mustache')
      end

      def _id
        @post._id
      end

      def title
        @post.title
      end

      def body
        @post.body
      end

      def created_at
        @post.created_at.strftime("%B %d, %Y")
      end
    end
  end
end

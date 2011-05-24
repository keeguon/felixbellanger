class FelixBellanger::Pages
  module Views
    class Layout < Mustache
      def self.template_file
        File.join(File.dirname(__FILE__), '../templates/layout.mustache')
      end
    end

    class Page < Layout
      def self.template_file
        File.join(File.dirname(__FILE__), '../templates/pages/page.mustache')
      end
      
      def title
        @page.title
      end
    end
  end
end

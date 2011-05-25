class FelixBellanger::Pages
  module Views
    class Layout < Mustache
      def self.template_file
        File.join(File.dirname(__FILE__), '../templates/layout.mustache')
      end

      def template_tags
        html = ''
        %w{pages/page posts/index posts/post}.each do |template|
          template_file = File.open(File.join(File.dirname(__FILE__), '..', 'templates', "#{template}.mustache"), "rb")
          template_name = template.sub(/\//, '-')
          html = html + "<script type=\"text/x-mustache-template\" id=\"#{template_name}\">\r\n" + CGI::escapeHTML(template_file.read) + "</script>\r\n"
        end
        return html
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

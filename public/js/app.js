/* Author: 
- Félix Bellanger <felix.bellanger@gmail.com>
*/

var app = Davis(function() {

  this.get('/', function(req) {
    req.redirect('/blog');
  });

  this.get('/blog/?(:page)?', function(req) {
    if (!req.isForPageLoad) {
      $.getJSON(req.path, function(res) {
        // set title
        document.title = "Felix Bellanger / Blog";

        // change content
        $('#main').fadeOut('fast', function() {
          
          var source = $('<div/>').html($('#posts-index').html()).text();
          var template = Handlebars.compile(source);

          $('#main').empty();
          $('#main').append(template({ items: res.items, pagination: { current_page: res.current_page, total_pages: res.total_pages } }));
          $('#main').fadeIn('fast');

        });
      });
    }
  });

  this.get('/blog/:year/:month/:day/:slug', function(req) {
    if (!req.isForPageLoad) {
      $.getJSON(req.path, function(res) {
        // set title
        document.title = "Felix Bellanger / " + res.title;

        // change content
        $('#main').fadeOut('fast', function() {
          
          var source = $('<div/>').html($('#posts-post').html()).text();
          var template = Handlebars.compile(source);

          $('#main').empty();
          $('#main').append(template({ post: res }));
          $('#main').fadeIn('fast');

        });
      });
    }
  });

  this.get('/about', function(req) {
    if (req.isForPageLoad == false) {
      $.getJSON(req.path, function(res) {
        // set title
        document.title = "Felix Bellanger / About";

        // change content
        $('#main').fadeOut('fast', function() {
        
          var source = $('<div/>').html($('#pages-page').html()).text();
          var template = Handlebars.compile(source);

          $('#main').empty();
          $('#main').append(template(res));
          $('#main').fadeIn('fast');
        
        });
      });
    }
  });

});

app.start();


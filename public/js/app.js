/* Author: 
- Félix Bellanger <felix.bellanger@gmail.com>
*/

var app = Davis(function() {

  this.get('/', function(req) {
    req.redirect('/blog');
  });

  this.get('/blog', function(req) {
    if (!req.isForPageLoad) {
      $.getJSON(req.path, function(res) {
        // set title
        document.title = "Felix Bellanger / Blog";

        // change content
        $('#main').animate({ left: '+=960' }, function() {
          
          var source = $('<div/>').html($('#posts-index').html()).text();
          var template = Handlebars.compile(source);

          $('#main').css({ left: '-960px' }).empty();
          $('#main').append(template(res));
          $('#main').animate({ left: '+=960' });

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
        $('#main').animate({ left: '-=960' }, function() {
          
          var source = $('<div/>').html($('#posts-post').html()).text();
          var template = Handlebars.compile(source);

          $('#main').css({ left: '960px' }).empty();
          $('#main').append(template(res));
          $('#main').animate({ left: '-=960' });

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
        console.log(res);
      });
    }
  });

});

app.start();


/* Author: 
- Félix Bellanger <felix.bellanger@gmail.com>
*/

var app = Davis(function() {

  this.get('/', function(req) {
    req.redirect('/blog');
  });

  this.get('/blog', function(req) {
    $.getJSON(req.path, function(res) {
      console.log(res);
    });
  });

  this.get('/blog/:year/:month/:day/:slug', function(req) {
    $.getJSON(req.path, function(res) {
      console.log(res);
    });
  });

  this.get('/about', function(req) {
    $.getJSON(req.path, function(res) {
      console.log(res);
    });
  });

});

app.start();


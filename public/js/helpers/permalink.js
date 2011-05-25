/* Author: 
- Félix Bellanger <felix.bellanger@gmail.com>
*/

Handlebars.registerHelper('permalink', function() {

  var date = new Date(this.created_at);
  return "/blog/" + date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate() + "/" + this.slug;

});


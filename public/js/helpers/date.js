/* Author: 
- Félix Bellanger <felix.bellanger@gmail.com>
*/

Handlebars.registerHelper('date', function() {

  return strftime("%B %d, %Y", new Date(this.created_at)); 

});


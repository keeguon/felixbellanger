/* Author: 
- Félix Bellanger <felix.bellanger@gmail.com>
*/

Handlebars.registerHelper('previous_page', function() {

  if (this.current_page != 1) {
    var previous_page = (this.current_page == 2) ? '' : (this.current_page - 1);
    return '<p class="left"><a href="/blog/' + previous_page + '">&larr; Previous page</a></p>';
  }

});

Handlebars.registerHelper('next_page', function() {

  if (this.current_page != this.total_pages) {
    return '<p class="right"><a href="/blog/' + (this.current_page + 1) + '">Next page &rarr;</a></p>';
  }

});


#!/usr/bin/env ruby

JS_FILES = [

  # Libraries
  File.join(File.dirname(__FILE__), "mylibs", "underscore.js"),
  File.join(File.dirname(__FILE__), "mylibs", "backbone.js"),
  File.join(File.dirname(__FILE__), "mylibs", "handlebars.js"),
  File.join(File.dirname(__FILE__), "mylibs", "davis-0.4.3.js"),
  File.join(File.dirname(__FILE__), "mylibs", "strftime.js"),

  # Helpers
  File.join(File.dirname(__FILE__), "helpers", "date.js"),
  File.join(File.dirname(__FILE__), "helpers", "permalink.js"),
  File.join(File.dirname(__FILE__), "helpers", "will_paginate.js"),

  # Models
  File.join(File.dirname(__FILE__), "models", "page.js"),
  File.join(File.dirname(__FILE__), "models", "post.js"),

  # Views
  File.join(File.dirname(__FILE__), "views", "pages.js"),
  File.join(File.dirname(__FILE__), "views", "posts.js"),
  
  # Application
  File.join(File.dirname(__FILE__), "app.js"),

]

JS_FILES.each { |file| puts File.open(file, "rb").read }


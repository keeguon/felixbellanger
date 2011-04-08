# Felix Bellanger

After testing a bunch of different micro-framework, since the website doesn't need to be built w/ a big framework cause there's not that much features (pages & articles). I finally settled in for Sinatra because it is fairly fast, well not as fast as ExpressJS maybe but not that I don't have trust in nodejs but it's just that it is relatively new compared to ruby and rack based frameworks so that's why I finally opted for Sinatra. By the way I also tried the freshly built PHP micro-framework calle Silex based on Symfony2 components but it was kind of slow, especially after integrating Doctrine to map my objects.

## Requirements

* bundler
* rack (obviously)
* sinatra
* an ORM, I would personally go for datamapper if you have a SQL flavored database, here I'm using mongoid since I use MongoDB as a data store
* a webserver, rackup is okay but not very efficient in production so I would probably say go for thin or unicorn


My Résumé
=========

This is a [middleman][] project for my résumé. I feel that a 
Rails project with MySQL is massively inefficient, and 
my old HTML/CSS version was just as bad.

Feel free to fork this if you want to build your own, but 
I'd wait a bit. It's still missing a bunch of features 
that I'd like to support, and the data structure 
isn't quite ready. 

I'm still in the middle of converting my old markup to 
the [hresume microformat][hresume].

So read on if, despite the forewarning, you still want to... 

Build Your Own
--------------

I'm using [rvm][] and [bundler][], so copy the .rvmrc-example file to .rvmrc and 
the thing where you `cd` out and `cd` back in...

Run `gem install bundler && bundle install`

All the resume data is inside the site/data/resume.yaml file.

The summary and bio fields are all post processed with Maruku, an 
implementation of Markdown.

Rake Tasks
----------

There are a couple Rake tasks set up [thanks to scottwb](http://scottwb.com/blog/2012/02/24/middleman-deployment-rakefile)

Just cd into the `site` directory and you can run these commands

- `rake preview` - to start the server
- `rake build` - to build the site
- `rake deploy` - uses rsync to copy your build to a server
- `rake gen_deploy` - builds then rsyncs

(if you're using bundler, you'll want to prefix each of those rake commands with a `bundle exec` like `bundle exec rake preview`)


Licenses
--------

Middleman and some code I pulled from Rails are MIT Licensed

[bundler]: http://gembundler.com/
[rvm]: http://beginrescueend.com/
[middleman]:   http://middlemanapp.com/
[hresume]: http://microformats.org/wiki/hresume
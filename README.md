My Résumé
=========

This is a [nanoc][] project for my résumé. I feel that a 
Rails project with MySQL is massively inefficient, but 
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

You'll need to install Haml, Compass, JSMin, Maruku, and nanoc gems.

All the resume data is inside the config.yaml file.

The summary and bio fields are all post processed with Maruku, an 
implementation of Markdown.


Licenses
--------

nanoc3 and some code I pulled from Rails are MIT Licensed


[nanoc]:   http://nanoc.stoneship.org/
[hresume]: http://microformats.org/wiki/hresume
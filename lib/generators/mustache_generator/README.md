## Rails 3 Generators for Mustache

The generators provided are experimental and incomplete. [Mustache](http://github.com/defunkt/mustache) support for [Rails 3](http://weblog.rubyonrails.org/2010/6/8/rails-3-0-beta-4-now-rc-in-days) is [still developing](http://github.com/defunkt/mustache/issues/#issue/3), and we will be updating these generators as that support comes into focus.

I'm assuming that the Mustache template engine that gets the official blessing will expect to find files where Chris W. and others have suggested the files should go. I.e. the files for widget views would go in:

* app/views/widgets/action.rb for view class definitions
* app/templates/widgets/action.html.mustache for templates

### To Do

* View Class Scoping so that we don't have a million ShowView classes
* Form support
* Partials
* Template use

### Thanks

Thanks to Louis T. for running the umbrella Rails 3 Generators project and giving me pointers on writing generators. 
Thanks also to Jos&eacute; Valim, Paul Barry, and Jeremy McAnally for good information.

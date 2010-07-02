## Rails 3 Generators for Mustache

[Mustache](http://github.com/defunkt/mustache) support for [Rails 3](http://weblog.rubyonrails.org/2010/6/8/rails-3-0-beta-4-now-rc-in-days) is [still developing](http://github.com/defunkt/mustache/issues/#issue/3). Following the work of others, I have built a provisional template handler that is included with these generators. To install it in your project, `rails g mustache:install`

I'm assuming that the Mustache template engine that gets the official blessing will expect to find files where Chris W. and others have suggested the files should go, so I have built my generators and provisional template handler accordingly. I.e. the files for widget views go in:

* app/views/widgets/action.rb for view class definitions
* app/templates/widgets/action.html.mustache for templates


### To Do

* Enable mustache layout usage (uses default application.erb for now)
* Add controller-retrofit generator to build default mustache views for existing controllers
* Generate different fields for different attribute types
* Helper generation for leaner view files

### Thanks

* Louis T. for running the umbrella Rails 3 Generators project and giving me pointers on writing generators. 
* Paul Barry for invaluable help figuring out how Rails template handlers work.
* Jos&eacute; Valim, Paul Barry, and Jeremy McAnally for good information.

# USAGE 
1. Clone
2. Navigate to directory
3. Bundle Install
4. Run rake db:migrate
5. Run shotgun
6. ???
7. Profit


# Sinatra Project Objectives
1.  Use Sinatra to build the app
	```
    Used Sinatra Gem to create MVC CRUD app

2.  Use ActiveRecord for storing information in a database
	```
    Created Migrations and used ActiveRecord for the DB using Rake

3.  Include more than one model class (Include at least one has_many relationship on your User model, Include at least one belongs_to relationship on another model)
	```
    Using four Models User has_many Decks, Deck has_many Cards, Card has_many Notes. Each belongs to the class above.

4.  Include user accounts with unique login attribute
	```
    User Email is validated as unique identifier.

5.  Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (Ensuring that users can't modify content created by others using authentification.)
	```
    Each user has CRUD Capabilities that only they can perform CRUD actions on.

7.  Include user input validations
	```
    Used validations at the model level as well as additional validations in controller.

8. BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
	```
    Used Flash to show errors and other banners.


# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/atencioluke/indecks. This project is intended to be a safe, welcoming space for collaboration.


# Authors

* **Luke Atencio**


# License

The app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# Acknowledgements

* [Bootstrap](https://getbootstrap.com/) - Making Frontend look easy

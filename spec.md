# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - I used Sinatra to build the InDecks application.
- [x] Use ActiveRecord for storing information in a database - I used activerecord to create a database that would integrate with my models.
- [x] Include more than one model class (e.g. User, Post, Category) - I created a User, Deck, Card, and Note model for my application.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has many Decks, Deck has Cards, Card has many notes
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Deck belongs to User, Card belongs to Deck, Note belongs to Card
- [x] Include user accounts with unique login attribute (username or email) - used email as unique login attribute
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - CRUD capabilities used at 3 levels, decks, cards, and notes.
- [x] Ensure that users can't modify content created by other users - authentification used to determine if content belongs to user through modified slug method
- [x] Include user input validations - Input validations used to ensure unique users, every object is created with valid info, and Deck can't have duplicate name within a specific users account.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - Used Flash to show errors and success
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

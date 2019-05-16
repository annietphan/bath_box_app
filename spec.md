# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
      [wrote migrations & models with ActiveRecord to store in database]
- [x] Include more than one model class (e.g. User, Post, Category)
      [have 3 model classes: User, Box, Product]
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
      [have +1 has_many relationships: User has_many Boxes, Boxes has_many Products, etc.]
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
      [Box belongs_to User & join table has 2 belongs_to relationships]
- [x] Include user accounts with unique login attribute (username or email)
      [user account validates uniqueness of email]
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
      [can CRUD the box resource]
- [x] Ensure that users can't modify content created by other users
      [if/else statements written in the edit route in box controller]
- [x] Include user input validations
      [if/else statements to ensure all params are filled out before moving on]
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

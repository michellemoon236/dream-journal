Specifications for the Sinatra Assessment

Specs:

 [x]  Use Sinatra to build the app - I used gem Sinatra and controllers inherit from Sinatra
 [x]  Use ActiveRecord for storing information in a database - My models and db use Active Record
 [x]  Include more than one model class (e.g. User, Post, Category) - I have 4 models
 [x]  Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User, Category, Dream models all have has many relationships
 [x]  Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Dream model has belongs to relationship
 [x]  Include user accounts with unique login attribute (username or email) - In the User Controller and model, I included user accounts with login
 [x]  Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Dream resource has routes for CRUD
 [x]  Ensure that users can't modify content created by other users - Users can only see and modify dreams they have created
 [x]  Include user input validations - I included validation where empty strings from user cannot be accepted
 [x]  BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - I used rack flash3 gem to display error messages
 [x]  Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - I have included a README


Confirm

 [x] You have a large number of small Git commits
 [x] Your commit messages are meaningful
 [x] You made the changes in a commit that relate to the commit message
 [x] You don't include changes in a commit that aren't related to the commit message
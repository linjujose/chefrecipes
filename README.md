# README

* Rails 5.0.7.2

* Ruby 2.7.1

* Create a home route

* Add bootstrap framework to the app

* Create Navbar for the home page

* Create footer and its CSS classes

* Create models for chef and recipe

* Add validations using TDD

* Add chef_id(foreign key) to recipes

* Chef-Recipes 1:many association

* Flesh out standard endpoints for recipes by adding resource in Routes:
```
Prefix     |     VERB  |  URI Pattern    |    Controller#Action 
------           ----     -----------         -----------------
*  recipes        GET      /recipes            recipes#index
*  new_recipe     GET      /recipes/new        recipes#new         #display a form
*                 POST     /recipes            recipes#create      #submit info from the form
*  edit_recipes   GET      /recipes/:id/edit   recipes#edit        #display edit form
*                 PATCH    /recipes/:id        recipes#update      #submite edited form
*  recipe         GET      /recipes/:id        recipes#show        #show one requested recipe
*                 DELETE   /recipes/:id        recipes#destroy     #delete specified recipe
```
* Gravatar support to chefs

* Forms to create and edit a recipe

* Implement the delete and list recipes routes

* Add password digest to chefs

* Implement Chef signup

* Chef profile show page

* Edit Chef profile

* Pagination of listings

* Delete Chef cascaded with their recipes

* Authentication/Login session

* Admin role page and tests

* Ingredient model and m:m associations

* Comments table and their associations with recipe and chef

* Add Comments to show recipe page

* Add Ingredients to recipe views

* ...

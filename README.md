# README

Steps:

* ...

* Rails 5.0.7.2

* Ruby 2.7.1

* ...

* Create a home route

* Add bootstrap framework to the app

* Create Navbar for the home page

* Create footer and its CSS classes

* Create models for chef and recipe

* Add validations using TDD

* Add chef_id(foreign key) to recipes

* Chef-Recipes 1:many association

* Flesh out standard endpoints for recipes by adding resource in Routes:

Prefix         VERB     URI Pattern         Controller#Action
------         ----     -----------         -----------------
*  recipes        GET      /recipes            recipes#index
*  new_recipe     GET      /recipes/new        recipes#new         #display a form
*                 POST     /recipes            recipes#create      #submit info from the form
*  edit_recipes   GET      /recipes/:id/edit   recipes#edit        #display edit form
*                 PATCH    /recipes/:id        recipes#update      #submite edited form
*  recipe         GET      /recipes/:id        recipes#show        #show one requested recipe
*                 DELETE   /recipes/:id        recipes#destroy     #delete specified recipe

* Add index and show pages

* Added gravatar support to chefs

* ...

* Product resource
   * Add testing?
   * Remove unused files
* Unit resource
   * Add testing?
   * Remove unused files
* Dish resource
   * Determine how to prepopulate new form when creation request fails without reloading the page (local: true - would this require JS?) or changing the URL
      * Is the page reloading right now?
   * Add links from index to show
   * Add update view where items can be added to recipes
   * Require recipe or recipe_url?
* DRY up partials and controllers
* Look into plurals (inflection?)
* Add page to create a new dish
* Add association methods to models (what do I need at this point?)
* Consider adding stricter validation for models (such as permitting only lowercase characters in name fields)
* Add ShoppingList model
* Flesh out models
* Create web interface so that I can input products, units, items, and dishes through a GUI rather than just the command line (use downshift?)
* Add linter

Helpful resources:
* [Minitest](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-minitest)

* Product resource
   * Add testing?
   * Remove unused files
* Unit resource
   * Add testing?
   * Remove unused files
* Dish resource
   * Add edit view where items can be added to recipes
      * Indicate to user whether item was successfully created (not just through HTTP status code)
      * Improve UI (or wait until I adopt a front-end framework)
      * Allow fractional quantities (not just decimals)
   * Show list of items on show and edit views
   * Require recipe or recipe_url?
* DRY up partials and controllers
* Figure out what to do when I want to create items without dishes
   * Should I change the ItemsController? Rename it (perhaps to DishItemsController) and create a new controller? Review https://guides.rubyonrails.org/routing.html#nested-resources
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

* Read "Getting Started" to make sure I'm not missing any key Rails concepts: https://guides.rubyonrails.org/getting_started.html
* Product resource
   * Add testing?
   * Remove unused files
* Unit resource
   * Add testing?
   * Remove unused files
* Dish resource
   * Add edit view where items can be added to recipes
      * Improve UI (or wait until I adopt a front-end framework)
      * Allow fractional quantities (not just decimals)
   * Require recipe or recipe_url?
* DRY up partials and controllers
* Figure out what to do when I want to create items without dishes
   * Should I change the ItemsController? Rename it (perhaps to DishItemsController) and create a new controller? Review https://guides.rubyonrails.org/routing.html#nested-resources
   * Should I just add a new route pointing to ItemsController#create and tell the create method what to do when there is no dish_id param? Or just modify item_params so it's the method that finds the dish (if any)?
* Make item lists more legible
   * Simplify how numbers are shown
   * Look into plurals (pluralize method)
* Add association methods to models (what do I need at this point?)
* Consider adding stricter validation for models (such as permitting only lowercase characters in name fields)
* Add ShoppingList model
* Flesh out models
* Create web interface so that I can input products, units, items, and dishes through a GUI rather than just the command line (use downshift?)
* Add linter

Helpful resources:
* [Minitest](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-minitest)

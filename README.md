# Dinder

The goal of Dinder (Tinder for dinner - it's a working title) is to simplify meal planning so that you can focus on making and eating delicious food with your loved ones - not on finding recipes and writing shopping lists.

I'm building this project from the ground up, both for my own use and to grow as a developer.

## User experience

While the details are subject to change, I'm currently aiming for an experience along these lines:

1. You, the user, enter the number of days you want recipes for
1. Dinder shows you a suggested menu
1. For each suggested meal, you choose whether to...
   * Keep the suggestion
   * Search for another recipe to replace it
   * Ask Dinder to suggest something else
1. For each meal you select, you enter the number of servings you want to prepare
1. Dinder gives you a shopping list (ideally grouping together items that are likely to be in the same section of the grocery store)
1. If desired, you revise the shopping list
   * For example, you might want to cross off any items that you already have in your kitchen or adjust the quantities.
1. As you shop at the store, you cross items off your list
   * This feature should work offline.

The experience should be available on any device - not just desktop or just mobile.

## Factors Dinder might consider when suggesting a menu
* Variety (not repeating the same recipe or type of cuisine too frequently)
* Your personal preferences
* Prep time
* Nutrition
* The time of year (season, holidays)

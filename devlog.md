## 22 February 2021
Started repository
Noted associations, created sections in dev log for bug hunt, requirements, etc. 

## 23 February 2021
Added license
Added an assload of migrations and some notes to the project about labs to look at and scope to work on right now, vs things included in the migration for future development.
Added routes, tentatively, including nested routes
Added css and minor styling to application layout, added a static controller for the index page and in case of further need for static pages, maybe one on sources, maybe one with citation formatting, IDK.
Added some rspec tests on account of the damn local server not working, stubbed out projects controller and project views 
Filled out the Readme. 

## 24 February 2021
Added basic controllers for all models. 
Topped off basic views with partial for Projects

## 25 February 2021
Added user/sessions controller and views, user migration, user model, partially coded each
(Go over this to make sure all the code works, you were definitely not awake)

## 26 February 2021
Adding List and Item controllers, views, relationships, tweaking routes a bit.

## 3 March 2021
Built List and Item views
Added destroy method to Projects, Lists, Items controllers
Built tests for List and Item views, passed tests

## 4 March 2021
Built Add Topic form as a partial, added to Project show view
Built topic display method on Project show view, added if function to show links to the lists if they exist and "add a list for this topic" if they don't.
Built tests for Project show view 

## 5 March 2021
Went over Items, Lists controllers
Cleaned up Item, List models
Added name_with_project method to Topic model
Cleaned up Items, Lists views
Cleaned up Project view and controller
Wrote tests for Items, Lists, and Projects
Went over app flow
Began writing Sources views, added a couple routes for paid/free specific Source index views
Wrote a couple tests for Sources to make sure the check box/boolean process worked as advertised (it does)

## 9 March 2021
Added validations to User model no clue what I was thinking
Added outline of omniauth method. Yuck. Omniauth. 

## 23 March 2021
Added destroy methods for Items, Topics
Added scope methods for Sources
Reviewed code
Bug Hunted the Log In page

## May 13 2021
Started making it. Had a breakdown. Bon Appetit.

Reworked the project creation page to require sign in so there aren't loose projects floating around
Bug Hunted the Sign Up page
Bug Hunted the User Profile page
Added 'genres' field to Project
Added 'display_name' field to User
Added 'View my Profile' to User Profile page
Enacted functionality to Log Out button
Added 'Delete' button and functionality to Project page. 
Restricted 'Edit' and 'Delete' button, 'Add a Topic' button on Project page to Project user (TEST THIS)
Added user_id to Projects schema. We will not discuss how I missed this. 
Unexpected debug for topics without projects. 

## May 14 2021
Edited create method for Project to attach it to the current user creating the project
Edited delete method for Project to delete all associated topics, since topics are more directly related to projects than lists
Created a page for public lists, had to do it off the static page, maybe look into why and how to make it a little easier? If there is a way.
Created a page (lists_index) for the user's lists only, both public and private.

## MAY 17 2021
Started a cleanup tag for future reference 
Updated List creation to require that the list also be assigned to a Topic, so it has a Project, so it has a User.
Due to Bugs (see project notes: bug hunt) and general design paradigm, new source page relocated to its own publicly available page.
Checked functionality of Source show, new, and edit pages; all good. (New fields to be added)

## May 18 2021
Added hours and description field to Source page, added a stretch goal for an address field
Checked functionality of Source index, paywall, and free pages, all good.
Added sort method to Source page, free and paywall pages to sort by alphabetical order.
Changed Topic display format from Topic name - List name to Topic Name - Wish List/Create a Wish List for clarity
Removed artifact "Genres" from User show page 
Cosmetic cleanup on User show page and User and Project edit pages
Cosmetic cleanup on Item form page to indicate what list the item is going onto. Just for clarity's sake.
Debugged the Edit an Item link/page/path, etc. 
Checked functionality of source pick checkbox method
Added 'Add a Source' field
Debugged 'Add a Source' field

## May 19 2021
** Cosmetic updates to Item show page ugh
** OMNIAUTH. DOUBLE UGH.
** check cosmetics
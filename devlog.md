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
## To-Do
-- Check boolean validations? Maybe I don't, really. It's got to be either true or false. Eh, give this some more thought. 
-- Dig up that stupid pluralize count method format thingie, it can be applied to projects for how many lists they have.
-- SessionsController: new, create, home? methods, home == root, but since that's on static that may not be necessary
-- UsersController: new, create
-- To associate in the create function: list.items.build, if list.items.valid? list.items.save. Maybe. 

## Plan 
A User has_many projects
A User has_many lists, through projects
A Project has_many lists, through topics
A List has_many projects, through topics
A Topic belongs_to a list and belongs_ to a project
An Item belongs_to a list and has_many attributes; items should be formulated to be as broad as possible: articles, films, tv episodes, vlogs, blogs, books, etc. 
A Source has_many Items
An ItemSource belongs_to an item and belongs_to a source.

t.timestamps null: false = datetimes created_at and updated_at
Project: name(string), description(string), summary(text)
List: name(string), public(boolean)
Topic: name(string)
Item: name(string), material(string, i.e. book, movie, tv episode), publication_date(integer), creator(string, or editor, etc), list(belongs_to)
Source: name(string), fee(boolean, default: true), location(string, e.g. a url or "physical resource" or something), contact(string)
ItemSource: source_id, item_id

DO NOT do anything with the public boolean just yet, eventually there will be a method that detects whether it's false or true and sets everything to visible or requires auth to see but right now just leave it at false and wait for the verification section before doing anything with it. 

Labs to look at: 
Forms and basic associations lab
Displaying has many through reading
Modification nested routes reading

## Requirements
Use the Ruby on Rails framework.

-- Your models must:
    • Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships
    -- A user has_many lists, through projects
    -- Projects/Topics/Lists
    -- Items/ItemSources/Sources
    -- A project belongs_to a user
    -- A user has_many projects.
    -- Among others.
    • Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user
    -- A project has_many lists, through topics, and vice versa. 
    -- The topic must have a name
-- Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
    -- Lots of presence validations, not sure about format validation
-- You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).
    -- still need to find where this makes sense to put
-- Your application must provide standard user authentication, including signup, login, logout, and passwords.
    -- Next bit to learn, but yes.
-- Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...
    -- Ugh. Omniauth
-- You must include and make use of a nested resource with the appropriate RESTful URLs.
    • You must include a nested new route with form that relates to the parent resource
    -- lists/list-id/items/id
    • You must include a nested index or show route
    -- lists/list-id/items?
-- Your forms should correctly display validation errors.
    a. Your fields should be enclosed within a fields_with_errors class
    b. Error messages describing the validation failures must be present within the view.
    -- Review this in guilds in beta
-- Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.
    • Logic present in your controllers should be encapsulated as methods in your models.
    • Your views should use helper methods and partials when appropriate.
    • Follow patterns in the Rails Style Guide and the Ruby Style Guide.
    That's fine, that's usually how I naturally code anyway.
    Still fine

## BUG HUNT

## Stretch Goals
-- Add boolean attribute to projects: active/inactive, give user the ability to toggle on and off
-- Build boolean attribute in lists: public/private, give user ability to toggle on and off


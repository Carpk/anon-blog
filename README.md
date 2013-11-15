anon-blog
=========

1
Blog 1: Anonymous Blog Challenge
Started

Edit this gist »
 
Objectives
Comments
We're going to write a simple homepage with a blog. This will be our first many-to-many relationship inside the context of Sinatra. Later, we'll integrate user authentication.

Do the Sinatra sandbox challenge first if you don't feel comfortable with the flow of a web application or how forms send data to the server.

We'll have two core models: posts and tags. A post can have many tags and a tag can be on many posts.

Here is our trusty sinatra skeleton for you to use.

Learning Goals
Many-to-many associations in ActiveRecord.
How to use multiple files for controller routes.
ActiveRecord validations.
Objectives
Controllers & Routes
Think about your controllers and routes. Consider making three controller files:

app/controllers/index.rb
app/controllers/posts.rb
app/controllers/tags.rb
The index controller will just have the index route, displaying your homepage. All Post-related routes will go in the posts controller and all Tag-related routes will go in the tags controller.

These are the operations we want to support for posts:

Show me all posts
Show me a particular post
Create a new post
Edit an existing post
Delete an existing post
These are the operations we want to support for tags:

Show me all posts with a given tag
Tags will be created via the Post-creation form.

Models & Validations
Create all the necessary models and migrations to support the above. You should have three models — what are they?

Add the appropriate validations to your models. Read the Rails guide to ActiveRecord validations for reference.

For example, if your Post model has body and title fields, you probably don't want to permit a Post that has no body or title to be saved to the database. This means adding NOT NULL constraints to the migrations and the following validations to your ActiveRecord model:

class Post < ActiveRecord::Base
  validates :body, :presence => true
  validates :title, :presence => true
end
You'll have other fields and validations, to be sure. What fields do you want your blog post to have? Author?

Design Simple Pages and Forms
Design simple pages and forms to implement all the above functionality. It doesn't need to be styled well, but if your HTML is well-structured it will make it easier to style later.

Your forms for creating and updating Post models should allow you to enter tags. You can decide how that works, although from a user experience perspective it would be incredibly tedious to have to create tags elsewhere before a post author can use them. However, if a post author uses a tag that already exists, you aren't going to want to create a new row in the tags table, but rather re-use the already-existing tag.

One idea might be to permit them to enter tags like this:

<label for="post_tags">Tags:</label>
<input id="post_tags" name="post[tags]" value="tag1, tag2, some other tag, a fourth tag">
which renders as:

Tags:


All your routes should now implement their basic functionality. You should be able to list, show, create, update, and delete posts. You should also be able to see all posts for a given tag at a url like

http://localhost:9393/tag/apple
Error Cases
Using valid? and invalid? and the errors methods, make sure you're handling your error cases gracefully. It doesn't need to be perfect, but good error handling means:

When a user makes a mistake or breaks some rule, they're informed
The user is presented with an opportunity to correct the mistake, if possible
The user is given as much guidance as possible about that they need to do to fix the error
Style! Style! Style!
You might want to do the Layout Drill: Proper Typesetting first, if you haven't. But following the guidelines from that challenge, spruce up your blog design.

If you have time, try to make it something you're proud to look at.


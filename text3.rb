94 lines (76 sloc)  3.67 KB
# Intermediate Assignment 1                                                                                                                #
#
# require the presence of name and description for the blog
# require the presence of title and content for the posts, require the title to be at least 7 characters long
# require author and message for the messages.  Require the message to be at least 15 characters long.
# Using the console
#
# create 5 new blogs
# create several posts for each blog
# create several messages for the first post
# know how to retrieve all posts for the first blog
# know how to retrieve all posts for the last blog (sorted by title in the DESC order)
# know how to update the first post's title
# know how to delete the third post (have the model automatically delete all messages associated with the third post when you delete the third post)
# know how to retrieve all blogs
# know how to retrieve all blogs whose id is less than 5
# think of other potential information you may need for this application and get comfortable being able to pull information using the console

rails new Blogspot -d mysql
rails g model blog name:string description:text
rails g model post title:string content:text blog:references
rails g model message author:string message:text post:references
rake db:create
rake db:migrate

implementation:

1. Blogs
   validates :name, :description, :presence => true

2. Posts
   validates :title, :content, :presence => true
   validates :title, :length => { :minimum => 7 }

3. Messages
   validates :author, :message, :presence => true
   validates :message, :length => {:minimum => 15}

Using the console:
1. Blog.new(:name => "Blog1", :description => "First Blog").save
   Blog.new(:name => "Blog2", :description => "Second Blog").save
   Blog.new(:name => "Blog3", :description => "Third Blog").save
   Blog.new(:name => "Blog4", :description => "Forth Blog").save
   Blog.new(:name => "Blog5", :description => "Fifth Blog").save

2. p = Blog.find(1)
   p.posts.create(:title => "Title 1", :content => "Lorem ipsum")
   p.posts.create(:title => "Title 2", :content => "Lorem ipsum")
   p.posts.create(:title => "Title 3", :content => "Lorem ipsum")
   p = Blog.find(2)
   p.posts.create(:title => "Title 1", :content => "Lorem ipsum")
   p.posts.create(:title => "Title 2", :content => "Lorem ipsum")
   p.posts.create(:title => "Title 3", :content => "Lorem ipsum")
   p = Blog.find(3)
   p.posts.create(:title => "Title 1", :content => "Lorem ipsum")
   p.posts.create(:title => "Title 2", :content => "Lorem ipsum")
   p.posts.create(:title => "Title 3", :content => "Lorem ipsum")
   p = Blog.find(4)
   p.posts.create(:title => "Title 1", :content => "Lorem ipsum")
   p.posts.create(:title => "Title 2", :content => "Lorem ipsum")
   p.posts.create(:title => "Title 3", :content => "Lorem ipsum")
   p = Blog.find(5)
   p.posts.create(:title => "Title 1", :content => "Lorem ipsum")
   p.posts.create(:title => "Title 2", :content => "Lorem ipsum")
   p.posts.create(:title => "Title 3", :content => "Lorem ipsum")

3. p = Post.find(1)
   p.messages.create(:author => "Author 1", :message => "Lorem ipsum dolor sit amet")
   p.messages.create(:author => "Author 2", :message => "Lorem ipsum dolor sit amet")
   p.messages.create(:author => "Author 3", :message => "Lorem ipsum dolor sit amet")

4. Post.all.where(blog_id: 1)

5. Post.all.where(blog_id: 5).order(title: :desc)

6. p = Post.first
   p.title = "New Title"
   p.save

7. class Post < ActiveRecord::Base
   belongs_to :blog
   validates :title, :content, :presence => true
   validates :title, :length => { :minimum => 7 }

   has_many :messages, :dependent => :destroy
   end

   Post.delete(3)

8. Blog.all

9. Blog.where('id < 5')
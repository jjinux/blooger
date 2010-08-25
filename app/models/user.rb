class User < ActiveRecord::Base
  attr_accessible :username, :blog_title
end
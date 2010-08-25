class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :username, :blog_title, :password, :password_confirmation
end
class User < ActiveRecord::Base
  acts_as_authentic
  validates_presence_of :blog_title
  attr_accessible :username, :blog_title, :password, :password_confirmation
  strip_attributes!
  has_many :posts
end
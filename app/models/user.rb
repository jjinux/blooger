class User < ActiveRecord::Base
  acts_as_authentic
  validates_presence_of :bloog_title
  attr_accessible :username, :bloog_title, :password, :password_confirmation
  strip_attributes!
  has_many :posts, :order => "created_at desc"
end
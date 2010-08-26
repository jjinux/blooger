class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  attr_accessible :title, :body
  strip_attributes!
  belongs_to :user
end
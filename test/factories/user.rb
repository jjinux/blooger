Factory.define :user do |u|
  u.username 'joe'
  u.password 'somepassword'
  u.password_confirmation 'somepassword'
  u.blog_title "Joe's Blog"
end
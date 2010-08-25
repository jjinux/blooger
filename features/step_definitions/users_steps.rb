# Call "Factory user" and cache the results in the @users hash.
#
# user should be a symbol.
#
# This function serves two purposes.  First of all, it prevents the same
# user from being passed to Factory twice, which would cause an error.  Second
# of all, it returns the original factory object rather than looking up the
# record in the database.  That's important because you can't get the password
# out of the database, and if you can't get the password out of the database,
# you can't use it to log into the site in your tests.
def user_factory(user)
  user = user.to_sym  # Just to be sure.
  @users ||= {}
  @users[user] ||= Factory user
end
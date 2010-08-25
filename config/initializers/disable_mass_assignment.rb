# Force every model to make use of attr_accessible.
# See: http://railspikes.com/2008/9/22/is-your-rails-application-safe-from-mass-assignment
ActiveRecord::Base.send(:attr_accessible, nil)
ActiveRecord::Base.send(:attr_accessible, :session_id)
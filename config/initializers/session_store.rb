# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blooger_session',
  :secret      => '486b2856624f5984947082ecbe88fb33818a6d180f4596e1804ab4e4ea80d8e00e46f892bfba44deca2fbff147d91eb2abba7b7c15dd37b351df148e45837ea5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

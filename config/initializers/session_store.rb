# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_social_library_session',
  :secret      => '3cf714d5e5e345b52eece076dd194e1d7a96198f8f56df77d40a95c7b1b81f4780cefa20e7ba3ce5f9869d882655d8b1d91581c08e25b77df9e85c8d8b01c771'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

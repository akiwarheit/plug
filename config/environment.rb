# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Plug::Application.initialize!

ENV['RAILS_ENV'] ||= 'production'
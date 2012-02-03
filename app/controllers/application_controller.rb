class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => "krabbe", :password => "cruise"
  protect_from_forgery
end

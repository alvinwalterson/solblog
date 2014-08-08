class SessionsController < Devise::SessionsController
	before_filter :get_locations
end
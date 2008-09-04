class WorkspacesController < ApplicationController
	
	acts_as_ajax_validation
	before_filter { |controller| controller.session[:menu] = nil }

  make_resourceful do
    actions :all
    
    before :show do
      session[:menu] = 'workspaces'
    end
    
    before :index do
      session[:menu] = 'items'
    end
    
    before :create do
      @current_object.creator = @current_user
    end
    
    before :update do
      # Hack. Permit deletion of all assigned users (with roles).
      params["workspace"]["existing_user_attributes"] ||= {}
    end
	end
	
end
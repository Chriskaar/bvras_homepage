 class Users::SessionsController < Devise::SessionsController

 before_filter :configure_sign_in_params, only: [:create]

  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?
    if resource.admin
    	redirect_to admin_path
    else
    	respond_with resource, location: after_sign_in_path_for(resource)
  	end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    yield if block_given?
    respond_to_on_destroy
  end

   protected

  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end

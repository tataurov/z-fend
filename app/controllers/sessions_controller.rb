class SessionsController < Devise::SessionsController
  layout :choose_layout

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location =>
        redirect_location(resource_name, resource)
  end

  private

  def choose_layout
    (request.xhr?) ? nil : 'application'
  end
end
class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy, :new, :create, :cancel]
  def new
    @asd = '11' 
    super
  end
  prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy, :new, :create, :cancel]
end

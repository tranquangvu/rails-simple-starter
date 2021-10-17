class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def after_sign_in_path_for(resource)
    resource.has_role?(:admin) ? admin_root_path : root_path
  end

  def not_authorized
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end
end

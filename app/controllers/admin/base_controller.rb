class Admin::BaseController < ApplicationController
  before_action :authenticate_user!, :authorize_access!

  layout 'admin'

  private

  def authorize_access!
    authorize(:access, :admin?)
  end
end

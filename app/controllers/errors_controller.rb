class ErrorsController < ApplicationController
  layout false

  def not_found
    respond_to do |format|
      format.html { render file: 'public/404.html' }
      format.json { render json: APIErrorSerializer.new(APIError::NotFoundError.new), status: :not_found }
    end
  end

  def unprocessable_entity
    respond_to do |format|
      format.html { render file: 'public/422.html' }
      format.json { render json: APIErrorSerializer.new(APIError::RequestRejectedError.new), status: :unprocessable_entity }
    end
  end

  def internal_server_error
    respond_to do |format|
      format.html { render file: 'public/500.html' }
      format.json { render json: APIErrorSerializer.new(APIError::InternalServerError.new), status: :internal_server_error }
    end
  end
end

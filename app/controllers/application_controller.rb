class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate_user!, only: :test

  def test
    render json: {
        data: {
            message: "Welcome #{current_user.email}",
            user: current_user
        }
    }, status: 200
  end
end

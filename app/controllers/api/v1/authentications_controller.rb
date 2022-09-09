class API::V1::AuthenticationsController < ApplicationController
  rescue_from ActiveRecord::ParameterMissing, with: :parameter_missing

  def create
    @user = User.find_by!(email: params.require(:email))
    if @user.authenticate(params.require(:password))
      render json: { token: JsonWebToken.encode(user_id: @user.id) }, status: :created
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def parameter_missing(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end
end

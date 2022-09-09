class Api::UsersController < ApplicationController
    before_action :authorize_request

    def index
        @users = User.all

        if @users.empty?
            render json: { error: "No users found" }, status: :not_found
        else
            render json: @users, status: :ok
        end
    end
end
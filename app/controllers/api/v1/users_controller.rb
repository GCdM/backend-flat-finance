class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { token: issue_token({ id: @user.id }) }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  def login
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      render json: { token: issue_token({ id: @user.id }) }
    else
      render json: { error: "That account doesn't exist, or username and password do not match" }
    end
  end

  def get_current_user
    if c_user
      render json: c_user
    else
      render json: { error: "Something went wrong! (get_current_user)" }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :household_id)
  end
end

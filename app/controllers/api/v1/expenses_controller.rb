class Api::V1::ExpensesController < ApplicationController
  before_action :set_user

  def index
    @expenses = @user.expenses

    render json: @expenses
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end

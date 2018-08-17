class Api::V1::ExpensesController < ApplicationController
  before_action :set_user

  # TEMPORARY!!!
  def index
    @expenses = @user.expenses

    render json: @expenses
  end
  # TEMPORARY!!!

  def create
    @expense = Expense.new(expense_params)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def expense_params
    params.require(:expense).permit(:user_id, :date, :purchase, :description, :amount)
  end
end

class Api::V1::ExpensesController < ApplicationController
  before_action :set_household

  def index
    @expenses = @household.expenses

    render json: @expenses, each_serializer: ExpensesSerializer
  end

  def create
    @expense = Expense.new(expense_params)
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:user_id, :date, :purchase, :description, :amount)
  end
end

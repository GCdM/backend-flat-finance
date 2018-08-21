class Api::V1::ExpensesController < ApplicationController
  
  def index
    @expenses = @household.expenses

    render json: @expenses, each_serializer: ExpensesSerializer
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      render json: @expense
    else
      render json: { error: @expense.errors.full_messages }
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:user_id, :date, :purchase, :description, :amount)
  end
end

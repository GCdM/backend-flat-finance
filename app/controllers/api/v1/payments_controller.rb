class Api::V1::PaymentsController < ApplicationController
  before_action :set_expense

  def index
    @payments = @expense.payments

    render json: @payments, each_serializer: PaymentsSerializer
  end

  private

  def set_expense
    @expense = Expense.find(params[:expense_id])
  end
end

class Api::V1::PaymentsController < ApplicationController

  def index
    set_expense
    @payments = @expense.payments

    render json: @payments, each_serializer: PaymentsSerializer
  end

  def update
    @payment = Payment.find(params[:id])
    @payment.update( paid: !@payment.paid)

    render json: @payment, each_serializer: PaymentsSerializer
  end
  private

  def set_expense
    @expense = Expense.find(params[:expense_id])
  end
end

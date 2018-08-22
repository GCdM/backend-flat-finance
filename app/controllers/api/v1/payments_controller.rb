class Api::V1::PaymentsController < ApplicationController

  def index
    set_expense
    @payments = @expense.payments
    puts "\n\n\n\n\n"
    puts "LOUIS LOOK HERE"
    puts "GETTING DOSE PAYMENTS"
    puts "TRUE PAYMENTS ARE #{@payments.select { |p| p.paid }.map { |p| p.user.username } }"
    puts "\n\n\n\n\n"
    render json: @payments, each_serializer: PaymentsSerializer
  end

  def update
    @payment = Payment.find(params[:id])
    # puts "\n\n\n\n\n"
    # puts "RISHI LOOK HERE"
    # puts "\n\n\n\n\n"

    @payment.update(paid: !@payment.paid)
    puts "\n\n\n\n\n"
    puts "RISHI LOOK HERE"

    puts "Made Payment paid on #{@payment.id} #{@payment.paid}!!"
    puts "DID PAYMENT WORK??? #{@payment.valid?}"
    puts "\n\n\n\n\n"
    render json: @payment.expense.payments, each_serializer: PaymentsSerializer
  end
  private

  def set_expense
    @expense = Expense.find(params[:expense_id])
  end
end

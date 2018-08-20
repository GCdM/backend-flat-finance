include ActionView::Helpers::NumberHelper

class User < ApplicationRecord
  belongs_to :household, optional: true
  has_many :expenses
  has_many :payments

  has_secure_password

  def debit
    debts = self.payments.select{ |payment| !payment.paid }
    debit = 0
    debts.each do |debt|
      debit += debt.amount
    end
    number_to_currency(debit, unit: "£ ")
  end

  def credit
    expenses = self.expenses.select{ |expense| !expense.settled? }
    credit = 0
    expenses.each do |expense|
      expense.payments.each do |payment|
        credit += payment.amount if !payment.paid
      end
    end
    number_to_currency(credit, unit: "£ ")
  end
end

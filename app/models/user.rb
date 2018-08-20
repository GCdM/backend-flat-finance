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
    debit
  end

  def credit
    expenses = self.expenses.select{ |expense| !expense.settled }
    credit = 0
    expenses.each do |expense|
      expense.each do |payment|
        credit += payment.amount if !payment.paid
      end
    end
  end
end

class Household < ApplicationRecord
  has_many :users
  has_many :expenses, through: :users

  def payments
    payments = []
    expenses = self.expenses
    expenses.each do |expense|
      expense.payments.each do |payment|
        payments << payment
      end
    end
    payments
  end
end

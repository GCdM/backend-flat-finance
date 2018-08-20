class Expense < ApplicationRecord
  belongs_to :user
  has_many :payments

  def initialize(user_id:, date:, purchase:, description:, amount:)
    super(user_id: user_id, date: date, purchase: purchase, description: description, amount: amount)
    self.save
    self.generate_payments
  end

  def settled?
    !self.payments.any?{ |payment| !payment.paid }
  end

  def generate_payments
    divisor = self.user.household.users.count
    pay_amount = (self.amount / divisor)
    self.user.household.users.each do |user|
      if user != self.user
        Payment.create(user_id: user.id, expense_id: self.id, amount: pay_amount, paid: false)
      end
    end
  end
end

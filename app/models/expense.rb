class Expense < ApplicationRecord
  belongs_to :user
  has_many :payments

  def initialize(args)
    super(args)
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

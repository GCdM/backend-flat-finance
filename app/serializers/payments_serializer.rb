include ActionView::Helpers::NumberHelper

class PaymentsSerializer < ActiveModel::Serializer
  attributes :payment_data

  def payment_data
    {
      id: object.id,
      amount: number_to_currency(object.amount, unit: '£ '),
      user: User.find(object.user_id).username,
      paid: object.paid,
    }
  end
end

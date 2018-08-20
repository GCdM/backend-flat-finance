class ExpensesSerializer < ActiveModel::Serializer
  attributes :expense_data

  def expense_data
    {
      id: object.id,
      user: User.find(object.user_id).username,
      amount: object.amount,
      date: object.date,
      purchase: object.purchase,
      description: object.description,
    }
  end
end

class UserSerializer < ActiveModel::Serializer
  attributes :user_data

  def user_data
    {
      username: object.username,
      expenses: object.expenses,
      payments: object.payments,
    }
  end
end

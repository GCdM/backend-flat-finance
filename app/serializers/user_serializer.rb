class UserSerializer < ActiveModel::Serializer
  attributes :user_data

  def user_data
    {
      id: object.id,
      username: object.username,
      household_id: object.household_id,
      debit: object.debit,
      credit: object.credit,
    }
  end

end

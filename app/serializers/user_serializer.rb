class UserSerializer < ActiveModel::Serializer
  attributes :user_data

  def user_data
    {
      username: object.username,
      household_id: object.household_id,
    }
  end

end

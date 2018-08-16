class HouseholdSerializer < ActiveModel::Serializer
  attributes :household_data

  def household_data
    {
      household: object,
      members: members,
    }
  end

  def members
    object.users.map{ |user| user.username }
  end

end

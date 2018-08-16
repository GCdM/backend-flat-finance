class HouseholdSerializer < ActiveModel::Serializer
  attributes :household_data

  def household_data
    {
      name: object.name,
      member_ids: object.user_ids,
      expenses: object.expenses,
    }
  end

end

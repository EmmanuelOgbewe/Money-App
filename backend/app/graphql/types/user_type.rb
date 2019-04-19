module Types

  class UserType < Types::BaseObject

    field :id, ID, null: false
    field :name, String, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :payments, Types::PaymentsType, null: false
  end

end

module Types

  class UserType < Types::BaseObject

    field :id, ID, null: false
    field :name, String, null: false
    field :username, String, null: false
    # field :payments, -> {[Types::PaymentType]}, null: false
  end

  class PaymentType < Types::BaseObject

    field :recipient, ->{Types::UserType}, null: false
    field :sender, ->{Types::UserType}, null: false
  end

end

module Types
  class PaymentType < Types::BaseObject

    field :id, ID, null: false
    field :recipient, Types::UserType, null: false
    field :sender, Types::UserType, null: false
    field :amount, Int, null: false
    
  end
end

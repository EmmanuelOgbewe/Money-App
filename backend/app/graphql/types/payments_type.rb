module Types
  class PaymentsType < Types::BaseObject

    field :sent, [Types::PaymentType], null: false
    field :received, [Types::PaymentType], null: false

  end
end

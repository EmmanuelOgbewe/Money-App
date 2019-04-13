class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :amount
  belongs_to :sender
  belongs_to :recipient
end

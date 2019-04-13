class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :payments

  # def payments
  #   {sent: object.sent_payments, recieved: object.received_payments }
  # end
end

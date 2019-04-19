class User < ApplicationRecord

  has_secure_password

  has_many :sent_payments, :class_name => 'Payment', :foreign_key => 'sender_id'
  has_many :received_payments, :class_name => 'Payment', :foreign_key => 'recipient_id'

  def payments
    {sent: self.sent_payments, received: self.received_payments }
  end
end

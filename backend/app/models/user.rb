class User < ApplicationRecord
  has_many :sent_payments, :class_name => 'Payment', :foreign_key => 'sender_id'
  has_many :received_payments, :class_name => 'Payment', :foreign_key => 'recipient_id'

  
end

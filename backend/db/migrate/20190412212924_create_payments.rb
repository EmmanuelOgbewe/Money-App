class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :recipient_id
      t.integer :sender_id
      t.float :amount

      t.timestamps
    end
  end
end

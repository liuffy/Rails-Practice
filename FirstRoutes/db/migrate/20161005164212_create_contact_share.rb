class CreateContactShare < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :contact_shares, :contact_id
    add_index :contact_shares, :user_id
    # Ensure that a user can't have two shares for the same contact. [contact, person_being_shared]
    add_index :contact_shares, [:contact_id, :user_id], unique: true
  end
end

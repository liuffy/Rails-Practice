class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates_uniqueness_of :contact_id, scope: :user_id # a contact should be shared with a sharee just once

  belongs_to :contact
  belongs_to :user
end

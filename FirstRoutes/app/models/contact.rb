class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :user_id, presence: true # owner of that contact
  validates_uniqueness_of :email, scope: :user_id

  has_many :contact_shares
  belongs_to :owner,
    foreign_key: :user_id, # owner of that contact
    class_name: 'User'

  has_many :shared_users,
          through: :contact_shares,
          source: :user # Use the user association in the Contact Association class

end

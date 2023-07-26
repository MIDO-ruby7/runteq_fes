class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :comments, dependent: :destroy

  validates:email, presence: true, uniqueness: true
  validates:name, presence: true
  validates:role, presence: true

  enum role: { general: 0, admin: 1 }

  def own?(object)
    id == object.user_id
  end
end

class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  validates:email, presence: true, uniqueness: true
  validates:name, presence: true
  validates:role, presence: true

  enum role: { general: 0, admin: 1 }
end

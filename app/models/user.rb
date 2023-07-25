class User < ApplicationRecord
  authenticates_with_sorcery!

  validates:email, presence: true, uniqueness: true
  validates:name, presence: true
  validates:role, presence: true

  enum role: { general: 0, admin: 1 }
end

class Post < ApplicationRecord
  belongs_to :category

  validates :graduating_class, presence: true
  validates :name, presence: true
  validates :app_name, presence: true
  validates :app_url, presence: true
  validates :github_url, presence: true
  validates :category_id, presence: true
end

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :graduating_class
      t.string :name, null: false
      t.string :contact
      t.string :app_name, null: false
      t.text :app_url, null: false
      t.text :github_url, null: false
      t.text :usage_technology
      t.text :points_for_effort
      t.text :target_users
      t.text :pain_point
      t.text :remedy
      t.text :comment
      t.text :discription

      t.timestamps
    end
  end
end

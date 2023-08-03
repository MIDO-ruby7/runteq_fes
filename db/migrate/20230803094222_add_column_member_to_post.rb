class AddColumnMemberToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :member, :string
  end
end

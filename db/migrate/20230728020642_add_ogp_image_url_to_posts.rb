class AddOgpImageUrlToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :ogp_image_url, :string
  end
end

class Admin < ApplicationRecord
  def self.import(file, category_id)
    updatable_attributes = ["graduating_class", "name", "app_name", "contact", "app_url", "github_url", "usage_technology", "points_for_effort", "target_users", "pain_point", "remedy", "comment", "discription", "member"]

    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      post = Post.create_or_find_by(id: row["id"]) do |p|
        p.attributes = row.to_hash.slice(*updatable_attributes)
        p.category_id = category_id
      end
    end
  end
end

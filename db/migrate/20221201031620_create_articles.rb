class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.string :imageUrl
      t.datetime :newsSite
      t.datetime :summary
      t.decimal :publishedAt
      t.string :updatedAt
      t.string :featured
      t.string :launches
    end
  end
end

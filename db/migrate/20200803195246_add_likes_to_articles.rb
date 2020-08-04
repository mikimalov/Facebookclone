class AddLikesToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :article, foreign_key: true
  end
end

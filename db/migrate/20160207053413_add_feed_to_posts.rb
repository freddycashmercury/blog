class AddFeedToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :feed, index: true, foreign_key: true
  end
end

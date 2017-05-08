class AddVoteToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :vote, :integer
  end
end

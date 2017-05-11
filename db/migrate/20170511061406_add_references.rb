class AddReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :proposal, foreign_key: true
    add_reference :reviews, :user, foreign_key: true
    add_column :reviews, :comment, :text
    remove_column :reviews, :isDraft
  end
end

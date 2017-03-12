class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :attachment
      t.boolean :isDraft

      t.timestamps
    end
  end
end

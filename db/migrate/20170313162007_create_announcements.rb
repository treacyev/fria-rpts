class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :text
      t.boolean :isDraft

      t.timestamps
    end
  end
end

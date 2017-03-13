class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :department, :string
    add_column :users, :rank, :string
    add_column :users, :contact_number, :string
  end
end

class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :accepted
      t.boolean :resubmit
      t.boolean :rejected

      t.timestamps
    end
  end
end

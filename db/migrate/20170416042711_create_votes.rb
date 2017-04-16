class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.bool :accepted
      t.bool :resubmit
      t.bool :rejected

      t.timestamps
    end
  end
end

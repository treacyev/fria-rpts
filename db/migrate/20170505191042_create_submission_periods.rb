class CreateSubmissionPeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_periods do |t|
      t.boolean :active

      t.timestamps
    end
  end
end

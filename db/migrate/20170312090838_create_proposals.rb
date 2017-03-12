class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :principalResearcher
      t.text :coresearchers
      t.float :rdCost
      t.string :sourceExternal
      t.string :amountExternal
      t.text :facMat
      t.text :objectives
      t.text :expectedOutputs
      t.text :description
      t.string :weeklyHours
      t.boolean :endorsement
      t.boolean :submitAgency
      t.text :listAgency
      t.string :attachment

      t.timestamps
    end
  end
end

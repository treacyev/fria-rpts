class AddIsDraftToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :is_draft, :boolean
  end
end

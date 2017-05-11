class AddHeadVoteToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :head_vote, :integer
  end
end

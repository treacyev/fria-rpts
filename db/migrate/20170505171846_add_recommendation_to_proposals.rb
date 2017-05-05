class AddRecommendationToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :recommendation, :string
  end
end

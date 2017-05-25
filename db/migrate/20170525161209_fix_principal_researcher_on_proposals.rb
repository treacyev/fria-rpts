class FixPrincipalResearcherOnProposals < ActiveRecord::Migration[5.0]
  def change
    rename_column :proposals, :principalResearcher, :principal_researcher
  end
end

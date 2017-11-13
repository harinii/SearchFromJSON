class AddDetailsToOrganization < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :details, :string
    add_column :organizations, :shared_tickets, :boolean
    add_column :organizations, :tags, :string
  end
end

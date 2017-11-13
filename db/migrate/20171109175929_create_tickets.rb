class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :_id
      t.string :url
      t.string :external_id
      t.timestamp :created_at
      t.string :_type
      t.string :subject
      t.string :description
      t.string :priority
      t.string :status
      t.string :submitter_id
      t.string :assignee_id
      t.string :organization_id
      t.string :tags
      t.boolean :has_incidents
      t.timestamp :due_at
      t.string :via

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :_id
      t.string :url
      t.string :external_id
      t.string :name
      t.string :alias
      t.timestamp :created_at
      t.boolean :active
      t.boolean :verified
      t.boolean :shared
      t.string :locale
      t.string :timezone
      t.timestamp :last_login_at
      t.string :email
      t.string :phone
      t.string :signature
      t.string :organization_id
      t.string :tags
      t.boolean :suspended
      t.string :role

      t.timestamps
    end
  end
end

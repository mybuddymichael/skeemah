class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :username
      t.integer :gh_uid
      t.string  :email
      t.string  :token

      t.timestamps
    end
  end
end

class CreateSchemes < ActiveRecord::Migration
  def change
    create_table :schemes do |t|
      t.string  :name
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateSchemes < ActiveRecord::Migration
  def change
    create_table :schemes do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end

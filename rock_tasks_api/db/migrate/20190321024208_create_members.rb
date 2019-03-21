class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end

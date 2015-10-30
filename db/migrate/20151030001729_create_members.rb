class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :group, index: true, foreign_key: true
      t.string :email

      t.timestamps null: false
    end
  end
end

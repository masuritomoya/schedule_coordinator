class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :event, index: true, foreign_key: true
      t.datetime :coordinated_at

      t.timestamps null: false
    end
  end
end

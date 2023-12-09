class CreateDataChanges < ActiveRecord::Migration[6.1]
  def change
    create_table :data_changes do |t|
      t.string :name
      t.text :data

      t.timestamps
    end
  end
end

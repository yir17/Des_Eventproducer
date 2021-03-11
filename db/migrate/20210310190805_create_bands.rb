class CreateBands < ActiveRecord::Migration[6.1]
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.integer :kind, default: 0
      t.date :start_date

      t.timestamps
    end
  end
end

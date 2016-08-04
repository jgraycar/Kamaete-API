class CreateInstruments < ActiveRecord::Migration[5.0]
  def change
    create_table :instruments do |t|
      t.integer :shape
      t.string :label
      t.string :color
      t.decimal :x, precision: 8, scale: 3
      t.decimal :y, precision: 8, scale: 3
      t.decimal :angle, precision: 5, scale: 2

      t.timestamps
    end
  end
end

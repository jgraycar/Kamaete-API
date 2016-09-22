class DropInstrumentTypes < ActiveRecord::Migration[5.0]
  def change
    drop_table :instrument_types do |t|
      t.string :name
      t.string :color
      t.integer :shape
      t.integer :size
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end

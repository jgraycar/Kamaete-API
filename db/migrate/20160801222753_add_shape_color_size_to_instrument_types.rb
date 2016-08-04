class AddShapeColorSizeToInstrumentTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :instrument_types, :shape, :integer
    add_column :instrument_types, :color, :string
    add_column :instrument_types, :size, :integer
  end
end

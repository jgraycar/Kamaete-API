class AddWidthAndHeightToInstruments < ActiveRecord::Migration[5.0]
  def change
    add_column :instruments, :width, :integer
    add_column :instruments, :height, :integer
  end
end

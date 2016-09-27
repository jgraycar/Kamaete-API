class RemoveSizeFromInstruments < ActiveRecord::Migration[5.0]
  def change
    remove_column :instruments, :size, :integer
  end
end

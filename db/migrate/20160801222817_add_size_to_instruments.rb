class AddSizeToInstruments < ActiveRecord::Migration[5.0]
  def change
    add_column :instruments, :size, :integer
  end
end

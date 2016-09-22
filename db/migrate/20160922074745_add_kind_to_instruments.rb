class AddKindToInstruments < ActiveRecord::Migration[5.0]
  def change
    change_table :instruments do |t|
      t.string :kind
    end
  end
end

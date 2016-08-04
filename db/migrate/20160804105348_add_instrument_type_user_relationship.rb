class AddInstrumentTypeUserRelationship < ActiveRecord::Migration[5.0]
  def change
    change_table :instrument_types do |t|
      t.belongs_to :user, index: true
    end
  end
end

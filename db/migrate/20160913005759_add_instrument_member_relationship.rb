class AddInstrumentMemberRelationship < ActiveRecord::Migration[5.0]
  def change
    change_table :instruments do |t|
      t.belongs_to :member, index: true
    end
  end
end

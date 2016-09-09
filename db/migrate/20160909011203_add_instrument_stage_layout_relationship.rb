class AddInstrumentStageLayoutRelationship < ActiveRecord::Migration[5.0]
  def change
    change_table :instruments do |t|
      t.belongs_to :stage_layout, index: true
    end
  end
end

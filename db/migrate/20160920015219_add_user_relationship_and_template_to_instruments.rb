class AddUserRelationshipAndTemplateToInstruments < ActiveRecord::Migration[5.0]
  def change
    change_table :instruments do |t|
      t.belongs_to :user, index: true
      t.boolean :template, default: false
    end
  end
end

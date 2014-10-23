class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.references :user, index: true
      t.references :item, index: true
      t.references :influencer, index: true
      t.text :message

      t.timestamps
    end
  end
end

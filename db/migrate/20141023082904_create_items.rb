class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :image
      t.text :message
      t.references :user, index: true

      t.timestamps
    end
  end
end

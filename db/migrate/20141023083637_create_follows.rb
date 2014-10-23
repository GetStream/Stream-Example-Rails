class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user, index: true
      t.references :target, index: true

      t.timestamps
    end
  end
end

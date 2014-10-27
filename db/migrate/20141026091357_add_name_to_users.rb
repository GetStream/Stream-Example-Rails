class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    User.all.each do |user|
      user.name = user.email.split('@')[0]
      user.save!
    end
    change_column :users, :name, :string, null: false
  end
end

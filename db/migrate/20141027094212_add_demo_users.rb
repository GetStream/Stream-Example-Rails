class AddDemoUsers < ActiveRecord::Migration
  def change
    require 'active_record/fixtures'
    ActiveRecord::Fixtures.create_fixtures(Rails.root.join('test/fixtures'), 
                                           'items')
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.name = Rails.application.secrets.admin_name
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
    end
  end
end

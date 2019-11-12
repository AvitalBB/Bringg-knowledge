class AddStatusFields < ActiveRecord::Migration
  def change
    add_column :statuses, :created_by_user, :integer
    add_column :statuses, :incident_date, :datetime, :default => nil
    add_column :statuses, :incident_description, :text, :default => nil
    add_column :statuses, :incident_origin, :integer, :default => 0
  end
end

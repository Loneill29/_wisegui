class AddDefaultValueToPrivateAttribute < ActiveRecord::Migration[5.1]
  def up
    change_column :wikis, :private, :boolean, default: false
  end

  def down
    change_column :wikis, :private, :boolean, default: true
  end
end

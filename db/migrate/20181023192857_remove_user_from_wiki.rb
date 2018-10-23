class RemoveUserFromWiki < ActiveRecord::Migration[5.1]
  def change
    remove_reference :wikis, :user, foreign_key: true
  end
end

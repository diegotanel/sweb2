class AddIndexToTramitesUserId < ActiveRecord::Migration
  def change
  	add_index :tramites, :user_id
  end
end

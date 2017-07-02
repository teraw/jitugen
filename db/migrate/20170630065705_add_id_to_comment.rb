class AddIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :digitid, :text

  end
end

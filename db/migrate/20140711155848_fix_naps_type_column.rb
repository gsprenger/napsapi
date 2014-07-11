class FixNapsTypeColumn < ActiveRecord::Migration
  def change
    rename_column :naps, :type, :nap_type
  end
end

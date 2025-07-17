class AddStatusToCommands < ActiveRecord::Migration[8.0]
  def change
    add_column :commands, :status, :string, :default => "pending"
  end
end

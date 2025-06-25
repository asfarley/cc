class CreateCommands < ActiveRecord::Migration[8.0]
  def change
    create_table :commands do |t|
      t.belongs_to :Device, null: false, foreign_key: true
      t.datetime :trigger_time
      t.string :command
      t.string :commandtype
      t.string :result

      t.timestamps
    end
  end
end

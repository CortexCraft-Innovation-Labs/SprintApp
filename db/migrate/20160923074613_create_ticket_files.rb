class CreateTicketFiles < ActiveRecord::Migration
  def change
    create_table :ticket_files do |t|
      t.string :file
      t.string :description
      t.references :ticket
      t.string :url

      t.timestamps
    end
    add_index :ticket_files, :ticket_id
  end
end

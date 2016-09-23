class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|
      t.string :name
      t.timestamps
    end
    add_column :tickets, :ticket_type_id, :integer, :null => false
  end
end

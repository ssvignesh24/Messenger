class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :message
      t.boolean :read, default: false

      t.timestamps
    end
  end
end

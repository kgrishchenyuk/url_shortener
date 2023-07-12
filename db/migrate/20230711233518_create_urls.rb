class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :path, null: false
      t.string :slug, null: false, index: { unique: true }
      t.integer :redirect_counter, null: false, default: 0

      t.timestamps
    end
  end
end

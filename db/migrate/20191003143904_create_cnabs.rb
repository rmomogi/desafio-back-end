class CreateCnabs < ActiveRecord::Migration[5.2]
  def change
    create_table :cnabs do |t|
      t.json :document
      t.boolean :finished, default: false
      t.timestamps
    end
  end
end

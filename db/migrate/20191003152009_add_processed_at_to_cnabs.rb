class AddProcessedAtToCnabs < ActiveRecord::Migration[5.2]
  def change
    add_column :cnabs, :processed_at, :datetime
  end
end

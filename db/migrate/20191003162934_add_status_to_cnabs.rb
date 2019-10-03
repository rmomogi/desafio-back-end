class AddStatusToCnabs < ActiveRecord::Migration[5.2]
  def change
    remove_column :cnabs, :finished
    add_column :cnabs, :status, :string, default: 'pending'
  end
end

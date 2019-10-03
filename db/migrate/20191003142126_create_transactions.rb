class CreateTransactions < ActiveRecord::Migration[5.2]
  def up    
    create_table :stores do |t|
      t.string :name, null: false
      t.string :owner, null: false
      t.timestamps
    end

    create_table :transactions do |t|
      t.belongs_to :transaction_type, class_name: 'transaction_type'
      t.datetime :occurrence_at, null: false
      t.decimal :value, precision: 10, scale: 2
      t.string :cpf, null: false
      t.string :card, null: false
      t.belongs_to :store, class_name: 'store'
      t.timestamps
    end
  end

  def down 
    drop_table :stores
    drop_table :transactions
  end
end

class CreateProdutos < ActiveRecord::Migration[7.2]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.integer :quantidade
      t.decimal :preco

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

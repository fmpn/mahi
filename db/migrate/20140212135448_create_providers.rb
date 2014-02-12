class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :cpf
      t.text :bio
      t.string :gender
      t.string :city
      t.string :state
      t.string :cep
      t.integer :age

      t.timestamps
    end
  end
end

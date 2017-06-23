class CreateCompanies < ActiveRecord::Migration[5.1]
  def up
    create_table :companies do |t|
      t.integer :cvr
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :phone_number
    end
  end

  def down
    drop_table :companies
  end
end

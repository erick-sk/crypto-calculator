class CreateProjections < ActiveRecord::Migration[7.0]
  def change
    create_table :projections do |t|
      t.decimal :amount, precision: 9, scale: 2
      t.decimal :btc_creation_price, precision: 6, scale: 2
      t.decimal :eth_creation_price, precision: 6, scale: 2
      t.json :btc_projection
      t.json :eth_projection

      t.timestamps
    end
  end
end

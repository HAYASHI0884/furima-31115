class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.postal_code    null: false
      t.prefectures_id null: false
      t.municipality   null: false
      t.address_number null: false
      t.building_name
      t.phone_number   null: false
      t.buyer          null: false, foreign_key: true
      t.timestamps
    end
  end
end

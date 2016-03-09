class AddCoreTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
    end

    create_table :user_profile_elements do |t|
      t.references :user
      t.references :property
      t.string :value
    end

    create_table :properties do |t|
      t.string :value_type
      t.string :name
    end

    create_table :menus do |t|
      t.string :ref_id
      t.string :title
    end

    create_table :menu_property_values do |t|
      t.references :menu
      t.references :property
      t.integer :value
    end

    create_table :menu_responses do |t|
      t.references :user
      t.references :menu
      t.boolean :accepted
      t.timestamps
    end

    create_table :menu_response_elements do |t|
      t.references :menu_response
      t.references :menu_property_value
      t.boolean :accepted
    end
  end
end

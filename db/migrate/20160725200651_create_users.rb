class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname, null: false
      t.string :lastname,  null: false
      t.string :user_name, null: false
      t.string :address,   null: false
      t.integer :phone,    null: false, limit: 8
    end
    
    create_table :items do |t|
      t.belongs_to :user,    null: false, index: true, foreign_key: true
      t.string :title,       null: false
      t.string :description, null: false
      t.string :price,       null: false
      t.string :location,    null: false
      t.string :condition,   null: false
      t.string :status,      null: false
    end
    
    create_table :checkouts do |t|
      t.belongs_to :item,  null: false, index: true, foreign_key: true
      t.belongs_to :user,  null: false, index: true, foreign_key: true
      t.integer :bintime,  null: false
    end
    
    create_table :comments do |t|
      t.belongs_to :item, null: false, index: true, foreign_key: true
      t.belongs_to :user, null: false, index: true, foreign_key: true
      t.string :comment,  null: false
    end
    
    create_table :availabilities do |t|
      t.belongs_to :item,    null: false, index: true, foreign_key: true
      t.string :cron_string, null: false
      t.integer :bintime,    null: false
    end
    
    create_table :tags do |t|
      t.belongs_to :item,          null: false, index: true, foreign_key: true
      t.string :tag,               null: false
    end
  end
end
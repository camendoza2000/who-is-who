class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end

    change_table :users do |t|
    	t.text :responsibilities
    end
  end
end

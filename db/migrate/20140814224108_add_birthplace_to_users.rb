class AddBirthplaceToUsers < ActiveRecord::Migration
  def change

  	change_table :users do |t|
    	t.string :birthplace
    end
  end
end

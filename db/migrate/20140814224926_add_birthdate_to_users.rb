class AddBirthdateToUsers < ActiveRecord::Migration
  def change

  	change_table :users do |t|
    	t.date :birthdate
    end
  end
end

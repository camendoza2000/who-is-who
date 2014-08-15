class AddEducationToUsers < ActiveRecord::Migration
  def change

  	change_table :users do |t|
    	t.string :institution
    	t.string :career
    end
  end
end

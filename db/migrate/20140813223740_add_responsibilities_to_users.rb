class AddResponsibilitiesToUsers < ActiveRecord::Migration
  def change
  	 change_table :users do |t|
    	t.text :responsibilities
    end
  end
end

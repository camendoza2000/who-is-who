class AddMailsToUsers < ActiveRecord::Migration
  def change

  	change_table :users do |t|
    	t.string :emails
    end
  end
end

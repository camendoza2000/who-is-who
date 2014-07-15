class CreateWellcomes < ActiveRecord::Migration
  def change
    create_table :wellcomes do |t|

      t.timestamps
    end
  end
end

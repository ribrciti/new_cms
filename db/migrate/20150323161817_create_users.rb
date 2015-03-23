class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|		# ...  :users, {:id => false} do |t|... when you do not want a primary id col.
    	t.column "first_name", :string, :limit => 25 
    	t.string "last_name", :limit => 50
    	t.string "email", :default => "", :null => "false" 
			t.string "password", :limit => 40
      #t.datetime "created_at"
      #t.datetime "updated_at"
      t.timestamps    #this is auto created at updated at
    end
  end

  def down
  	drop_table :users
  end
end





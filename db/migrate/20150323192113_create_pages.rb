class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
    	t.string "subject_id"                          # foreign key
    	#same code as: t.references :subject #for line above
    	t.string "name"
    	t.string "permalink"
    	t.integer "position"
    	t.boolean "visible", :default => false
    	t.timestamps
    end
    add_index("pages", "subject_id")
    # all foreign keys should have an index	
    add_index("pages", "permalink")     # permalink is how we will look-up pages
  end
  

  def down
  	drop_table :pages
  end
end


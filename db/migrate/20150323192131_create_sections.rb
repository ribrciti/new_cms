class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
    	t.integer "page_id"     # foreign key, put at top for easy finding
    	# same as: t.references :page
    	t.string "name"
    	t.integer "position"
    	t.boolean "visible", :default => false
    	t.string "content_type"
    	t.text"content"
      t.timestamps
    end
    add_index("sections", "page_id")
  end
end


class CreateSectionEdits < ActiveRecord::Migration
  def up
    create_table :section_edits do |t|
    	t.references :admin_user   # foreign key 1
    	t.references :section 			# foreign key 2
    	t.string :summary   # add a section for notes
      t.timestamps
    end
    add_index :section_edits, ["admin_user_id", "section_id"]    #add index
  end

  def down
  	drop_table :section_edits
  end
end

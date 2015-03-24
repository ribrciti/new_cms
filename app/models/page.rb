class Page < ActiveRecord::Base

# you must have a foreign key assigned for this to work
	belongs_to :subject        # has_one :page (in subject.rb) 
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
=begin
	has_many :sections
	
	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	validates_presence_of :permalink
	validates_length_of :permalink, :within => 3..255
	# use presence_of with length_of to disallow spaces
	validates_uniqueness_of :permalink
	# for unique values by subject use ":scope => :subject_id"
	
	scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }  
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda { order("pages.created_at DESC") }
  scope :search, lambda { |query|
    where(["name LIKE ?", "%#{query}%"])
  }
=end 
end

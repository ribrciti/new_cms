class Subject < ActiveRecord::Base

	has_many :pages			# belongs_to :subject (in page.rb)

	acts_as_list

	validates_presence_of :name
	validates_length_of :name, :maximum => 255
		#validdates_presence_of vs. validates_length _of :minimum => 1
		# different error messages: "can't be blank" or "is too short"
		# validates_length_of allows strings with only spaces!

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("subjects.position ASC") }
	scope :newest_first, lambda { order("subjects.created_at DESC") }
	scope :search, lambda {|query|
		where(["name LIKE ?", "%#{query}%" ])  
	}

end

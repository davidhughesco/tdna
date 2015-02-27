class Collaboration < ActiveRecord::Base

	belongs_to :candidate
	belongs_to :collaborator, :class_name => "Candidate"

end

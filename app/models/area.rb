class Area < ActiveRecord::Base
	has_many :activities
	has_many :needs_analyses
end

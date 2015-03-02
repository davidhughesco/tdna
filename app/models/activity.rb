class Activity < ActiveRecord::Base
	belongs_to :area
	has_many :needs_analyses
end

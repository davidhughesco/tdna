class NeedsAnalysis < ActiveRecord::Base
 	belongs_to :candidate
	belongs_to :activity
	belongs_to :area
end

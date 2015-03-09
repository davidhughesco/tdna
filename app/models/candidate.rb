class Candidate < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :collaborations, dependent: :destroy
	has_many :collaborators, :through => :collaborations
	has_many :inverse_collaborations, :class_name => "Collaboration", :foreign_key => "collaborator_id"
	has_many :inverse_collaborators, :through => :inverse_collaborations, :source => :candidate
	has_one :needs_analysis
	has_one :role_candidate
	has_one :role_collaborator

	validates :collaborator_id, numericality: { only_integer: true }, presence: true
	validates_presence_of :first_name, :last_name, :email
	
	# Custom validation for checking the existance of the Collaborator in the Candidate model

	validate :collaborator_check, on: :create
 
	def collaborator_check
		errors.add(:collaborator_id, "Please use a valid code.") unless Candidate.find_by_id(self.collaborator_id).present?
	end

	# Randomise the Candidate ID (before create)
	before_create :randomise_id

	# Create the required collaborations and responses (after create)
	after_create	:create_collaboration,
					:create_needs_analysis,
					:create_role_candidate,
					:create_role_collaborator

	# Destroy any collaborations (before destroy)
	before_destroy	:delete_collaboration

	def name
		first_name + " " + last_name
	end

	private

	def randomise_id
		begin
			self.id = SecureRandom.random_number(1_000_000)
		end while Candidate.where(id: self.id).exists?
	end

	def collaborator_id_exists
  		return false if Candidate.find_by_id(self.collaborator_id).nil?
	end

	def create_needs_analysis
		@activities = Activity.all
		@activities.each do |a|
			@needs_analysis = NeedsAnalysis.new
			@needs_analysis.candidate_id = self.id
			@needs_analysis.activity_id = a.id
			@needs_analysis.area_id = a.area_id
			@needs_analysis.order_id = a.order_id
			@needs_analysis.collaborator_id = self.collaborator_id
			@needs_analysis.save
		end
	end

	def create_role_candidate
		@role_candidate = RoleCandidate.new
		@role_candidate.candidate_id = self.id
		@role_candidate.save
	end

	def create_role_collaborator
		@role_collaborator = RoleCollaborator.new
		@role_collaborator.candidate_id = self.id
		@role_collaborator.collaborator_id = self.collaborator_id
		@role_collaborator.save
	end

	def create_collaboration
		@collaboration = Collaboration.new
		@collaboration.candidate_id = self.collaborator_id
		@collaboration.collaborator_id = self.id
		@collaboration.category = 'superior'
		@collaboration.save
	end

    def delete_collaboration
    	@collaboration = Collaboration.find_by('collaborator_id = ?', self.id)
    	@collaboration.destroy
    end

end
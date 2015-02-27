class Candidate < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :collaborations, dependent: :destroy
	has_many :collaborators, :through => :collaborations
	has_many :inverse_collaborations, :class_name => "Collaboration", :foreign_key => "collaborator_id"
	has_many :inverse_collaborators, :through => :inverse_collaborations, :source => :candidate

	validates :collaborator_id, numericality: { only_integer: true }, presence: true
	validates_presence_of :first_name, :last_name, :email, :password

	after_create :create_collaboration
	before_destroy :delete_collaboration

	def name
		first_name + " " + last_name
	end

	private

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
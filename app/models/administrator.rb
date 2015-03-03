class Administrator < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  	validates_each :passcode, presence: true, on: :create do |record, attr, value|
		record.errors.add attr, "Please enter a valid passcode." unless
		value && value == "MOLLY"
	end

end

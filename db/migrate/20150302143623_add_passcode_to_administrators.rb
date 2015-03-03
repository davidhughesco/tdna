class AddPasscodeToAdministrators < ActiveRecord::Migration
  def change
  	add_column :administrators, :passcode, :string
  end
end

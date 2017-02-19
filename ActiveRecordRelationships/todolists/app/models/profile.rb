class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: ["female", "male"]
  validate :not_all_null
  validate :male_sue

  def not_all_null
  	if first_name.nil? && last_name.nil?
  		errors.add(:first_name, "first_name and last_name cannot be null at the same time")
  	end
  end

  def male_sue
  	if first_name == "Sue" && gender == "male"
  		errors.add(:gender, "If gender is a male with a first_name Sue this will give an error. (Sorry! It's 21st century and you can be called however you like!")
  	end
  end

  def self.get_all_profiles(min,max)
  	Profile.where("birth_year BETWEEN ? AND ?",min, max).order(birth_year: :asc)  
  end
end

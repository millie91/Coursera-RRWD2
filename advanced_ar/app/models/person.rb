class Person < ActiveRecord::Base
	has_one :personal_info, dependent: :destroy
	has_many :jobs
	has_many :my_jobs, class_name: "Job"
	has_and_belongs_to_many :hobbies
	has_many :approx_salaries, through: :jobs, source: :salary_range
end
class Article < ActiveRecord::Base

has_many :comments

	
	validates :title, :description, presence: :true


end

class Comment < ActiveRecord::Base
	validates :comment, presence: :true
	belongs_to :article
end

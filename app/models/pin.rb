class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	# allows a pin to have an attached file image

	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	# from gemmashearer http://community.onemonth.com/t/day-24-image-upload-with-paperclip-error/3242/2

	validates :image, presence: true
	validates :description, presence: true
end

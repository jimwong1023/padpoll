class Photo < ActiveRecord::Base
	belongs_to :user
	belongs_to :property

	has_attached_file :image, 
		styles: { 
			thumb: "100x100#",
			small: "200x200>",
			medium: "300x300" 
		},
		convert_options: {
			thumb: "-quality 75 -strip"
		}

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :user, :property, presence: true
end
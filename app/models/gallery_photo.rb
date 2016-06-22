class GalleryPhoto < ActiveRecord::Base
	belongs_to :galleries
	has_attached_file :avatar,  styles: { small: "100x100", med: "500x320", large: "1440x700" }, :default_url => "/assets/profile.png"
  do_not_validate_attachment_file_type :avatar

end

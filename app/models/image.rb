class Image < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image,
  :styles => {
    :thumb => "100x100",
    :medium => "200x200",
    :large => "600x400"
  }
end

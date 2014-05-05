class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :pic

  validates_attachment_presence :pic
  validates_attachment_size :pic, :less_than => 5.megabytes
  validates_attachment_content_type :pic, :content_type => ['image/jpeg', 'image/png']
end

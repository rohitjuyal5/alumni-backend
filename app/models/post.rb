class Post < ApplicationRecord
  belongs_to :user
  attr_accessor :content_type, :original_filename
  # has_attached_file :image
  # do_not_validate_attachment_file_type :image
  has_attached_file :image
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]


  # Validate content type


end

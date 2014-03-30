class Work < ActiveRecord::Base
  has_and_belongs_to_many :work_types

  attr_accessible :name, :url, :site_url, :pages_count, :w_type, :date, :image, :remote_image_url
  mount_uploader :image, ImageUploader


end

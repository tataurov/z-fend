class Work < ActiveRecord::Base
  attr_accessible :name, :url, :site_url, :pages_count, :w_type, :date, :image, :remote_image_url
  mount_uploader :image, ImageUploader
end

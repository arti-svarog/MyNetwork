class Image
  include Mongoid::Document
  field :image, type: String, default: ''
  belongs_to :post

  mount_uploader :image, AvatarUploader, mount_on: :image

end
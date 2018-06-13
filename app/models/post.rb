class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  field :content, type: String , default: ''
  field :image, type: String , default: ''
  field :video, type: String , default: ''
  field :user_id, type: Integer , default: ''
  belongs_to :user
  has_many :comments ,dependent: :destroy
  has_many :likes ,dependent: :destroy
  has_many :unlikes ,dependent: :destroy

  mount_uploader :image, AvatarUploader, mount_on: :image

end

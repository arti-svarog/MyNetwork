class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts ,dependent: :destroy
  has_many :comments ,dependent: :destroy

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :firstname, type: String, default: ''
  field :lastname, type: String, default: ''
  field :gender, type: String, default: ''
  field :city, type: String, default: ''
  field :country, type: String, default: ''
  field :dob, type: String, default: ''
  field :image, type: String, default: ""
  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
  
  mount_uploader :image, AvatarUploader, mount_on: :image

end

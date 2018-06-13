class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include Amistad::FriendModel

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts ,dependent: :destroy
  has_many :comments ,dependent: :destroy
  has_many :interests ,dependent: :destroy

  #Friendship Associations
  has_many :relationships, dependent: :destroy
  # has_many :followed_users, through: :relationships, source: :followed
  # has_many :reverse_relationships, foreign_key: "followed_id",
                                 # class_name:  "Relationship",
                                 # dependent:   :destroy
  # has_many :followers, through: :reverse_relationships, source: :follower
  

  #End
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
  field :position, type: String, default: ''
  field :day, type: String, default: ''
  field :month, type: String, default: ''
  field :year, type: String, default: ''
  field :about_us, type: String, default: ''
  field :university, type: String, default: ''
  field :to, type: String, default: ''
  field :from, type: String, default: ''
  field :description, type: String, default: ''
  field :graduate, type: Boolean, default: true
  field :education_description, type: String, default: ''
  field :education_city, type: String, default: ''
  field :education_to, type: String, default: ''
  field :education_from, type: String, default: ''
  field :designation, type: String, default: ''
  field :company, type: String, default: ''
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
  field :payment_status, type: String
  field :payment_at, type: String
  field :mobile_number, type: String
  
  mount_uploader :image, AvatarUploader, mount_on: :image

end

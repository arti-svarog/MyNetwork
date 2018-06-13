class Image
  include Mongoid::Document
  embedded_in :user
end

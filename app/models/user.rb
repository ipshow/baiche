class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name
  field :email
  index({ name: 1, email: 1 }, { unique: true })
  before_save { |user| user.email = email.downcase }
  attr_accessible :name, :email    #用户只可以访问这两个字段
  validates_length_of :email, minimum: 6, maximum: 50
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }

end

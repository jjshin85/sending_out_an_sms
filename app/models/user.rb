class User < ActiveRecord::Base
  has_many :created_messages, foreign_key: :sender_id
  has_many :received_messages, foreign_key: :recipient_id

  validates :username, presence: true
  validates_uniqueness_of :username
  validates :hashed_password, presence: true

  def password
    @password ||= BCrypt::Password.new(self.hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(username, password)
    self.password == password && self.username == username
  end

end

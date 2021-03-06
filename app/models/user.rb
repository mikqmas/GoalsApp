class User < ActiveRecord::Base
  attr_reader :password
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil:true}

  after_initialize :ensure_session_token

  has_many :goals
  has_many :comments, as: :commentable

  def self.find_by_credentials(parameters)
    username = parameters[:username]
    password = parameters[:password]

    user = find_by(username: username)
    user.try(:is_password?, password) ? user : nil
  end

  def password=(password)
    if password.present?
      @password = password
      self.password_digest = BCrypt::Password.create(@password)
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!

    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

end

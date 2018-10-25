class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy

  before_save { self.email = email.downcase if email.present? }
  after_initialize :initialize_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email, presence: true, uniqueness: { case_sensitive: false },length: { minimum: 3, maximum: 254 }

  enum role: [:standard, :premium, :admin]

  private

  def initialize_role
    self.role ||= :standard
  end
end

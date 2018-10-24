class Wiki < ApplicationRecord
  belongs_to :user
  after_initialize :init

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true

  def init
    self.private = false if self.private.nil?
  end
end

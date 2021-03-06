class JobOffer < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  belongs_to :company

  has_many :job_applications, dependent: :destroy
  has_many :employees, through: :job_applications

  validates :name, presence: true
  validates :city, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end

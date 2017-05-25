class Proposal < ApplicationRecord
  before_create :set_status

  validates :title, presence: true
  validates :rdCost, presence: true, numericality: { only_float: true }
  validates_numericality_of :rdCost, greater_than_or_equal_to: 0, less_than_or_equal_to: 5000000
  validates :objectives, presence: true
  validates :principal_researcher, presence: true
  validates :expectedOutputs, presence: true
  validates :description, presence: true
  validates :weeklyHours, presence: true
  validates :endorsement, :inclusion => {:in => [true, false]}
  validates :submitAgency, :inclusion => {:in => [true, false]}
  validates :attachment, presence: true
  validates :recommendation, presence: true

  mount_uploader :attachment, AttachmentUploader
  mount_uploader :recommendation, RecommendationUploader

  belongs_to :user
  has_many :reviews

  def set_status
    self.status = 0
  end
end

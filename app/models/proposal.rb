class Proposal < ApplicationRecord
  validates :title, presence: true
  validates :rdCost, presence: true, numericality: { only_float: true }
  validates_numericality_of :rdCost, greater_than_or_equal_to: 0
  validates :objectives, presence: true
  validates :expectedOutputs, presence: true
  validates :description, presence: true
  validates :weeklyHours, presence: true
  validates :endorsement, presence: true
  validates :submitAgency, presence: true
  validates :attachment, presence: true

  mount_uploader :attachment, AttachmentUploader

  belongs_to :user
end

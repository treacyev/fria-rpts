class Review < ApplicationRecord
  # validates :attachment, presence: true
  mount_uploader :attachment, AttachmentUploader
  belongs_to :proposal
  belongs_to :user
end

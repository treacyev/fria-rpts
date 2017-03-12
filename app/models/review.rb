class Review < ApplicationRecord
  validates :attachment, presence: true
  mount_uploader :attachment, AttachmentUploader
end

class Proposal < ApplicationRecord
  validates :title, presence: true
  mount_uploader :attachment, AttachmentUploader
end

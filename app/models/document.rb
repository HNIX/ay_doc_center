class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  acts_as_votable 
  mount_uploader :attachment, AttachmentUploader 
  mount_uploader :word, WordUploader
  mount_uploader :ppt, PptUploader
  acts_as_taggable_on :tags
end

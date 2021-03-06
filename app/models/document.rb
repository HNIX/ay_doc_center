class Document < ActiveRecord::Base
  include PublicActivity::Common
  # tracked

  belongs_to :user
  belongs_to :category

  acts_as_votable 

  mount_uploader :attachment, AttachmentUploader 
  mount_uploader :word, WordUploader
  mount_uploader :ppt, PptUploader

  acts_as_taggable_on :tags


  def self.search(search)
	  where("name ILIKE ?", "%#{search}%") 
  end

end

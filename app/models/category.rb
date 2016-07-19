class Category < ActiveRecord::Base
  has_many :documents
  has_ancestry orphan_strategy:  :adopt
end

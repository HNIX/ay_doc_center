class Category < ActiveRecord::Base
  has_many :documents
  has_ancestry
end

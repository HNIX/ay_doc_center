class LandingsController < ApplicationController
  
  before_filter :set_documents

  def index
  	@activities = PublicActivity::Activity.order("created_at desc")
  end


  private

  def set_documents
  	@documents = Document.all.order("created_at DESC").limit(3)
  end
end

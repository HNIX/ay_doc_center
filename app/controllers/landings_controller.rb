class LandingsController < ApplicationController
  
  before_filter :set_documents
  before_filter :set_stats


  def index
  	@activities = PublicActivity::Activity.order("created_at desc")
  end


  private
  
  def set_stats
    @stats_collection = ::CompanyStat.order("created_at DESC").limit(4)
  end

  def set_documents
  	@documents = Document.all.order("created_at DESC").limit(3)
  end
end

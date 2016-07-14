class PagesController < ApplicationController
  before_filter :validate_page

  include HighVoltage::StaticPage

  layout :layout_for_page

  private

  def layout_for_page
    case params[:id]
    when 'home'
      'home'
    else
      'application'
    end
  end

	def validate_page
    if valid_page?
      true
    else
      render file: "public/404.html", status: :not_found, layout: false
    end
  end

	def valid_page?
	  File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:id]}.html.erb"))
	end

end

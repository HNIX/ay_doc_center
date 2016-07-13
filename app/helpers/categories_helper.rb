module CategoriesHelper

	def nested_categories(categories)
		@count = 1
		categories.map do |category, sub_categories|
			content_tag(:li, render(category) + nested_subcategory(sub_categories), class: "dd-item", data: {id:"#{@count += 1}"})
		end.join.html_safe
	end

	def nested_subcategory(sub_categories)
	  if !sub_categories.blank?
		content_tag(:ol, nested_categories(sub_categories), class: "dd-list")
	  end
	end

end

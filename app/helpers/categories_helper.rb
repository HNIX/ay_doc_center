module CategoriesHelper

	def nested_categories(categories)
		categories.map do |category, sub_categories|
			render(category) + nested_categories(sub_categories)
		end.join.html_safe
	end

end

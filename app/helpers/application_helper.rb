module ApplicationHelper
 
 def no_spaces string
    string.gsub( /\W/, '-' )   
 end

 def separate_comma(number)
   number.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
 end

 def active_nav (category, class_name)
 	if !@category.nil?
	 	if @category.id == category.id
	 		@class = class_name
	 	elsif category.has_children?
		 	category.descendants.each do |descendant|
		      if @category.id == descendant.id 
		        @class = class_name
		        break
		      else
		      	@class = ""
		      end
		    end 
		else
		  @class = ''
		end  
    else
      @class = ''
	end 
	return @class
 end


 def active_controller (controller, class_name)
 	controller.each do |controller|
	 	if params[:controller] == controller
	 		@class =  class_name
	 		break
	 	else
	      	@class =  ''
	 	end
	end
	return @class
 end

 def active_controller_action (controller, action, class_name)
 	if params[:controller] == controller
 		action.each do |action|
	 		if params[:action] == action
		 		@class =  class_name
		 		break
		 	else
		 		@class = ""
		 	end
	 	end
 	else
      	@class =  ''
 	end
	return @class
 end

 def active_for_id (page, class_name)
 	page.each do |p|
	 	if params[:id] == p
	 		@class = class_name
	 		break
	 	else
	 		@class = ''
	 	end
	end
	return @class
 end

end

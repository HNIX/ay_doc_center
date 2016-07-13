module ApplicationHelper
 
 def no_spaces string
    string.gsub( /\W/, '-' )   
 end

 def active_nav category
 	category.descendants.each do |descendant|
      if !@category.nil?
	      if @category.id == descendant.id || @category.id == category.id 
	        return 'active open selected'
	      end
	  end
    end                                      
 end
end

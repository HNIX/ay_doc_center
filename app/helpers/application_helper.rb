module ApplicationHelper
 def no_spaces string
    string.gsub( /\W/, '-' )   
  end
end

module FeedsHelper

 def has_feed?(user)
   !user.feed.nil?
 end 

end

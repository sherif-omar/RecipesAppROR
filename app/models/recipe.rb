class Recipe < ActiveRecord::Base
    
    belongs_to :chef 
    mount_uploader :picture, PictureUploader
    validate :picture_size
    has_many :likes
    
    def thumbs_up_total
      self.likes.where(like: true).size
   end
   
   def thumbs_down_total
      self.likes.where(like: false).size
   end
    private
    
    def picture_size
       if picture.size > 5.megabytes
          errors.add("should be less then 5MB") 
       end
    end
    
end
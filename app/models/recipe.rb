class Recipe < ActiveRecord::Base
    
    belongs_to :chef 
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    private
    
    def picture_size
       if picture.size > 5.megabytes
          errors.add("should be less then 5MB") 
       end
    end
    
end
class Chef < ActiveRecord::Base
    has_many :recipes, dependent: :destroy
    has_many :likes
end
class Restaurant < ActiveRecord::Base
  resourcify
  include Authority::Abilities
    
  belongs_to :user
  has_many :posts
  has_many :comments, :through => :posts
  
  mount_uploaders :images, PostUploader
  serialize :images, JSON
end

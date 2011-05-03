class Post < ActiveRecord::Base
  belongs_to :itemable, :polymorphic => true
  belongs_to :user
  
  has_many :likes, :as => :itemable
  has_many :comments
  
  validates_presence_of :body
end

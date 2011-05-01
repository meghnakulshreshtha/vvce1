class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :friendships
  has_many :friends, :class_name => 'User', :through => :friendships, :foreign_key => 'friend_id'
  
  def is_friend? friend
    friends.include?(friend)
  end
  
  def get_friendship friend
    friendships.where("friend_id = ?", friend.id).first
  end
end

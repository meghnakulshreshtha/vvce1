class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key => 'friend_id'
  
  validates_uniqueness_of :friend_id, :scope => :user_id
  
  def self.search(search)
     if search
       find(:all, :conditions => ['first_name LIKE ?', "%#{search}%"])
     else
        find(:all)
     end
  end

end
    

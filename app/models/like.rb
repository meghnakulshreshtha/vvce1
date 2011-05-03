class Like < ActiveRecord::Base
  belongs_to :itemable, :polymorphic => true
  belongs_to :user
end

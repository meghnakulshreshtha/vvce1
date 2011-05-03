class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :set_params 
  def set_params
    @params = params
    if @params['role']
      if ['student','faculty','alumni'].include?(@params['role']) 
    	  @role = @params['role']
      else
    	  @role = 'student'
      end
    else
      @role = 'student'
    end    
  end
end
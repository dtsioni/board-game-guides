class Ability
	include CanCan::Ability

	def initialize(user)
    if !user
      user = User.new
      user.role = "guest"
    end

		case user.role
		when "admin"
			can :manage, :all
      can :vote, :all
    when "guest"
      can :read, :all    
    else
      can :read, :all
		end 

		
	end
end

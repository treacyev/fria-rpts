class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new
    if user.type == "Researcher"
      can :index, Proposal, user_id: user.id
      can :read, Proposal, user_id: user.id
      can :create, Proposal
      can :update, Proposal, is_draft: true
      can :cancel, Proposal, is_draft: true
      can :cancel, Proposal, status: 0
    elsif user.type == "CommitteeMember"
      can :index, Proposal
      can :read, Proposal
    elsif user.type == "CommitteeHead"
      can :index, Proposal
      can :read, Proposal      
    elsif user.type == "Dean"
      can :index, Proposal
      can :read, Proposal
    elsif user.type == "Admin"
      can :index, User
    else
      can :index, Proposal, status: 2
    end
  end
end

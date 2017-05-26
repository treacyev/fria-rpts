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
      if SubmissionPeriod.first.active && !user.submitted
        can :create, Proposal
        can :new, Proposal
        can :update, Proposal, is_draft: true
      end
      can :cancel, Proposal, is_draft: true
      can :cancel, Proposal, status: 0
    elsif user.type == "CommitteeMember"
      can :index, Proposal, is_draft: false
      can :read, Proposal, is_draft: false
      can :create, Review
      can :read, Review, user_id: user.id
      cannot :index, Proposal, status: -2
    elsif user.type == "CommitteeHead"
      can :index, Proposal, is_draft: false
      can :read, Proposal, is_draft: false      
      can :toggle, SubmissionPeriod
      can :edit, Proposal, is_draft: false 
      can :vote, Proposal, is_draft: false
      can :read, Review
      can :create, Announcement
      can :edit, Announcement
      can :destroy, Announcement
      cannot :index, Proposal, status: -2
    elsif user.type == "Dean"
      can :index, Proposal, head_vote: 2
      can :read, Proposal, head_vote: 2
      can :veto, Proposal, head_vote: 2
      cannot :index, Proposal, status: -2
    elsif user.type == "Admin"
      can :index, User
      can :show, User
      can :activate, User
      can :deactivate, User
    else
      can :index, Proposal, status: 2
    end
  end
end

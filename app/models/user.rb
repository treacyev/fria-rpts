class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_user_type, :set_activated
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  devise :timeoutable, timeout_in: 15.minutes
  has_many :proposals
  has_many :reviews

  validates :first_name, :last_name, :rank, :department, :contact_number, presence: true

  def set_user_type
    self.type ||= 'Researcher'
  end

  def set_activated
    if self.type == 'Admin' || self.type == 'CommitteeHead' || self.type == 'CommitteeMember' || self.type == 'Dean'
      self.write_attribute(:activated?, true)
    else
      self.write_attribute(:activated?, false)
    end
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end

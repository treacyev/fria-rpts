class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_user_type
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  has_many :proposals

  validates :first_name, :last_name, :rank, :department, :contact_number, presence: true

  def set_user_type
    self.type ||= 'Researcher'
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end

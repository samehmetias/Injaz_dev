class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }
 
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
 
  scope :coordinators, -> { where(employee_type: 'coordinator') }
  scope :implementers, -> { where(employee_type: 'implementers') }
  scope :volunteers, -> { where(employee_type: 'volunteer') }
  scope :trainers, -> { where(employee_type: 'trainer') }

  belongs_to :Company

  has_many :Implementer_requests


  has_many :Programs, through: :Implementer_requests
  has_many :Lessons, through: :Implementer_requests

   #methods
  def admin?
    self.admin == true
  end
end

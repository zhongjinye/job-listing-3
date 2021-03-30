class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :jobs
  has_many :resumes

  # def admin?
  #   is_admin
  # end
  #
  # def website_admin?
  #   is_website_admin
  # end

end

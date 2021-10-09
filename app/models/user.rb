class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum humanType: { student: 0, humanresourcedevelopment: 1 }, _prefix: true
  enum companyScale: { large: 0,  smallmedium: 1, venture: 2, nothing: 3 }, _prefix: true
  attr_accessor :current_password
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum humanType: { student: 0, humanresourcedevelopment: 1 }, _prefix: true
  enum companyScale: { large: 0,  smallmedium: 1, venture: 2, nothing: 3 }, _prefix: true
  attr_accessor :current_password

  has_many :articles, dependent: :destroy
  has_many :comments
  mount_uploader :image, ImageUploader
  mount_uploader :movie, VideoUploader

  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end  
end

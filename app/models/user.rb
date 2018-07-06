class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ATTRIBUTES_PARAMS = [
  	:name,
  	:email,
  	:password,
  	:password_confirmation
  ].freeze

  SIGN_UP_REQUIRE_PARAMS = [
  	:name,
  	:email,
  	:password,
  	:password_confirmation
  ].freeze

  UPDATE_PARAMS = [
    :name,
    :email,
    :bio,
    :avatar
  ]

  CHANGE_PASSWORD_PARAMS = [
    :password,
    :password_confirmation,
    :current_password
  ]

end

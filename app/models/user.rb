class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :attendances
  has_many :relationships, dependent: :destroy, :class_name => "Relationship"
  has_many :working_places, through: :relationships
  validates :name, presence: true
  validates :email, presence: true

  # Userレコードをcurrent_password無しで更新する

  def update_without_password(params, *options)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if valid_password?(current_password)
        update_attributes(params, *options)
      else
        self.assign_attributes(params, *options)
        self.valid?
      end

    update_attributes(params, *options)

    clean_up_passwords
    result
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  has_many :documents
  validates_formatting_of :office_phone, using: :us_phone
  validates_formatting_of :mobile_phone, using: :us_phone
end

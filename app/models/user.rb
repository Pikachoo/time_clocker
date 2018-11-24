class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clock_events

  attr_reader :clocked_status

  def clocked_status
    clock_events.where(stop_at: nil).blank? ? 'Clocked Out' : 'Clocked In'
  end
end

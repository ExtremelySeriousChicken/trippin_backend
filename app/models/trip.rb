class Trip < ActiveRecord::Base
    has_many :events, dependent: :destroy
    has_many :expenses, dependent: :destroy
    has_many :packings, dependent: :destroy
    has_many :user_trips
    has_many :users, :through => :user_trips
end

# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: %i[google_oauth2] # :confirmable
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friend_sent, class_name: 'Friendship',
                         foreign_key: 'sent_by_id',
                         inverse_of: 'sent_by',
                         dependent: :destroy
  has_many :friend_request, class_name: 'Friendship',
                            foreign_key: 'sent_to_id',
                            inverse_of: 'sent_to',
                            dependent: :destroy
  has_many :friends, -> { merge(Friendship.friends) },
           through: :friend_sent, source: :sent_to
  has_many :pending_requests, -> { merge(Friendship.not_friends) },
           through: :friend_sent, source: :sent_to
  has_many :received_requests, -> { merge(Friendship.not_friends) },
           through: :friend_request, source: :sent_by
  has_many :notifications, dependent: :destroy
  mount_uploader :image, ImageUploader
  validate :picture_size

  # Returns a string containing this user's first name and last name
  def full_name
    "#{first_name} #{last_name}"
  end

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    if user
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    else
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
      end
    end
    user
  end

  # Returns all posts from this user's friends and self
  def friends_and_own_posts
    myfriends = friends
    our_posts = []
    myfriends.each do |f|
      f.posts.each do |p|
        our_posts << p
      end
    end
    posts.each do |p|
      our_posts << p
    end
    our_posts
  end

  private

  # Validates the size of an uploaded picture.
  def picture_size
    errors.add(:image, 'should be less than 1MB') if  image.size >
                                                      1.megabytes
  end
end

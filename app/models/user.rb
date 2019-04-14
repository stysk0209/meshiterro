class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #画像投稿「Refile」使用時、「attachment」を記述する。
  #追加したカラム名(profile_image_id)から「_id」を取った「profile_image」を記述。
  attachment :profile_image

end

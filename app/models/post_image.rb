class PostImage < ApplicationRecord

	belongs_to :user #userモデルに属する
	attachment :image
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	#「validates」で対象とする項目を指定し、入力されたデータのpresence(存在)をチェック
	#データが入っていれば、「true」する
	validates :shop_name, presence: true
	validates :image, presence: true

	#引数で渡されたユーザのidがFavoritesテーブル内に存在(exsts?)しているかを調べる。
	#存在している → true, 存在していない → False
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end

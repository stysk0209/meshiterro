class PostImage < ApplicationRecord

	belongs_to :user #userモデルに属する
	attachment :image

end

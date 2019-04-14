class FavoritesController < ApplicationController


  def create
  	#いいね！した画像のIDを参照しローカル変数へ代入
  	post_image = PostImage.find(params[:post_image_id])
  	#いいね！したユーザの「いいね！変数」へ画像のIDを代入
  	favorite = current_user.favorites.new(post_image_id: post_image.id)
  	favorite.save
  	redirect_to post_image_path(post_image)
  end

  def destroy
  	post_image = PostImage.find(params[:post_image_id])
  	favorite = current_user.favorites.find_by(post_image_id: post_image.id)
  	favorite.destroy
  	redirect_to post_image_path(post_image)
  end
end

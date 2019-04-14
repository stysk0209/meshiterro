class PostCommentsController < ApplicationController

	def create
		post_image = PostImage.find(params[:post_image_id])
		#誰が投稿したコメントか変数へ代入
		comment = current_user.post_comments.new(post_comment_params)
		#どの画像へ投稿したコメントか変数へ代入
		comment.post_image_id = post_image.id
		comment.save
		redirect_to post_image_path(post_image)
	end

	private

	def post_comment_params
		params.require(:post_comment).permit(:user_id, :post_image_id, :comment)
	end

end

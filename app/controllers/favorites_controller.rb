class FavoritesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: @post)

		authorize favorite

		if favorite.save
			flash[:notice] = "Favorited! We thought this one was special, too."
		else
			flash[:notice] = "Oops - please try again."
		end
		
		redirect_to [@post.topic, @post]

	end

	def destroy
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.find(params[:id])

		authorize favorite

		if favorite.destroy
			flash[:notice] = "Removed from favorites.  We never liked it either."
		else
			flash[:notice] = "Oops - please try again."
		end

		redirect_to [@post.topic, @post]

	end

end

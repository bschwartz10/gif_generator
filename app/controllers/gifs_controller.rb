class GifsController < ApplicationController
  def favorite
    @gif = Gif.find(params[:id])
    @user = current_user

    type = params[:type]
    if type == "favorite"
      current_user.gifs << @gif unless current_user.gifs.include?(@gif)
      redirect_back(fallback_location: category_path(@gif.category))
      flash[:notice] = "You favorited a #{@gif.category.name}'s gif!"
    elsif type == "unfavorite"
      current_user.gifs.delete(@gif)
      redirect_back(fallback_location: user_path(@user))
      flash[:notice] = "You unfavorited a #{@gif.category.name}'s gif!"
    else
      redirect_back(fallback_location: category_path(@gif.category))
      flash[:notice] = "Nothing happened"
    end
  end
end

class GifsController < ApplicationController
  def favorite
    @gif = Gif.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.gifs << @gif unless current_user.gifs.include?(@gif)
      redirect_to :back, notice: "You favorited a #{@gif.category.name}'s gif!"
    elsif type == "unfavorite"
      current_user.gifs.delete(@gif)
      redirect_to :back, notice: "Unfavorited #{@gif.category.name}'s gif!"
    else
       redirect_to :back, notice: 'Nothing happened.'
    end
  end
end

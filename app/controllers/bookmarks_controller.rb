class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # no need for strong params cause the entire params is not being passed
    @bookmark = Bookmark.new(strong_params)
    # @ is still needed, in case creation fails...
    # the form in bookmarks/new.html.erb will still be able to access @list instance variable
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    # need to specify the bookmark.list.id so that lists#show can use the same id params
    redirect_to list_path(bookmark.list.id)
  end

  private

  def strong_params 
    params.require(:bookmark).permit(:movie_id, :comment, :poster_img)
  end
end

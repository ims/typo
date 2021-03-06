class Sync::BlogController < Sync::BaseController
  def index
    @blog = Blog.find(1)
    respond_to do |format|
      format.json { render :json => @blog.to_a.to_json }
    end
  end
end

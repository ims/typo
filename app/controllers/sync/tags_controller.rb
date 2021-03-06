class Sync::TagsController < Sync::BaseController

  def index
    @tags = Tag.find(:all)
    respond_to do |format|
      format.json { render :json => @tags.to_json }
    end
  end

end

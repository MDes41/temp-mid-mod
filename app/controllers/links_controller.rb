
class LinksController < ApplicationController
  def index
    # @link = current_user.link.new
    @links = current_user.links
  end

  def create
    byebug
    @link = Link.new(link_params)
    if @link.save
      flash['alert-success'] = "Created Link"
      redirect_to root_path
    else
      flash['alert-danger'] = @link.errors.full_messages.join(', ')
      redirect_to root_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update_attributes(link_params)
    redirect_to links_path
  end

  private
    def link_params
      params.require(:link).permit(:url, :title)
    end

    def update_params
    params.permit(:read)
  end
end

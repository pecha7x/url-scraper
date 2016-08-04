class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def show
    render json: @page
  end

  def create
    @page = Page.preload(:tags).new(page_params)

    if @page.save
      render json: @page, status: :created
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  private
    def set_page
      find_by = params[:url].blank? ? { id: params[:id] } : { url: params[:url] }
      @page = Page.preload(:tags).find_by(find_by)
    end

    def page_params
      params.require(:page).permit(:url)
    end
end

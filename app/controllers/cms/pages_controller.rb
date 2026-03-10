class Cms::PagesController < ApplicationController
  def index
    slugs = params[:path].split("/")

    root_category = nil

    result = Cms::Page.find_by_path(root_category, slugs)

    return raise_not_found unless result

    @category, @page = result
    if @page
      render :show
    else
      @pages = @category.pages.published.order(created_at: :desc)
    end
  end

  private

  def raise_not_found
    raise ActionController::RoutingError, "Not Found"
  end
end

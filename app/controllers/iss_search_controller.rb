class IssSearchController < ApplicationController
  def index
    render locals: {
      facade: IssSearchResultFacade.new(iss_search_params)
      }
  end

  private
    def iss_search_params
      params.permit(:location)
    end
end

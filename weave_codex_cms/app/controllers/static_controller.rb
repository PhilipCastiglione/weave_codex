class StaticController < ApplicationController
  # GET /
  def index
  end

  # POST /static/publish
  def publish
    # TODO: Implement publishing logic
    redirect_to root_url, notice: "Publishing complete."
  end
end

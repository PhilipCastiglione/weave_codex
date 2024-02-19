class StaticController < ApplicationController
  # GET /
  def index
  end

  # POST /static/publish
  def publish
    Publisher.publish

    redirect_to root_url, notice: "Publishing complete."
  end
end

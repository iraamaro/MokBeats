class Api::V1::RepositoriesController < ApplicationController
  def index
    @tracks = Track.all
    render json: @tracks
  end
end

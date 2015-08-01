class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]

  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.includes(:books, :published).all

    render json: @authors
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
    render json: @author, include: ['books']
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
  end

  private

    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.permit(:name)
    end
end

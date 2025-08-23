class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find_by(id: params[:id])
    redirect_to lists_path unless @list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params.merge(user: Current.user))
    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
    redirect_to lists_path unless @list
  end

  def update
    @list = List.find_by(id: params[:id])
    if @list && @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    elsif @list
      render :edit, status: :unprocessable_entity
    else
      redirect_to lists_path, alert: 'List not found.'
    end
  end

  def destroy
    @list = List.find_by(id: params[:id])
    if @list
      @list.destroy
      redirect_to lists_path, notice: 'List was successfully deleted.'
    else
      redirect_to lists_path, alert: 'List not found.'
    end
  end

  private

  def list_params
    params.expect(list: [:name])
  end
end

# coding: utf-8

class WorkTypesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @works_types = WorkType.all
  end

  def show
    @work_type = WorkType.find(params[:id])
  end

  def edit
    @work_type = WorkType.find(params[:id])
    @work_types = WorkType.all
  end

  def destroy
    WorkType.find(params[:id]).destroy
    redirect_to new_work_type_url
  end

  def new
    @work_type = WorkType.new
    @work_types = WorkType.all
  end

  def create
    @work_type = WorkType.new(work_type_params)

    respond_to do |format|
      if @work_type.save
        format.html { redirect_to @work_type, notice: 'Новый тип создан' }
        format.json { render action: 'index', status: :created, location: @work_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def work_type_params
    params.require(:work_type).permit(:name, :description)
  end

end
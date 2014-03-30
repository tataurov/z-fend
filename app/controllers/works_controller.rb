# coding: utf-8

class WorksController < ApplicationController

  def index
    @works = Work.order("date DESC").all
    @work_years = @works.group_by { |t| t.date.beginning_of_year }

  end

  def new
    @work = Work.new
    @works_types = WorkType.all
  end
  
  def show
    @work = Work.find(params[:id])	
  end

  def edit
    @work = Work.find(params[:id])
    @works_types = WorkType.all
  end

  def update
    @work = Work.find(params[:id])
    @work.work_types = works_types

    if @work.update(work_params)
      redirect_to works_url
    else
      render 'edit'
    end
  end

  def destroy
    Work.find(params[:id]).destroy
    redirect_to works_url
  end

  def create
    @work = Work.new(work_params)
    @work.work_types = works_types

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Работа успешно создана' }
        format.json { render action: 'index', status: :created, location: @work }
      else
        format.html { render action: 'new' }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end


  def works_types
    if  params[:work_types].present?
      WorkType.find(params[:work_types])
    else
      []
    end
  end

  def work_params
    params.require(:work).permit(:name, :url, :site_url, :pages_count, :w_type, :date, :image)
  end

end

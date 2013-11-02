class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end
  
  def show
    @work = Work.find(params[:id])	
  end

  # GET /users/1/edit
  def edit
  end

  def destroy
    Work.find(params[:id]).destroy
    redirect_to works_url
  end

  # POST /users
  # POST /users.json
  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
        format.json { render action: 'index', status: :created, location: @work }
      else
        format.html { render action: 'new' }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def work_params
    params.require(:work).permit(:name, :url, :site_url, :pages_count, :w_type, :date, :image)
  end

end

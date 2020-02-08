class ProjectsController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: :dashboard
  before_action :set_project, only: [ :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @project_proposal = Project.where(state:'proposal')
    @project_in_progress = Project.where(state:'in progress')
    @project_finished = Project.where(state:'finished')

  end

  def dashboard
    @project_proposal = Project.where(state:'proposal')
    @project_in_progress = Project.where(state:'in progress')
    @project_finished = Project.where(state:'finished')
  end


  # GET /projects/new
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
      if @project.save
          redirect_to root_path, notice:'ADDING PROJECT: OK'
      else
          redirect_to new_path, alert: 'SOMETHING IS WRONG. PLEASE TRY AGAIN'
      end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
  end

end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
        format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
        @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :start_date, :end_date, :state)
    end
end

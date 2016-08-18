class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_filter :verify_is_admin , except: [:show]

  # GET /employees
  # GET /employees.json
  def index
    @employees = User.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @imp = ImplementerRequest.where(User_id: @employee.id)
  end

  # GET /employees/new
  def new
    @employee = User.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = User.new(employee_params)
    
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    # respond_to do |format|
      if @employee.update(employee_params)
        # format.html { redirect_to employee_path(@employee), notice: 'User was successfully updated.' }
        # format.json { render :show, status: :ok, location: @employee }
        redirect_to employee_path(@employee), notice: 'User was successfully updated.'
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      if params[:id].nil? # if there is no user id in params, show current one
        @employee = current_user
      else
        @employee = User.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:user).permit(:name, :telephone, :email, :work_type, :area_residence, :service_area, :coordination_skills, :implementation_skills, :appraisal_grade, :employee_type, :Company_id, :password, :image)
    end
end

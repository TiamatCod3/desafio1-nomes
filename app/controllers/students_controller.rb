class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
      # @students = Student.all
      @student = Student.search(params[:search])
      # debugger
      if @student.nil? && !params[:search].nil?
        flash[:notice] = "Aluno não encontrado"
      elsif !@student.nil? && !@student.active?
        flash[:notice] =  @student.name.split[0] + ", sua matrícula está inativa, favor entrar em contato com o STI"
        redirect_to student_url(@student)
      end
    # debugger
  end

  # GET /students/1 or /students/1.json
  def show

  end

  def search
    # debugger
    # @student = Student.search(params[:search])
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit

  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params) 
        format.html { redirect_to student_url(@student), 
          notice: "A criação de seu e-mail (#{@student.uffmail}) será feita nos próximos minutos.
          Um SMS foi enviado para #{@student.phone} com a sua senha de acesso." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { redirect_to student_url(@student), 
          notice: "Usuário inativo, favor entrar em contato com o STI" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :register, :phone, :mail, :uffmail, :status, :search)
    end
end

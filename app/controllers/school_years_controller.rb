class SchoolYearsController < ApplicationController
  before_action :set_school_year, only: [:show, :edit, :update, :destroy]

  # GET /school_years
  def index
    @school_years = current_school.school_years.by_date
  end

  # GET /school_years/1
  def show
  end

  # GET /school_years/new
  def new
    @school_year = current_school.school_years.build
  end

  # GET /school_years/1/edit
  def edit
  end

  # POST /school_years
  def create
    @school_year = current_school.school_years.build(school_year_params)

    if @school_year.save
      redirect_to @school_year, notice: 'Schuljahr wurde erfolgreich erstellt.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /school_years/1
  def update
    if @school_year.update(school_year_params)
      redirect_to @school_year, notice: 'Schuljahr wurde erfolgreich aktualisiert.'
    else
      render action: 'edit'
    end
  end

  # DELETE /school_years/1
  def destroy
    @school_year.destroy
    redirect_to school_years_url, notice: 'Schuljahr wurde erfolgreich gelöscht.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_year
      @school_year = current_school.school_years.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def school_year_params
      params.require(:school_year).permit(:name, :start_date, :end_date)
    end
end

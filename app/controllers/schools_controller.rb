class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update]

  # GET /school
  def show
  end

  # GET /school/edit
  def edit
  end

  # PATCH/PUT /school
  def update
    if @school.update(school_params)
      redirect_to school_path, notice: 'Schule wurde erfolgreich aktualisiert.'
    else
      render action: 'edit'
    end
  end

  private

  def set_school
    @school ||= current_school
  end

  def school_params
    params.require(:school).permit(:name, :street, :postal_code, :city, :country, :phone, :fax, :email, :web_page, :headmaster_id, :deputy_headmaster_id, :default_school_year_id)
  end
end

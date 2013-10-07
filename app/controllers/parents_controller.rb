class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]

  # GET /parents
  def index
    @parents = current_school.parents.all
  end

  # GET /parents/1
  def show
  end

  # GET /parents/new
  def new
    @parent = current_school.parents.new
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  def create
    @parent = current_school.parents.new(parent_params)

    if @parent.save
      redirect_to @parent, notice: 'Elternteil wurde erfolgreich erstellt.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /parents/1
  def update
    if @parent.update(parent_params)
      redirect_to @parent, notice: 'Elternteil wurde erfolgreich aktualisiert.'
    else
      render action: 'edit'
    end
  end

  # DELETE /parents/1
  def destroy
    @parent.destroy
    redirect_to parents_url, notice: 'Elternteil wurde erfolgreich gelöscht.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = current_school.parents.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parent_params
      params.require(:parent).permit(:last_name, :first_name, :form_of_address, :gender, :date_of_birth, :email)
    end
end

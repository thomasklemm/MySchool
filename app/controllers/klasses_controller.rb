class KlassesController < ApplicationController
  before_action :set_klass, only: [:show, :edit, :update, :destroy]
  layout 'klass', only: :show

  # GET /klasses
  def index
    @klasses = current_school_year.klasses
  end

  # GET /klasses/1
  def show
  end

  # GET /klasses/new
  def new
    @klass = current_school_year.klasses.build
  end

  # GET /klasses/1/edit
  def edit
  end

  # POST /klasses
  def create
    @klass = current_school_year.klasses.build(klass_params)

    if @klass.save
      redirect_to @klass, notice: 'Klasse wurde erfolgreich erstellt.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /klasses/1
  def update
    if @klass.update(klass_params)
      redirect_to @klass, notice: 'Klasse wurde erfolgreich aktualisiert.'
    else
      render action: 'edit'
    end
  end

  # DELETE /klasses/1
  def destroy
    @klass.destroy
    redirect_to klasses_url, notice: 'Klasse wurde erfolgreich gelöscht.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_klass
      @klass = current_school_year.klasses.find(params[:klass_id] || params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def klass_params
      params.require(:klass).permit(:name)
    end
end

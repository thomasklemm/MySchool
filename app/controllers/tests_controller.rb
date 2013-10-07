class TestsController < ApplicationController
  before_action :set_klass, only: [:index, :new, :create]
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  layout 'klass'

  # GET /tests
  def index
    @tests = @klass.tests.order(date: :asc)
  end

  # GET /tests/1
  def show
  end

  # GET /tests/new
  def new
    @test = @klass.tests.build
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  def create
    @test = @klass.tests.build(test_params)

    if @test.save
      redirect_to [@test.klass, :tests], notice: 'Klassenarbeit wurde erfolgreich erstellt.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /tests/1
  def update
    if @test.update(test_params)
      redirect_to [@test.klass, :tests], notice: 'Klassenarbeit wurde erfolgreich aktualisiert.'
    else
      render action: 'edit'
    end
  end

  # DELETE /tests/1
  def destroy
    @test.destroy
    redirect_to [@test.klass, :tests], notice: 'Klassenarbeit wurde erfolgreich gelöscht.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = current_school_year.tests.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_params
      params.require(:test).permit(:name, :date, :teacher_id)
    end
end

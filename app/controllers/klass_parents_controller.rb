class KlassParentsController < KlassController
  def index
    @parents = @klass.parents.order(last_name: :asc, first_name: :asc)
  end
end

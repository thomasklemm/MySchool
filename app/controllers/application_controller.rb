class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_school, :current_school_year

  private

  def current_school
    @current_school ||= School.first
  end

  def current_school_year
    @current_school_year ||= current_school.school_years.first
  end

  def set_klass
    @klass ||= current_school_year.klasses.find(params[:klass_id])
  end

  # def default_url_options
  #   { host: 'my_school.dev' }
  # end
end

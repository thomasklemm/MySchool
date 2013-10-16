class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_school, :current_school_year

  before_action :ensure_current_school
  before_action :ensure_current_school_year

  private

  def current_school
    @current_school ||= School.first
  end

  def current_school_year
    @current_school_year ||= current_school_year!
  end

  def current_school_year!
    current_school.school_years.find_by(id: session[:current_school_year_id]).presence ||
    current_school.current_school_year.presence ||
    current_school.school_years.first
  end

  def ensure_current_school
    raise "Expected a school to be set for this request." unless current_school
  end

  def ensure_current_school_year
    raise "Expected a school year to be set for this request." unless current_school_year
  end

  def set_klass
    @klass ||= current_school_year.klasses.find(params[:klass_id])
  end

  # def default_url_options
  #   { host: 'my_school.dev' }
  # end
end

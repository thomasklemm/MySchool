MySchool::Application.routes.draw do
  resources :students
  resources :teachers

  resources :klasses do
    resources :students, controller: 'klass_students', only: :index
    resources :birthdays, controller: 'klass_birthdays', only: :index
  end

  resources :school_years

  root 'teachers#index'
end

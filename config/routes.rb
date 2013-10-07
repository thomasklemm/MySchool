MySchool::Application.routes.draw do
  resources :teachers
  resources :students
  resources :parents
  resources :school_years

  resources :klasses do
    resources :students, controller: 'klass_students', only: :index
    resources :parents, controller: 'klass_parents', only: :index
    resources :teachers, controller: 'klass_teachers', only: :index
    resources :birthdays, controller: 'klass_birthdays', only: :index
    resources :courses
  end

  root 'teachers#index'
end

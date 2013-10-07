MySchool::Application.routes.draw do
  resources :teachers
  resources :students
  resources :parents

  resources :klasses do
    resources :students, controller: 'klass_students', only: :index
    resources :parents, controller: 'klass_parents', only: :index
    resources :teachers, controller: 'klass_teachers', only: :index
    resources :birthdays, controller: 'klass_birthdays', only: :index
  end

  resources :school_years do
    resources :courses
  end

  root 'teachers#index'
end

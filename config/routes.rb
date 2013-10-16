MySchool::Application.routes.draw do
  resource :school, only: [:show, :edit, :update]
  resources :school_years do
    post :set, on: :member
  end

  resources :teachers
  resources :students
  resources :parents

  resources :klasses, shallow: true do
    resources :students, controller: 'klass_students', only: :index
    resources :parents, controller: 'klass_parents', only: :index
    resources :teachers, controller: 'klass_teachers', only: :index
    resources :birthdays, controller: 'klass_birthdays', only: :index
    resources :courses
    resources :tests
  end

  root 'teachers#index'
end

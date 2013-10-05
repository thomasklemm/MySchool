MySchool::Application.routes.draw do
  resources :students
  resources :teachers
  resources :klasses
  resources :school_years

  root 'teachers#index'
end

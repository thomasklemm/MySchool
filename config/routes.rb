MySchool::Application.routes.draw do
  resources :school_years

  resources :students
  resources :teachers

  root 'teachers#index'
end

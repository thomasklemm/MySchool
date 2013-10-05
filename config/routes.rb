MySchool::Application.routes.draw do
  resources :students
  resources :teachers

  root 'teachers#index'
end

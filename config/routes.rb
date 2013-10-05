MySchool::Application.routes.draw do
  resources :students
  resources :teachers

  root to: redirect("/students")
end

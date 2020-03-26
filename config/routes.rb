Rails.application.routes.draw do
  resources :students, to: [:index, :show]
  get '/students/:id/activate', to: 'students#activate', as: 'activate_student'
end

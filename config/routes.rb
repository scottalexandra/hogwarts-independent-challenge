Rails.application.routes.draw do
  get '/professors/:id', to: 'professors#show'
  get '/professors', to: 'professors#index'
  get '/professors/:id/edit', to: 'professors#edit'
  patch '/professors/:id', to: 'professors#update'
  delete '/professors/:professor_id/students/:student_id', to: 'professor_students#destroy'
end

Rails.application.routes.draw do
  get 'welcome/index'

  # resources :text_messages
  # get "/text_messages/new" => "text_messages#new"
  # get "/text_messages" => "text_messages#index"
  # post "/text_messages" => "text_messages#create"

  get '/alerts' => "alerts#index"
  get '/daily_schedules' => "daily_schedules#index"
  post '/daily_schedules' => "daily_schedules#create"

  post "/manager" => "manager#create"
  # get "/ondeck_checks" => "ondeck_checks#index"
  # delete "/text_messages" => "text_messages#destroy"
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # resources :text_messages
  get "/text_messages/new" => "text_messages#new"
  # get "/text_messages" => "text_messages#index"
  post "/text_messages" => "text_messages#create"
  get "/ondeck_checks" => "ondeck_checks#index"
  # delete "/text_messages" => "text_messages#destroy"
  root 'text_messages#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

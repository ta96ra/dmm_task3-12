Rails.application.routes.draw do
  get '/' => 'homes#top'
  get '/books' => 'books#index'
  get '/bokks' => 'books#new'
  get '/books/xxxx' => 'books#show'
  get '/books/xxxx/edit' => 'bools#edit'
  
  # get 'books/index'
  # get 'books/edit'
  # get 'books/show'
  # get 'books/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

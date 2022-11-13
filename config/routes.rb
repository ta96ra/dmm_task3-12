Rails.application.routes.draw do
  get '/' => 'homes#top',as:'root'
  
  resources:books
  
  # 自動生成されるのが下記に相当
  
 
  # get '/books' => 'books#index'as:'books'
  # post '/books' => 'books#create'  #投稿時はcreateアクションを実行
  # get '/books/:id' => 'books#show',as:'book'
  # #urlがBookテーブルidカラムとなるよう記載、book=books/:idとして扱う
  # get '/books/:id/edit' => 'books#edit',as:'edit_book'
  # patch 'books/:id' =>  'books#update',as:'book'
  # delete 'books/:id' => 'books#destroy',as:'book'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  
  #タスク一覧画面へのリンク
  root 'tasks#index'
  
  resources :sessions, only: [:new, :create, :destroy]
  #ユーザの登録フォームを作成
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  #タスク一覧
  resources :tasks

 end
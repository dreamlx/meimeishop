Rails.application.routes.draw do
  resources :pictures
  resources :buyers
  resources :providers
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do

    namespace :small_routine do
      resources :wx_users do
        collection do
          post :login
          post :logout
          post :bind
          get :info
          get :t_list
          post :add_record
          post :update_user_info
        end
      end
      resources :buyers do
        collection do
          post :upload
        end
      end
      resources :providers do
        collection do
          get :main_category_list
          get :sub_category_list
          get :item_category_list
          post :upload
        end
      end
      resources :comments
    end
  end

end

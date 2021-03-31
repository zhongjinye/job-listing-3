Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 namespace :account do
   resources :resumes
 end

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end

      resources :locations do
        member do
          post :publish
          post :hide
          post :up
          post :down
        end
      end

      resources :categories do
        member do
          post :publish
          post :hide
          post :up
          post :down
        end
      end

      resources :resumes
    end
  end
  resources :jobs do
    resources :resumes
  end
  resources :guanyus
  resources :jobs
  # resources :registrations, :controller => "job_registrations"
  root 'welcome#index'
end

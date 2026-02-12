Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Auth
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Setup wizard
  resource :setup, only: [:show, :update], controller: "setup" do
    member do
      get :basics
      patch :basics, action: :update_basics
      get :officials
      patch :officials, action: :update_officials
      get :services
      patch :services, action: :update_services
      get :contact
      patch :contact, action: :update_contact
      get :preview
      patch :publish, action: :do_publish
    end
  end

  # Admin dashboard
  namespace :admin do
    root to: "dashboard#index"
    resource :site, only: [:edit, :update]
    resources :officials, except: [:show]
    resources :services, except: [:show] do
      resources :service_steps, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :announcements
    resources :pages
    resources :documents, except: [:show]
    resources :emergency_contacts, except: [:show]
    resources :foi_requests, only: [:index, :show, :update]
  end

  # Public site view (by slug)
  get "sites/:slug", to: "public_sites#show", as: :public_site
  get "sites/:slug/services", to: "public_sites#services", as: :public_site_services
  get "sites/:slug/charter", to: "public_sites#charter", as: :public_site_charter
  get "sites/:slug/charter/:service_id", to: "public_sites#charter_service", as: :public_site_charter_service
  get "sites/:slug/officials", to: "public_sites#officials", as: :public_site_officials
  get "sites/:slug/transparency", to: "public_sites#transparency", as: :public_site_transparency
  get "sites/:slug/documents", to: "public_sites#documents", as: :public_site_documents
  get "sites/:slug/announcements", to: "public_sites#announcements", as: :public_site_announcements
  get "sites/:slug/foi", to: "public_sites#foi", as: :public_site_foi
  post "sites/:slug/foi", to: "public_sites#create_foi"
  get "sites/:slug/foi/track", to: "public_sites#foi_track", as: :public_site_foi_track
  get "sites/:slug/contact", to: "public_sites#contact", as: :public_site_contact
  get "sites/:slug/emergency", to: "public_sites#emergency", as: :public_site_emergency

  # Landing page
  root "home#index"
end

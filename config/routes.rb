Rails.application.routes.draw do
  root 'screensaver#index'

  get 'screensaver/index'
  get 'screensaver/new_image'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

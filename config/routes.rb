Rails.application.routes.draw do
  resources :devices, :playlists, :media, only: [:create, :index, :update, :destroy]

  patch '/devices', to: 'devices#update_one'
  delete '/devices', to: 'devices#destroy'

  patch '/playlists', to: 'playlists#update_one'
  delete '/playlists', to: 'playlists#update_one'
  
  patch '/media', to: 'media#update_one'
  delete '/media', to: 'media#update_one'

end
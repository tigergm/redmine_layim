# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'layim', :to => 'layim#init'
get 'layim_group', :to => 'layim#group'
get 'layim_update_status', :to => 'layim#update_status'
get 'layim_update_sign', :to => 'layim#update_sign'
get 'layim_update_init_skin', :to => 'layim#update_skin'
get 'monitors/show'
mount ActionCable.server => '/cable'
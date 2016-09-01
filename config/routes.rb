Rails.application.routes.draw do
  get '/first' => 'contacts#first'
  get '/all' => 'contacts#all'
  get '/add_contact' => 'contacts#add'
  post '/contact_added' => 'contacts#added'
end

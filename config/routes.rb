Rails.application.routes.draw do
  get '/first' => 'contacts#first'
  get '/all' => 'contacts#all'
end

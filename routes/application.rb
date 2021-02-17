# Routes

get '/?' do
  title = t('title.home')
  description = t('meta-description.home')
  erb :index, locals: { meta_title: title, meta_description: description }
end

get '/blog/?' do
  redirect '/blog/es/'
end

#For now, page will be only in spanish
#namespace(/#{I18n.locales_path}/) do
#  before do
#    set_environment(params['captures'][0], request.path_info)
#  end

#  get '/?' do
#    title = t('title.home')
#    description = t('meta-description.home')
#    erb :index, locals: { meta_title: title, meta_description: description }
#  end
#end

# 404 Error!
not_found do
  status 404
  title = '404 - Not Found'
  description = ''
  slim :not_found, locals: { meta_title: title, meta_description: description }
end

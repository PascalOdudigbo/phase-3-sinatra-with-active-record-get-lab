class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/' do
    "Hello World"
  end

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do 
    bakeries = Bakery.all.find(params[:id])
    bakeries.to_json(include: :baked_goods)

  end

  get '/baked_goods/by_price' do 
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do 
    # most_expensive = BakedGood.most_expensive
    # most_expensive.to_json

    most_expensive = BakedGood.by_price.first
    most_expensive.to_json
  end

end

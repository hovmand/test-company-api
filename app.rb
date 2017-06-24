require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/company'

set :protection, false

before do
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
  content_type :json
end

get '/company' do
  company = Company.all()
  company.to_json
end

post '/company' do
  request.body.rewind
  body = request.body.read

  if body.empty?
    status 400
    return
  end

  data = JSON.parse body

  missing = []
  required = ['cvr', 'name', 'address', 'city', 'country']
  for r in required
    if not data.has_key?(r)
      missing.push r
    end
  end

  if missing.any?
    status 422
    return { 'missing' => missing }.to_json
  end

  company = Company.new(data)
  company.save
  company.to_json
end

get '/company/:id' do |id|
  begin
    company = Company.find(id)
  rescue ActiveRecord::RecordNotFound => e
    status 404
    return
  end

  company.to_json
end

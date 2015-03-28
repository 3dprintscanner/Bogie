# require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'httparty'
require 'bundler'

Bundler.require

require 'sinatra/asset_pipeline'

class App < Sinatra::Base

	set :assets_prefix, %w(assets vendor/assets)
  register Sinatra::AssetPipeline

  get '/' do
  	"This works"
  end

  #get my next train for platform X which is knowqn

  get '/nextrain/:stncode/:platform' do
  	nextrain(params[:stncode],params[:platform])
  end

  def nextrain(stationcode='EUS',platform='3')
  	@stationcode = stationcode
  	@platform = platform 
  	"#{@stationcode}:  #{@platform}"
  end


end





module RailApi
	class ApiError < StandardError
	end

	class Get
	include Faraday

		def request
			@request ||= Faraday.get(url)
		end

	end
end

class Api
	def response 
		request.env[:status] == 200 ? request.env[:body] : ApiError.new(request.env[:body])  
	end
end






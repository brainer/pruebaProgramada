class ServicesController < ApplicationController
  before_action :validate_params, only: [:articles_stores] 
 def stores #shows all of the stores
    @stores = Store.all
    render json: {stores: @stores.as_json({except: [:updated_at,:created_at]}),success: true,total_elements: @stores.length}
 end

  def articles #shows all of the articles
  	@articles = Article.all
  	render json: {articles: @articles.as_json({except: [:updated_at,:created_at]}),success: true,total_elements: @articles.length}
 end

  def articles_stores #shows  all of the articles per store 
    @store = Store.find_by_id(params[:id])
  	if @store.nil?
  		render :json => {:error_msg => "Record not found",:error_code => 404,:success => false}	
  	else
      render json: {articles: @store.articles.as_json({except: [:updated_at,:created_at]}),success: true,total_elements: @store.articles.size} 
    end
 end

 def numeric?(object)
  true if Float(object) rescue false
 end

 def validate_params #validates the params to be a numeric value
  render :json => {:error_msg => "Bad Request", :error_code => 400, :success=> false} unless numeric?(params[:id])
  end
end

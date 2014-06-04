 def prueba #validates the params to be a numeric value
    render :json => {:error_msg => "Bad Request", :error_code => 400, :success=> false} unless params[:id].is_a?(Numeric)
  end
class StaticPagesController < ApplicationController
  include StaticPagesHelper
  def home
    #
  end

  def contact
    #
  end

  def about
    #
  end

  def faq
    #
  end
  def locations
    #
  end

  def search
    @search_string = params[:search]
    if !params[:search].blank?
      results = searchDB(@search_string)
      if !results.nil?
        if !results.empty?
          resultObj = results[0]

          # Detecting a String means a location was found
          if resultObj.instance_of? String
            @location = resultObj

          # Detecting an Array means only guides were found
          elsif resultObj.instance_of? Array
            @guide_list = resultObj

          # If this occurs, something broke in searchDB()
          else
            flash.now[:danger] = "Query resulted in error"
          end

          resultObj = results[1]
          if !resultObj.nil?
            @guide_list = resultObj
          end
        else
          flash.now[:danger] = "No results were found"
        end
      else
        # Should never reach this
        flash.now[:danger] = "No results returned"
      end
    end
    render 'search'
  end
end

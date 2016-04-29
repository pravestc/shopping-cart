class LanguagesController < ApplicationController

  def english
    uri_path = "/en/" + URI((request.referer || "")).path.gsub(/(\/(en|es)(\/|$))/,"") 
    redirect_to uri_path 
  end

  def spanish
    uri_path = "/es/" + URI((request.referer || "")).path.gsub(/(\/(en|es)(\/|$))/,"") 
    redirect_to uri_path
  end
end

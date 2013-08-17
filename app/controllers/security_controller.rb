#coding: utf-8
class SecurityController < MasterSecurityController
  before_filter :authorize
  def authorize
    if cookies[:usuario_id].to_s != "0"
      unless Persona.find_by_id(session[:usuario_id])
        redirect_to "/login", :alert => "Por favor inicie sesion."
      end
    else
      session[:usuario_id] = cookies[:usuario_id].to_i
    end  
    
  end
end

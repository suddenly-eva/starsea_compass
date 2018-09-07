defmodule StarseaCompassWeb.PageController do
  use StarseaCompassWeb, :controller

  action_fallback(StarseaCompassWeb.V1.FallbackController)

  def index(conn, _) do
    body = ~S"""
            .__.. ,              __ .               .                     
      ___   [__]|-+- _.*._. _   /  `|_ ._. _ ._ * _.| _  __   ___         
            |  || | (_]|[  (/,  \__.[ )[  (_)[ )|(_.|(/,_)                                                                      
    .___..        __. ,                   __                             
      |  |_  _   (__ -+- _.._. __ _  _.  /  ` _ ._ _ ._  _. __ __        
      |  [ )(/,  .__) | (_][  _) (/,(_]  \__.(_)[ | )[_)(_]_) _)         
                                                  |                   
                                                                                                                 
  .        __.     .  .      .     .__                  _,  _,  ,   _, 
  |_   .  (__ . . _| _| _ ._ |  .  [ __ _.._ _  _  __  '_) |.| /|  (_) 
  [_)\_|  .__)(_|(_](_](/,[ )|\_|  [_./(_][ | )(/,_)   /_. |_| .|. (_) 
     ._|                      ._|                                      

"""
    text(conn, body)
  end
end
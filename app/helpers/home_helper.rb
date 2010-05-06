module HomeHelper

  def flash_div *keys
    keys.collect { |key| 
      content_tag(:div, 
        content_tag(:h1, key.to_s.capitalize) << flash[key],
                    :class => "flash flash_#{key}", 
                    :onClick => "new Effect.DropOut(this)") if flash[key] 
    }.join
  end

end

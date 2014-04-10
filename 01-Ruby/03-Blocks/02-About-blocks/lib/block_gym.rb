def tag(tag_name, attr = nil)
  #TODO:  Build HTML tags around  content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  tag(tag_name){attr}
end

def timer_for
  #TODO:  Return time taken to execute the given block
  beginning_time = Time.now
  yield
  end_time = Time.now
  duration = end_time - beginning_time
end

def transform(element)
  #TODO:  Simply execute the given block on element
end

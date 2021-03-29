module VisualHelpers

  def end_of_lecture(type=:thatsall)
    if (type == :thatsall)
      "<slide_break></slide_break>" + include_image("/content/topics/images/thatsallfolks.jpg")
    end
  end
end

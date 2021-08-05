module VisualHelpers

  def end_of_lecture(type=:thatsall)
    if (type == :thatsall)
      "<slide_break></slide_break>" + "<h2>See You Next Time!</h2>" + include_image("/content/topics/images/thatsallfolks.jpg", extra: "d-block mx-auto")
    end
  end
end

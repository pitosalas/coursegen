module VisualHelpers

  def end_of_lecture(type=:thatsall)
    if (type == :thatsall)
      part1 = "<slide_break></slide_break>\n\n"
      part2 = "## See you next time!!\n\n"
      part3 = "<img src=\"/content/topics/images/thatsallfolks.jpg\" class=\"img-thumbnail d-block mx-auto\" style=\"height:300px;\"/>"
      part1 + part2 + part3
    end
  end
end

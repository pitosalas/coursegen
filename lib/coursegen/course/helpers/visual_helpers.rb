module VisualHelpers
  def end_of_lecture(type=:random)
    if (type == :thatsall)
      part1 = "<slide_break></slide_break>\n\n"
      part2 = "## See you next time!!\n\n"
      part3 = "<img src=\"/content/topics/images/thatsallfolks.jpg\" class=\"img-thumbnail d-block mx-auto\" style=\"height:300px;\"/>"
    elsif type == :random
      part1 = "<slide_break></slide_break>\n\n"
      part2 = "## Thank you. Questions?"
      part3 = random_image :normal, "800", "50"
    end
    part1 + part2 + part3
  end
end

def random_image(_style, width, height)
  classes = "\"shadow p-3 bg-white rounded\""
  "<img class=#{classes} src=\"https://picsum.photos/#{width}/#{height}.jpg\" /> "
end

module VisualHelpers
  def end_of_lecture(type=:random)
    if (type == :thatsall)
      part1 = "<slide_break></slide_break>\n\n"
      part2 = "## See you next time!!\n\n"
      part3 = "<img src=\"/content/topics/images/thatsallfolks.jpg\" class=\"img-thumbnail d-block mx-auto\" style=\"height:300px;\"/>"
      part4 = ""
    elsif type == :random
      part1 = "<slide_break></slide_break>\n\n"
      part2 = "<h2 class=\"shadow p-3 bg-white rounded\">Thank you. Questions?"
      part3 = random_image :normal, "800", "50"
      part4 = "\</h2>"
    end
    part1 + part2 + part3 + part4
  end
end

def random_image(_style, width, height)
  "<img class=\"img-fluid\ w-100\" src=\"https://picsum.photos/#{width}/#{height}.jpg\" /> "
end

# LectureHelpers is used to calculate lecture number and date.
module LectureHelpers
  def lecture_number_str(citem)
    citem.lecture_number.to_s
  end

  def lecture_date
    '-ddd-'
  end
end

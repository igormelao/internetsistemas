module ClassroomsHelper
  def students_map
    Student.all.map { |s| [s.name, s.id] }
  end

  def courses_map
    Course.all.map { |c| [c.name, c.id] }
  end
end

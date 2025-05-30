require_relative '../android/image_exams_screen'

Before do
  @image_exams = ImageExamsScreen.new
end

When('I access the Image Exams section') do
  @image_exams.access_image_exams
end

When('I open the exam details') do
  @image_exams.open_more_info
end

When('I close the exam details') do
  @image_exams.close_more_info
end

When('I open a PDF exam') do
  @image_exams.open_pdf
end

When('I download the PDF exam') do
  @image_exams.download_pdf
end

When('I go back to the previous screen') do
  @image_exams.back
end

When('I open a video exam') do
  @image_exams.open_video
end

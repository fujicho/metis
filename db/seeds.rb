table_names = %w(teacher_members student_members student_events board_messages books questions answers)

table_names.each do |table_name|
  path = Rails.root.join("db","seeds","#{table_name}.rb")
  if File.exist?(path)
    puts "Creating #{ table_name}...."
    require(path)
  end
end
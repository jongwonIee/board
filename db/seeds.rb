puts "Inserting category data.."
[
    ["사랑", "love"],
    ["사는얘기", "life"],
    ["저.. 진지합니다", "serious"]
].each do |x|
  Category.create(name: x[0], en_name: x[1])
end

puts "Inserting post data.."
File.read("db/seed_data/posts.csv").split("\n").each do |line|
  data = line.strip.split(",")
  Post.create(
      category_id: data[0],
      title:       data[1],
      content:        data[2]
  )
end
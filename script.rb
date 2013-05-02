if ARGV[0] == nil
	print("do you want to replace images that have already been converted? (Y/n): ")
	input = gets.chomp
else
	input = ARGV[0]
end
images = File.join("**", "*.png")
Dir.glob(images).each do |image|
  outFile = "./bitFolder/#{image.split(".")[0]}.bmp"
  outFolder = outFile.split("/")[0..-2].join("\\")+"\""
  if !(Dir.exists?(outFolder[2..-2]))
    `mkdir #{outFolder[2..-2]}`
  end
  if !(input=="n" && File.file?(outFile))
    `convert ./#{image} -resize 684x608 -depth 1 -colors 2 #{outFile}`
  end
end

class Image
  attr_accessor :arr

  def initialize(arr)
    self.arr = arr
  end

  def width
    arr[0].length
  end

  def height
    arr.length
  end


  def output_image
    arr.each do |row|
      puts row.join
    end
  end

  def blur_coordinates
    coordinates = []
    arr.each_with_index do |row, row_index|
      row.each_with_index do |pixel, pixel_index|
        if pixel == 1
          coordinates << [row_index, pixel_index]
        end
      end
    end
    coordinates
  end



  def create_blur
    b = blur_coordinates
    arr.each_with_index do |row, row_index|
      row.each_with_index do |pixel, pixel_index|
        b.each do |blur_row, blur_pixel|
          if row_index == blur_row and pixel_index == blur_pixel
            arr[row_index - 1][pixel_index] = 1 unless row_index == 0
            arr[row_index + 1][pixel_index] = 1 unless row_index >= height - 1
            arr[row_index][pixel_index - 1] = 1 unless pixel_index == 0
            arr[row_index][pixel_index + 1] = 1 unless pixel_index >= width - 1
          end
        end
      end  
    end
  end

  def blur(distance)
    distance.times do
      create_blur
    end
  end
end


image = Image.new([
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,1,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,1]
])

puts "Your original image"
puts " "
image.output_image
puts " "
puts "How far would you like to blur this image?"
distance = gets.chomp.to_i
puts " "
puts "Your blurred image"
puts " "
image.blur(distance)
image.output_image

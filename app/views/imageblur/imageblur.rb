# imageblur.rb Coded by: Gregory Eglen on 08/03/2019
# updated for ImageBlur 2 Challenge 08/18/2019


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



  def blur
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
end


image = Image.new([
  [0,0,0,0],
  [0,1,0,0],
  [0,0,0,1],
  [0,0,0,0]
])

puts "Your original image"
puts " "
image.output_image
puts " "
puts "Your blurred image"
puts " "
image.blur
image.output_image

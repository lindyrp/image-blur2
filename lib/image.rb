class Image
  attr_accessor :image

  def initialize(image)
    self.image = image
  end

  def output_image
    self.image.each do |e|
      puts e.join
    end
  end

  def blur
    num_col = image.first.length
    num_row = image.length

    ones_ary = []
    image.each_index do |row|
      image[row].each_index do |col|
        if image[row][col] == 1
          ones_ary << [row, col]
        end
      end
    end 
    
    ones_ary.each do |point_array|
      # => breaks the point_array inner arrays into its two parts --
      # => wouldn't work if there was stuff in the middle
      row = point_array.first
      col = point_array.last
      # => this is where the transformation happens
      image[row - 1][col] = 1
      image[row][col - 1] = 1 unless col == 0
      image[row + 1][col] = 1 unless row >= num_row - 1
      image[row][col + 1] = 1 unless col >= num_col - 1 
    end

    output_image
  end

end


image2 = Image.new([
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 0, 0, 1],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0]
])
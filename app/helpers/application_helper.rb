module ApplicationHelper

  def to_money(amount)
    number_to_currency(amount, unit: "￥")
  end

  # 如果传入的字符串用|分隔且没有空格时，可用这个helper来重新生成一段有空格的string。
  def divide_text(text)
    result = []
    text.split('|').each do |w|
      result << w.strip
    end
    return result.join(' | ')
  end

  def get_stars(grade)
    g = grade.to_f
    stars = []

    case g

    when 0
      5.times do 
        stars << 0
      end
      return stars

    when 0...2
      stars << 1
      4.times do 
        stars << 0
      end
      return stars

    when 2...4 
      stars << 2
      stars << 1
      3.times do 
        stars << 0
      end
      return stars

    when 4...6
      2.times do 
        stars << 2
      end
      stars << 1
      2.times do 
        stars << 0
      end
      return stars

    when 6...8
      3.times do 
        stars << 2
      end
      stars << 1
      stars << 0
      return stars

    when 8...10
      4.times do 
        stars << 2
      end
      stars << 1
      return stars

    when 10
      5.times do 
        stars << 2
      end
      return stars
    end
  end
end

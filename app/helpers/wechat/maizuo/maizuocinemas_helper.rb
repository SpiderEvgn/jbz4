module Wechat::Maizuo::MaizuocinemasHelper

    # 连接 经度 和 纬度，输出一个完整的坐标
  def gps(longitude, latitude)
    if longitude != ""
      return longitude + ", " + latitude
    else
      return ""
    end
  end
  
end

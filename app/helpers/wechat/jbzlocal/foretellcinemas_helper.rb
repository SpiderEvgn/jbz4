module Wechat::Jbzlocal::ForetellcinemasHelper
  
  def transfer_to_hhmm(showTime)
    return showTime[0,2] + ':' + showTime[2,2]
  end

end

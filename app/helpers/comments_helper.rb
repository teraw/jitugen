module CommentsHelper
   def auto_rNum(text)
       #もし『>>』が付いた場合はURLリンクに置換
        uri_reg = URI.regexp(%w[http https])
        text.gsub(uri_reg) {%Q{<a href="#{$&}">#{$&}</a>}}
        
    if name.include?('>>')||name.include?('＞＞') then #nameに#が含まれる場合に実行
    
    end     
        
    end

end

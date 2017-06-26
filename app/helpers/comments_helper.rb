module CommentsHelper
   def auto_rNum(text)
        uri_reg = URI.regexp(%w[http https])
        text.gsub(uri_reg) {%Q{<a href="#{$&}">#{$&}</a>}}
    end

end

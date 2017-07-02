module ApplicationHelper
    def sortable(column, title = nil)
        title ||= column.titleize
        css_class = (column == sort_column) ? "current #{sort_direction}" : nil
        direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
        link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    end
 
    def autoLink(text)
            text.gsub(URI.regexp(%w[http https])) {%Q{<a href="#{$&}">#{$&}</a>}}
    end
    
    
    def name(name)
        if name.include?('#') then #nameに#が含まれる場合
            require "digest/trip"
            
            name, key = name.split "#", 2
            trip = Digest::Trip.digest key
           # trip = Digest::SHA1.digest key
            code = Base64.encode64(trip)
            # 先頭から12文字取り出す
            trip = code.slice(0, 12)
            [name, trip].join "◆" 
        elsif  name.empty? then #nameの値が未入力だった場合
            name = "名無しさん"
        else 
            name
        end
    end
    

    
    
end
module ApplicationHelper
    def sortable(column, title = nil)
        title ||= column.titleize
        css_class = (column == sort_column) ? "current #{sort_direction}" : nil
        direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
        link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    end
    
    
    
    def autoLink(text)
        uri_reg = URI.regexp(%w[http https])
        text.gsub(uri_reg) {%Q{<a href="#{$&}">#{$&}</a>}}
    end
    
    def name(name)
        if name.include?('#') then #nameに#が含まれる場合
            require "digest/trip"
            name, key = name.split "#", 2
            trip = Digest::Trip.digest key
            [name, trip].join "◆" 
        elsif  name = "" then #nameが未入力だった場合
            name && @editor = "名無しさん"
        else 
            name
        end
    end
end
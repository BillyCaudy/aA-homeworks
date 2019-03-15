class Map
    def initialize
        @my_map = []
        @my_keys = []
    end
    def set(key, value)
        idx = @my_keys.index(key)
        if idx == nil
            @my_map << [key,value]
            @my_keys << key
        else
            @my_map[idx][1] = value
        end
        idx || (@my_map.length - 1)
    end

    def get(key)
        idx = @my_keys.index(key)
        return nil if idx == nil
        @my_map[idx][1]
    end 

    def delete(key)
        idx = @my_keys.index(key)
        return nil if idx == nil
        del_val = @my_map[idx][1]
        @my_map.delete_at(idx)
        @my_keys.delete_at(idx)
        del_val
    end 

    def show
        p @my_map
    end
end
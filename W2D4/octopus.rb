
fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def octoslug(fishes) #bubblesort to find longest fish
    fishiz = fishes.dup
    sorted = false
    until sorted
        sorted = true
        (0...fishiz.length-1).each do |idx|
            if fishiz[idx].length > fishiz[idx+1].length
                sorted = false
                fishiz[idx], fishiz[idx+1] = fishiz[idx+1], fishiz[idx]
            end
        end
    end
    print " "
    p fishiz[-1]
end

def mergefish(fishiz)
    return fishiz if fishiz.length == 1
    mid = fishiz.length/2
    leftfish = mergefish(fishiz.take(mid))
    rightfish = mergefish(fishiz.drop(mid))
    mergefishes(leftfish,rightfish)
end

def mergefishes(leftfish,rightfish)
    fishiz = []
    until leftfish.empty? || rightfish.empty?
        if leftfish[0].length < rightfish[0].length
            fishiz << leftfish.shift
        else
            fishiz << rightfish.shift
        end
    end
    fishiz + leftfish + rightfish
end

def octodomi(fishes) #mergesort to find longest fish
    fishiz = fishes.dup
    mergefish(fishiz)
    print " "
    p fishiz[-1]
end

def clevrpod(fishes)
    long_fish = ''
    fishes.each do |fish|
        long_fish = fish if long_fish.length < fish.length
    end
    print " "
    p long_fish
end

octoslug(fishes)
octodomi(fishes)
clevrpod(fishes)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]


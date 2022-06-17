class Resolver
    def find_desired_pairs (input)
        number_list = input.split(',').map(&:to_i)
        
        desired_sum = number_list[0]
        input_array = number_list.drop(1)
        
        needed_to_fullfill_array = input_array.map do |e|
            desired_sum - e
        end
      
        input_array_as_hash = {}
    
        input_array.each do |e|
            input_array_as_hash[e] = e
        end
    
        result = []
    
        index = 0
    
        input_array.each do |e|
            need_to_fullfill_number = needed_to_fullfill_array[index]
    
            fullfill_number_for_this_element = input_array_as_hash[need_to_fullfill_number]
            next unless input_array_as_hash[need_to_fullfill_number]
    
            if e + input_array_as_hash[need_to_fullfill_number] == desired_sum
                result << [e, input_array_as_hash[need_to_fullfill_number]]
                input_array_as_hash[need_to_fullfill_number] = -1
            end
    
            index += 1
        end
    
        result
    end
end

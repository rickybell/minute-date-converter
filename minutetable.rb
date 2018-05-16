module Minutetable
    attr_reader :value,:minutes
    
    def initialize(value = nil)
        if !value.nil? && value > 0
            @value = value.nil? ? 0 : value
            @minutes = 1
        else
            raise StandardError, "Value should be greater then 0"
        end
    end
    
    def value
        @value
    end
    
    def amount
        value * @minutes
    end
    
    def calculate(total = nil)
        total * (minutes.nil? ? total : minutes)
    end

    def to_s 
        
    end
end
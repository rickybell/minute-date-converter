module Minutetable
    attr_reader :value,:minutes,:message_erro
    @message_erro = "Minutetable: Value should be greater then 0"
    def initialize(value = nil)
        # @message_erro = "Minutetable: Value should be greater then 0"
        if !value.nil? && value > 0
            @value = value.nil? ? 0 : value
            @minutes = 1
        else
            raise ArgumentError.new(@message_erro)
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
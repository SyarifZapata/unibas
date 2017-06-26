classdef ExampleClass
    %EXAMPLECLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access=private)
        Value
        counter
    end
    
    methods
        function y = ExampleClass(val)
            if isnumeric(val)
                y.Value = val;
            end
        end
    end

    methods
        function r = square(obj,n)
            r = [obj.Value].^n;
        end
    end
    methods(Static = true)
        
    end
    
end


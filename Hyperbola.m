classdef Hyperbola < Shapes
    %UNTITLED7 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        yCoorNeg
        transformedyCoorNeg
    end
    
    methods
        function translate(obj, x, y)
            obj.translate@Shapes(x,y);
            obj.transformedyCoorNeg = obj.yCoorNeg + y;
        end
        
        function shear(obj, angle)
        end
        
        function scale(obj, factor)
            obj.scale@Shapes(x,y);
            obj.transformedyCoorNeg = obj.yCoorNeg * y;
        end
        
        function rotate(obj, angle)
        end
        
        function reflectOverX(obj)
            obj.reflectOverX@Shapes(obj);
            obj.transformedyCoorNeg = -1 .* obj.yCoorNeg;
        end
        
        function reflectOverY(obj)
            obj.reflectOverY@Shapes(obj);
            obj.transformedyCoorNeg = obj.yCoorNeg;
        end
    end
    
end


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
            obj.transformedyCoorNeg = obj.yCoorNeg + y;
            obj.transformedXCoor = obj.xCoor * factor;
            obj.transformedYCoor = obj.yCoor * factor;
        end
        
        function rotate(obj, angle)
        end
        
        function reflectOverX(obj)
            obj.transformedXCoor = obj.xCoor;
            obj.transformedYCoor = -1 .* obj.yCoor;
        end
        
        function reflectOverY(obj)
            obj.transformedXCoor = -1 .* obj.xCoor;
            obj.transformedYCoor = obj.yCoor;
        end
    end
    
end


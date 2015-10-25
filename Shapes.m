classdef Shapes < matlab.mixin.Heterogeneous & handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        xCoor %stores the x - coordinates
        yCoor %stores the y - coordinates
        transformedXCoor %stores the transformed x - coordinates
        transformedYCoor %stores the transformed y - coordinates
    end
    
    methods
        function translate(obj, x, y)
            obj.transformedXCoor = obj.xCoor + x;
            obj.transformedYCoor = obj.yCoor + y;
        end
        
        function shear(obj, angle)
        end
        
        function scale(obj, factor)
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


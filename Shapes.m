classdef Shapes < matlab.mixin.Heterogeneous & handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        xCoor %stores the x - coordinates
        yCoor %stores the y - coordinates
        handle %stores the handle when plotted
        transformedXCoor %stores the transformed x - coordinates
        transformedYCoor %stores the transformed y - coordinates
        transformedHandle %stores the transformed handle when plotted
    end
    
    methods
        function translate(obj, x, y)
            obj.transformedXCoor = obj.xCoor + x;
            obj.transformedYCoor = obj.yCoor + y;
            display(obj);
        end
        
        function shear(obj, angle)
        end
        
        function scale(obj, factor)
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


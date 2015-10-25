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
            angle = angle/180 * pi;
            x_shear_matrix = [1, tan(angle);
                              0, 1];
            tempMatrix = [obj.xCoor;
                          obj.yCoor];
            tempMatrix = x_shear_matrix * tempMatrix;
            obj.transformedXCoor = tempMatrix(1,:);
            obj.transformedYCoor = tempMatrix(2,:);
            display(tempMatrix);
        end
        
        function scale(obj, x, y)
            obj.transformedXCoor = obj.xCoor * x;
            obj.transformedYCoor = obj.yCoor * y;
        end
        
        function rotate(obj, angle)
            delta = angle;
            delta = delta/ 180 * pi;
            whole_matrix = [cos(delta), sin(delta);
                            -sin(delta), cos(delta)];
            tempMatrix = [obj.xCoor;
                          obj.yCoor];
           tempMatrix = whole_matrix * tempMatrix;
            obj.transformedXCoor = tempMatrix(1,:);
            obj.transformedYCoor = tempMatrix(2,:);
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


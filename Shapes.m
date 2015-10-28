classdef Shapes < matlab.mixin.Heterogeneous & handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        xCoor %stores the x - coordinates
        yCoor %stores the y - coordinates
        prevXCoor %stores the transformed x - coordinates
        prevYCoor %stores the transformed y - coordinates
    end
    
    methods
        function translate(obj, x, y)
            obj.prevXCoor = obj.xCoor;
            obj.prevYCoor = obj.yCoor;
            obj.xCoor = obj.xCoor + x;
            obj.yCoor = obj.yCoor + y;
        end
        
        function shear(obj, angle)
            obj.prevXCoor = obj.xCoor;
            obj.prevYCoor = obj.yCoor;
            
            angle = angle/180 * pi;
            x_shear_matrix = [1, tan(angle);
                              0, 1];
            tempMatrix = [obj.xCoor;
                          obj.yCoor];
            tempMatrix = x_shear_matrix * tempMatrix;
            obj.xCoor = tempMatrix(1,:);
            obj.yCoor = tempMatrix(2,:);
            display(tempMatrix);
        end
        
        function scale(obj, x, y)
            obj.prevXCoor = obj.xCoor;
            obj.prevYCoor = obj.yCoor;
            obj.xCoor = obj.xCoor * x;
            obj.yCoor = obj.yCoor * y;
        end
        
        function rotate(obj, angle)
            obj.prevXCoor = obj.xCoor;
            obj.prevYCoor = obj.yCoor;
            delta = angle;
            delta = delta/ 180 * pi;
            whole_matrix = [cos(delta), sin(delta);
                            -sin(delta), cos(delta)];
            tempMatrix = [obj.xCoor;
                          obj.yCoor];
           tempMatrix = whole_matrix * tempMatrix;
            obj.xCoor = tempMatrix(1,:);
            obj.yCoor = tempMatrix(2,:);
        end
        
        function reflectOverX(obj)
            obj.prevXCoor = obj.xCoor;
            obj.prevYCoor = obj.yCoor;
            obj.xCoor = obj.xCoor;
            obj.yCoor = -1 .* obj.yCoor;
        end
        
        function reflectOverY(obj)
            obj.prevXCoor = obj.xCoor;
            obj.prevYCoor = obj.yCoor;
            obj.xCoor = -1 .* obj.xCoor;
            obj.yCoor = obj.yCoor;
        end
        
    end
    
end


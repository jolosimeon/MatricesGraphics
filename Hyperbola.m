classdef Hyperbola < Shapes
    %UNTITLED7 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        xCoor2
        yCoor2
        transformedXCoor2
        transformedYCoor2
    end
    
    methods
        function translate(obj, x, y)
            obj.translate@Shapes(x,y);
            obj.transformedXCoor2 = obj.xCoor2 + x;
            obj.transformedYCoor2 = obj.yCoor2 + y; 
        end
        
        function shear(obj, angle)
            obj.shear@Shapes(angle);
            angle = angle/180 * pi;
            x_shear_matrix = [1, tan(angle);
                              0, 1];
            tempMatrix = [obj.xCoor2;
                          obj.yCoor2];
            tempMatrix = x_shear_matrix * tempMatrix;
            obj.transformedXCoor2 = tempMatrix(1,:);
            obj.transformedYCoor2 = tempMatrix(2,:);
        end
        
        function scale(obj, x, y)
            obj.scale@Shapes(x,y);
            obj.transformedXCoor2 = obj.xCoor2 * x;
            obj.transformedYCoor2 = obj.yCoor2 * y;
        end
        
        function rotate(obj, angle)
            obj.rotate@Shapes(angle);
            delta = angle;
            delta = delta/ 180 * pi;
            whole_matrix = [cos(delta), sin(delta);
                            -sin(delta), cos(delta)];
            tempMatrix = [obj.xCoor2;
                          obj.yCoor2];
            tempMatrix = whole_matrix * tempMatrix;
            obj.transformedXCoor2 = tempMatrix(1,:);
            obj.transformedYCoor2 = tempMatrix(2,:);
        end
        
        function reflectOverX(obj)
            obj.reflectOverX@Shapes();
            obj.transformedXCoor2 = obj.xCoor2;
            obj.transformedYCoor2 = -1 .* obj.yCoor2;
        end
        
        function reflectOverY(obj)
            obj.reflectOverY@Shapes();
            obj.transformedXCoor2 = -1 * obj.xCoor2;
            obj.transformedYCoor2 = obj.yCoor2;
        end
    end
    
end


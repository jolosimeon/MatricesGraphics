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
            obj.shear@Shapes(angle);
            angle = angle/180 * pi;
            x_shear_matrix = [1, tan(angle);
                              0, 1];
            tempMatrix = [obj.xCoor;
                          obj.yCoorNeg];
            tempMatrix = x_shear_matrix * tempMatrix;
            obj.transformedyCoorNeg = tempMatrix(2,:);
        end
        
        function scale(obj, x, y)
            obj.scale@Shapes(x,y);
            obj.transformedyCoorNeg = obj.yCoorNeg * y;
        end
        
        function rotate(obj, angle)
            obj.rotate@Shapes(angle);
            delta = angle;
            delta = delta/ 180 * pi;
            whole_matrix = [cos(delta), sin(delta);
                            -sin(delta), cos(delta)];
            tempMatrix = [obj.xCoor;
                          obj.yCoorNeg];
            tempMatrix = whole_matrix * tempMatrix;
            obj.transformedyCoorNeg = tempMatrix(2,:);
        end
        
        function reflectOverX(obj)
            obj.reflectOverX@Shapes();
            obj.transformedyCoorNeg = -1 .* obj.yCoorNeg;
        end
        
        function reflectOverY(obj)
            obj.reflectOverY@Shapes();
            obj.transformedyCoorNeg = obj.yCoorNeg;
        end
    end
    
end


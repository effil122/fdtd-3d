classdef MATERIAL
    %MATERIAL このクラスの概要をここに記述
    properties
        velocity
        side_velocity
        density
    end

    methods
        function obj = MATERIAL(velocity, side_velocity, density)
            %MATERIAL このクラスのインスタンスを作成
            obj.velocity = velocity;
            obj.side_velocity = side_velocity;
            obj.density = density;
        end
        
        function zo = GetZo(obj)
            %METHOD1 % 音響インピーダンス
            zo = obj.density * obj.velocity;
        end
        
        function v = GetV(obj)
            %METHOD2 % ポアソン比
            vl = obj.velocity;
            vs = obj.side_velocity;
            v = 1/2 * (vl ^ 2 - 2 * vs ^ 2) / (vl ^ 2 - vs ^ 2);
        end
        
        function e = GetE(obj)
            %METHOD3 % ヤング率     
            vl = obj.velocity;
            vs = obj.side_velocity; 
            e = obj.GetG * (3 * vl ^ 2 - 4 * vs ^ 2) / (vl ^ 2 - vs ^ 2);
        end
        
        function g = GetG(obj)
            %METHOD4 % 剛性率           
            g = obj.density * obj.side_velocity ^ 2;
        end
       
        function obj = reset(obj)
            %METHOD5 % プロパティの初期化           
            obj.velocity = 0;
            obj.side_velocity = 0;
            obj.density = 0;
        end
    end
end

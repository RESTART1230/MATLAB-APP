classdef zj_1915000475_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure             matlab.ui.Figure
        MsubButton           matlab.ui.control.Button
        MplusButton          matlab.ui.control.Button
        MSButton             matlab.ui.control.Button
        MRButton             matlab.ui.control.Button
        MCButton             matlab.ui.control.Button
        EditField_2          matlab.ui.control.EditField
        Button_div           matlab.ui.control.Button
        Button_tuiwei        matlab.ui.control.Button
        Button_sqrt          matlab.ui.control.Button
        Button_sq            matlab.ui.control.Button
        Button_daoshu        matlab.ui.control.Button
        Button_multi         matlab.ui.control.Button
        CButton              matlab.ui.control.Button
        CEButton             matlab.ui.control.Button
        Button_cent          matlab.ui.control.Button
        Button_9             matlab.ui.control.Button
        Button_8             matlab.ui.control.Button
        Button_7             matlab.ui.control.Button
        Button_equal         matlab.ui.control.Button
        Button_add           matlab.ui.control.Button
        Button_sub           matlab.ui.control.Button
        EditField            matlab.ui.control.EditField
        Button_6             matlab.ui.control.Button
        Button_5             matlab.ui.control.Button
        Button_4             matlab.ui.control.Button
        Button_3             matlab.ui.control.Button
        Button_2             matlab.ui.control.Button
        Button_1             matlab.ui.control.Button
        Button_decimalpoint  matlab.ui.control.Button
        Button_0             matlab.ui.control.Button
        Button_minus         matlab.ui.control.Button
    end

    
    properties (Access = private)
        L       % 记忆寄存器
        M       % 结果寄存器
        N       % 输入寄存值
        Mbit    % M+、M-、MR标志位
        I       % 使用四则运算后，为消除之前存储的值
        J       % 加、减、乘、除标志位
        F       % 符号寄存器
        K       % 第一次使用等于号
        O       % 由于平方、开方、倒数、百分号在等于后使用，在app.editfield_2.value上有显示而造成的问题
        cent    % 百分号存储（等于之后连用）
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.Button_sq.Icon = '\Icons\平方.png';
            app.Button_sqrt.Icon = '\Icons\sqrt.png';
            app.Button_tuiwei.Icon = '\Icons\退位.png';
            app.EditField.Value = '0';
            app.M = '0';
            app.N = '0';
            app.L = '';
            app.F = '+';
            app.I = 0;
            app.J = 0;
            app.K = 0;
            app.O = 0;
            app.cent = '';
            app.Mbit = 0;
            app.MCButton.Enable = 'off';
            app.MRButton.Enable = "off";
        end

        % Button pushed function: Button_0
        function Button_0Pushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            
            end

            if app.J == 0
                if (contains(app.EditField_2.Value,'=')||app.Mbit == 1||app.O==1)
                    app.M = '';
                end
                app.M = strcat(app.M,'0');
                app.M = string(eval(app.M));
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end
            if app.J == 1
                if (app.I == 1 ||app.Mbit == 1)
                    app.N = '';
                end
                app.N = strcat(app.N,'0');
                app.N = string(eval(app.N));
                app.EditField.Value = app.N;
                app.I = 0;
            end
            app.Mbit = 0;

        end

        % Button pushed function: Button_1
        function Button_1Pushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            
            end
 
            if app.J == 0
                if (contains(app.EditField_2.Value,'=')||app.Mbit == 1||app.O==1)
                    app.M = '';
                end
                app.M = strcat(app.M,'1');
                app.M = string(eval(app.M));
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end
            if app.J == 1
                if (app.I == 1 ||app.Mbit == 1)
                    app.N = '';
                end
                app.N = strcat(app.N,'1');
                app.N = string(eval(app.N));
                app.EditField.Value = app.N;
                app.I = 0;
            end
            app.Mbit = 0;  

        end

        % Button pushed function: Button_2
        function Button_2Pushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            
            end

            if app.J == 0
                if (contains(app.EditField_2.Value,'=')||app.Mbit == 1||app.O==1)
                    app.M = '';
                end
                app.M = strcat(app.M,'2');
                app.M = string(eval(app.M));
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end
            if app.J == 1
                if (app.I == 1 ||app.Mbit == 1)
                    app.N = '';
                end
                app.N = strcat(app.N,'2');
                app.N = string(eval(app.N));
                app.EditField.Value = app.N;
                app.I = 0;
            end
            app.Mbit = 0; 
        end

        % Button pushed function: Button_3
        function Button_3Pushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            
            end

            if app.J == 0
                if (contains(app.EditField_2.Value,'=')||app.Mbit == 1||app.O==1)
                    app.M = '';
                end
                app.M = strcat(app.M,'3');
                app.M = string(eval(app.M));
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end
            if app.J == 1
                if (app.I == 1 ||app.Mbit == 1)
                    app.N = '';
                end
                app.N = strcat(app.N,'3');
                app.N = string(eval(app.N));
                app.EditField.Value = app.N;
                app.I = 0;
            end
            app.Mbit = 0; 
        end

        % Button pushed function: Button_4
        function Button_4Pushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            
            end

            if app.J == 0
                if (contains(app.EditField_2.Value,'=')||app.Mbit == 1||app.O==1)
                    app.M = '';
                end
                app.M = strcat(app.M,'4');
                app.M = string(eval(app.M));
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end
            if app.J == 1
                if (app.I == 1 ||app.Mbit == 1)
                    app.N = '';
                end
                app.N = strcat(app.N,'4');
                app.N = string(eval(app.N));
                app.EditField.Value = app.N;
                app.I = 0;
            end
            app.Mbit = 0; 
        end

        % Button pushed function: Button_5
        function Button_5Pushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            
            end

            if app.J == 0
                if (contains(app.EditField_2.Value,'=')||app.Mbit == 1||app.O==1)
                    app.M = '';
                end
                app.M = strcat(app.M,'5');
                app.M = string(eval(app.M));
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end
            if app.J == 1
                if (app.I == 1 ||app.Mbit == 1)
                    app.N = '';
                end
                app.N = strcat(app.N,'5');
                app.N = string(eval(app.N));
                app.EditField.Value = app.N;
                app.I = 0;
            end
            app.Mbit = 0; 
        end

        % Button pushed function: Button_6
        function Button_6Pushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            
            end

            if app.J == 0
                if (contains(app.EditField_2.Value,'=')||app.Mbit == 1||app.O==1)
                    app.M = '';
                end
                app.M = strcat(app.M,'6');
                app.M = string(eval(app.M));
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end
            if app.J == 1
                if (app.I == 1 ||app.Mbit == 1)
                    app.N = '';
                end
                app.N = strcat(app.N,'6');
                app.N = string(eval(app.N));
                app.EditField.Value = app.N;
                app.I = 0;
            end
            app.Mbit = 0; 
        end

        % Button pushed function: Button_7
        function Button_7Pushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            
            end

            if app.J == 0
                if (contains(app.EditField_2.Value,'=')||app.Mbit == 1||app.O==1)
                    app.M = '';
                end
                app.M = strcat(app.M,'7');
                app.M = string(eval(app.M));
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end
            if app.J == 1
                if (app.I == 1 ||app.Mbit == 1)
                    app.N = '';
                end
                app.N = strcat(app.N,'7');
                app.N = string(eval(app.N));
                app.EditField.Value = app.N;
                app.I = 0;
            end
            app.Mbit = 0; 
        end

        % Button pushed function: Button_8
        function Button_8Pushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            
            end

            if app.J == 0
                if (contains(app.EditField_2.Value,'=')||app.Mbit == 1||app.O==1)
                    app.M = '';
                end
                app.M = strcat(app.M,'8');
                app.M = string(eval(app.M));
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end
            if app.J == 1
                if (app.I == 1 ||app.Mbit == 1)
                    app.N = '';
                end
                app.N = strcat(app.N,'8');
                app.N = string(eval(app.N));
                app.EditField.Value = app.N;
                app.I = 0;
            end
            app.Mbit = 0; 
        end

        % Button pushed function: Button_9
        function Button_9Pushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            
            end

            if app.J == 0
                if (contains(app.EditField_2.Value,'=')||app.Mbit == 1||app.O==1)
                    app.M = '';
                end
                app.M = strcat(app.M,'9');
                app.M = string(eval(app.M));
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end
            if app.J == 1
                if (app.I == 1 ||app.Mbit == 1)
                    app.N = '';
                end
                app.N = strcat(app.N,'9');
                app.N = string(eval(app.N));
                app.EditField.Value = app.N;
                app.I = 0;
            end
            app.Mbit = 0; 
        end

        % Button pushed function: Button_decimalpoint
        function Button_decimalpointPushed(app, event)
            if app.J == 0
                if contains(app.EditField_2.Value,'=')
                    app.M = '0';
                end
                if ~contains(app.M,'.')
                    if (app.Mbit == 1||app.O ==1)
                        app.M = '0';
                    end
                    app.M = strcat(app.M,'.');
                    app.EditField_2.Value = '';
                    app.EditField.Value = app.M;
                end
            end
            if app.J == 1
                if ~contains(app.N,'.')
                    if app.Mbit == 1
                        app.M = '0';
                    end
                    app.N = strcat(app.N,'.');
                    app.EditField.Value = app.N;
                end
            end
            app.Mbit = 0;
        end

        % Button pushed function: Button_minus
        function Button_minusButtonPushed(app, event)
            if app.J == 0
                if contains(app.EditField_2.Value,'=')
                    app.M = strcat('gnegate(',app.M,')');
                    app.EditField_2.Value = app.M;
                    app.EditField.Value = string(eval(app.M));
                else
                    app.M = string(gnegate(eval(app.M)));
                    app.EditField.Value = app.M;
                end
                
            end
            if app.J == 1
                if app.I == 1
                    app.N = strcat('gnegate(',app.N,')');
                    app.EditField_2.Value = strcat(app.M,app.F,app.N);
                    app.EditField.Value = string(eval(app.N));
                else
                    app.N = string(eval(strcat('gnegate(',app.N,')')));
                    app.EditField.Value = app.N;
                end
            end
        end

        % Button pushed function: Button_sqrt
        function Button_sqrtPushed(app, event)
            if app.J == 0
                app.M = strcat('sqrt(',app.M,')');
                app.EditField_2.Value = app.M;
                app.EditField.Value = string(eval(app.M));
                app.O = 1;
            end
            if app.J == 1
                
                app.N = strcat('sqrt(',app.N,')');
                app.EditField_2.Value = strcat(app.M,app.F,app.N);
                app.EditField.Value = string(eval(app.N));
                
            end
        end

        % Button pushed function: Button_sq
        function Button_sqPushed(app, event)
            if app.J == 0
                app.M = strcat('(',app.M,')^2');
                app.EditField_2.Value = app.M;
                app.EditField.Value = string(eval(app.M));
                app.O = 1;
            end    
            
            if app.J == 1
                app.N = strcat('(',app.N,')^2');
                app.EditField_2.Value = strcat(app.M,app.F,app.N);
                app.EditField.Value = string(eval(app.N));
                              
            end

        end

        % Button pushed function: Button_daoshu
        function Button_daoshuPushed(app, event)
            if app.J == 0
                if app.M == '0'
                    app.EditField_2.Value = "1/(0)";
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                    app.MplusButton.Enable = "off";
                    app.MsubButton.Enable = "off";
                    app.MSButton.Enable = "off";
                    app.Button_cent.Enable = "off";
                    app.Button_daoshu.Enable = "off";
                    app.Button_sq.Enable = "off";
                    app.Button_sqrt.Enable = "off";
                    app.Button_div.Enable = "off";
                    app.Button_multi.Enable = "off";
                    app.Button_sub.Enable = "off";
                    app.Button_add.Enable = "off";
                    app.Button_minus.Enable = "off";
                    app.Button_decimalpoint.Enable = "off";
                    app.EditField.Value = '除数不能为零';
                                     
                else
                    app.M = strcat('1/(',app.M,')');
                    app.EditField_2.Value = app.M;
                    app.EditField.Value = string(eval(app.M));
                    app.O = 1;
                end
            end
            if app.J == 1
                if app.N == '0'
                    app.N = strcat('1/(',app.N,')');
                    app.EditField_2.Value = strcat(app.M,app.F,app.N);
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                    app.MplusButton.Enable = "off";
                    app.MsubButton.Enable = "off";
                    app.MSButton.Enable = "off";
                    app.Button_cent.Enable = "off";
                    app.Button_daoshu.Enable = "off";
                    app.Button_sq.Enable = "off";
                    app.Button_sqrt.Enable = "off";
                    app.Button_div.Enable = "off";
                    app.Button_multi.Enable = "off";
                    app.Button_sub.Enable = "off";
                    app.Button_add.Enable = "off";
                    app.Button_minus.Enable = "off";
                    app.Button_decimalpoint.Enable = "off";
                    app.EditField.Value = '除数不能为零';
                else
                    app.N = strcat('1/(',app.N,')');
                    app.EditField_2.Value = strcat(app.M,app.F,app.N);
                    app.EditField.Value = string(eval(app.N));
                end
            end
        end

        % Button pushed function: CButton
        function CButtonPushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.EditField.Value = '0';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            end
            app.EditField.Value = '0';
            app.EditField_2.Value = '';
            app.M = '0';
            app.N = '0';
            app.F = '+';
            app.O = 0;
            app.I = 0;
            app.J = 0;
            app.K = 0;
        end

        % Button pushed function: CEButton
        function CEButtonPushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.EditField.Value = '0';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            end

            if app.J == 0
                app.M = '0';
                app.EditField_2.Value = '';
                app.EditField.Value =app.M;
            end

            if app.J == 1
                app.N = '0';
                app.EditField_2.Value = strcat(app.M,app.F);
                app.EditField.Value =app.N;
            end
        end

        % Button pushed function: Button_cent
        function Button_centPushed(app, event)
            if app.J == 0
                B = strcat(app.M,'*',app.cent,'/100');
                app.M = string(eval(B)); 
                app.EditField_2.Value = app.M;
                app.EditField.Value = app.M;
                app.O = 1;

            end
            if app.J == 1

                B = strcat(app.M,'*',app.N,'/100');
                app.N = string(eval(B)); 
                app.EditField.Value = app.N;
                app.EditField_2.Value = strcat(app.M,app.F,app.N);
            end
        end

        % Button pushed function: Button_tuiwei
        function Button_tuiweiPushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.EditField.Value = '0';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            end
            if app.J == 0
                if contains(app.EditField_2.Value,'=')
                    app.EditField_2.Value = '';

                elseif (isempty(app.M)||app.O==1)
                
                else
                    A = app.EditField.Value;
                    A(end) = [];
                    if isempty(A)
                        app.M = '0';
                    else
                        app.M = A;
                    end
                        app.EditField.Value =app.M;
                end
            end

            if app.J == 1
                if isempty(app.N)
                
                else
                    A = app.EditField.Value;
                    A(end) = [];
                    if isempty(A)
                        app.N = '0';
                    else
                        app.N = A;
                    end
                        app.EditField.Value =app.N;
                end
            end
            
        end

        % Button pushed function: Button_div
        function Button_divPushed(app, event)
            if app.J == 1 && app.I == 1
            
            elseif contains(app.EditField_2.Value,'=')
                app.N = '';
            elseif (isempty(app.EditField_2.Value)||app.O ==1)
                app.O = 0;
            else 
                A = eval(strcat(app.M,app.F,app.N));
                app.M = string(A);
            end
            app.N = app.M;
            app.F = '/';
            app.EditField_2.Value = strcat(app.M,app.F);    
            app.EditField.Value = string(eval(app.M));
            app.I = 1;
            app.J = 1; 
        end

        % Button pushed function: Button_multi
        function Button_multiPushed(app, event)
            if app.J == 1&& app.I == 1

            elseif contains(app.EditField_2.Value,'=')
                app.N = '';
            elseif (isempty(app.EditField_2.Value)||app.O ==1)
                app.O = 0;
            else
                A = eval(strcat(app.M,app.F,app.N));
                app.M = string(A);
            end
            app.N = app.M;
            app.F = '*';
            app.EditField_2.Value = strcat(app.M,app.F);    
            app.EditField.Value = string(eval(app.M));
            app.I = 1;
            app.J = 1;
        end

        % Button pushed function: Button_sub
        function Button_subPushed(app, event)
            if app.J == 1&& app.I == 1
            
            elseif contains(app.EditField_2.Value,'=')
                app.N = '';
            elseif (isempty(app.EditField_2.Value)||app.O ==1)
                app.O = 0;
            else
                A = eval(strcat(app.M,app.F,app.N));
                app.M = string(A);
            end
            app.N = app.M;
            app.F = '-';
            app.EditField_2.Value = strcat(app.M,app.F);    
            app.EditField.Value = string(eval(app.M));
            app.I = 1;
            app.J = 1; 
        end

        % Button pushed function: Button_add
        function Button_addPushed(app, event)
            if app.J == 1 && app.I == 1
            
            elseif contains(app.EditField_2.Value,'=')
                app.N = '';
            elseif (isempty(app.EditField_2.Value)||app.O ==1)
                app.O = 0;
            else
                A = eval(strcat(app.M,app.F,app.N));
                app.M = string(A);
            end
            app.N = app.M;
            app.F = '+';
            app.EditField_2.Value = strcat(app.M,app.F);    
            app.EditField.Value = string(eval(app.M));
            
            app.I = 1;
            app.J = 1;   
        end

        % Button pushed function: Button_equal
        function Button_equalPushed(app, event)
            if (app.EditField.Value == "除数不能为零"||app.EditField.Value == "结果未定义")
                app.EditField_2.Value = '';
                app.EditField.Value = '0';
                app.Button_cent.Enable = "on";
                app.Button_daoshu.Enable = "on";
                app.Button_sq.Enable = "on";
                app.Button_sqrt.Enable = "on";
                app.Button_div.Enable = "on";
                app.Button_multi.Enable = "on";
                app.Button_sub.Enable = "on";
                app.Button_add.Enable = "on";
                app.Button_minus.Enable = "on";
                app.Button_decimalpoint.Enable = "on";
                app.MplusButton.Enable = "on";
                app.MsubButton.Enable = "on";
                app.MSButton.Enable = "on";
                if isempty(app.L)
                    app.MCButton.Enable = "off";
                    app.MRButton.Enable = "off";
                else
                    app.MCButton.Enable = "on";
                    app.MRButton.Enable = "on";
                end
            end
            if (app.K == 0&&app.J ==0)
                app.EditField_2.Value = strcat(app.M,'=');
                app.EditField.Value = string(eval(app.M));
                app.K = 0;
            elseif (app.N=='0'&&app.F=='/')
                app.EditField_2.Value = strcat(app.M,'/(',app.N,')');
                app.MCButton.Enable = "off";
                app.MRButton.Enable = "off";
                app.MplusButton.Enable = "off";
                app.MsubButton.Enable = "off";
                app.MSButton.Enable = "off";
                app.Button_cent.Enable = "off";
                app.Button_daoshu.Enable = "off";
                app.Button_sq.Enable = "off";
                app.Button_sqrt.Enable = "off";
                app.Button_div.Enable = "off";
                app.Button_multi.Enable = "off";
                app.Button_sub.Enable = "off";
                app.Button_add.Enable = "off";
                app.Button_minus.Enable = "off";
                app.Button_decimalpoint.Enable = "off";
                if app.M =='0'
                    app.EditField.Value = '结果未定义';
                else
                    app.EditField.Value = '除数不能为零';
                end
            else
                app.M = string(eval(app.M));
                app.EditField_2.Value = strcat(app.M,app.F,app.N,'=');
                app.M = string(eval(strcat(app.M,app.F,app.N)));
                app.N = string(eval(app.N));
                app.EditField.Value = app.M;
                app.cent = app.M;
                app.K = 1;
            end
            app.J = 0;
            
        end

        % Button pushed function: MCButton
        function MCButtonPushed(app, event)
            app.MCButton.Enable = "off";
            app.MRButton.Enable = "off";
            app.L = '';
            app.Mbit = 1;
        end

        % Button pushed function: MRButton
        function MRButtonPushed(app, event)
            if app.J == 0
                app.M = app.L;
                app.EditField_2.Value = '';
                app.EditField.Value = app.M;
            end

            if app.J == 1
                app.N = app.L;
                app.EditField.Value = app.N;
                
            end
            app.Mbit = 1;
        end

        % Button pushed function: MplusButton
        function MplusButtonPushed(app, event)
            app.MCButton.Enable = "on";
            app.MRButton.Enable = "on";
            if app.J == 0
                app.L = string(eval(strcat(app.L,'+',app.M)));
                app.EditField_2.Value = '';
            end
            if app.J == 1
                app.L = string(eval(strcat(app.L,'+',app.N)));
            end
            app.Mbit = 1;
        end

        % Button pushed function: MsubButton
        function MsubButtonPushed(app, event)
            app.MCButton.Enable = "on";
            app.MRButton.Enable = "on";
            if app.J == 0
                app.L = string(eval(strcat(app.L,'-',app.M)));
                app.EditField_2.Value = '';
            end
            if app.J == 1
                app.L = string(eval(strcat(app.L,'-',app.N)));
            end
            app.Mbit = 1;
        end

        % Button pushed function: MSButton
        function MSButtonPushed(app, event)
            app.MCButton.Enable = "on";
            app.MRButton.Enable = "on";
            if app.J == 0
                app.L = app.M;
                app.EditField_2.Value = '';
            end

            if app.J == 1
                app.L = app.N;
                
            end
            app.Mbit = 1;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 336 527];
            app.UIFigure.Name = 'MATLAB App';

            % Create Button_minus
            app.Button_minus = uibutton(app.UIFigure, 'push');
            app.Button_minus.ButtonPushedFcn = createCallbackFcn(app, @Button_minusButtonPushed, true);
            app.Button_minus.FontName = 'Noto Sans CJK SC';
            app.Button_minus.FontSize = 18;
            app.Button_minus.Position = [48 40 43 41];
            app.Button_minus.Text = '±';

            % Create Button_0
            app.Button_0 = uibutton(app.UIFigure, 'push');
            app.Button_0.ButtonPushedFcn = createCallbackFcn(app, @Button_0Pushed, true);
            app.Button_0.FontName = 'Noto Sans CJK SC';
            app.Button_0.FontSize = 18;
            app.Button_0.Position = [115 40 43 41];
            app.Button_0.Text = '0';

            % Create Button_decimalpoint
            app.Button_decimalpoint = uibutton(app.UIFigure, 'push');
            app.Button_decimalpoint.ButtonPushedFcn = createCallbackFcn(app, @Button_decimalpointPushed, true);
            app.Button_decimalpoint.FontName = 'Noto Sans CJK SC';
            app.Button_decimalpoint.FontSize = 18;
            app.Button_decimalpoint.Position = [182 40 43 41];
            app.Button_decimalpoint.Text = '.';

            % Create Button_1
            app.Button_1 = uibutton(app.UIFigure, 'push');
            app.Button_1.ButtonPushedFcn = createCallbackFcn(app, @Button_1Pushed, true);
            app.Button_1.FontName = 'Noto Sans CJK SC';
            app.Button_1.FontSize = 18;
            app.Button_1.Position = [48 91 43 41];
            app.Button_1.Text = '1';

            % Create Button_2
            app.Button_2 = uibutton(app.UIFigure, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button_2.FontName = 'Noto Sans CJK SC';
            app.Button_2.FontSize = 18;
            app.Button_2.Position = [115 91 43 41];
            app.Button_2.Text = '2';

            % Create Button_3
            app.Button_3 = uibutton(app.UIFigure, 'push');
            app.Button_3.ButtonPushedFcn = createCallbackFcn(app, @Button_3Pushed, true);
            app.Button_3.FontName = 'Noto Sans CJK SC';
            app.Button_3.FontSize = 18;
            app.Button_3.Position = [182 91 43 41];
            app.Button_3.Text = '3';

            % Create Button_4
            app.Button_4 = uibutton(app.UIFigure, 'push');
            app.Button_4.ButtonPushedFcn = createCallbackFcn(app, @Button_4Pushed, true);
            app.Button_4.FontName = 'Noto Sans CJK SC';
            app.Button_4.FontSize = 18;
            app.Button_4.Position = [48 142 43 41];
            app.Button_4.Text = '4';

            % Create Button_5
            app.Button_5 = uibutton(app.UIFigure, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @Button_5Pushed, true);
            app.Button_5.FontName = 'Noto Sans CJK SC';
            app.Button_5.FontSize = 18;
            app.Button_5.Position = [115 142 43 41];
            app.Button_5.Text = '5';

            % Create Button_6
            app.Button_6 = uibutton(app.UIFigure, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_6.FontName = 'Noto Sans CJK SC';
            app.Button_6.FontSize = 18;
            app.Button_6.Position = [182 142 43 41];
            app.Button_6.Text = '6';

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'text');
            app.EditField.HorizontalAlignment = 'right';
            app.EditField.FontName = 'Noto Sans SC';
            app.EditField.FontSize = 20;
            app.EditField.Position = [48 420 243 34];

            % Create Button_sub
            app.Button_sub = uibutton(app.UIFigure, 'push');
            app.Button_sub.ButtonPushedFcn = createCallbackFcn(app, @Button_subPushed, true);
            app.Button_sub.FontName = 'Noto Sans CJK SC';
            app.Button_sub.FontSize = 18;
            app.Button_sub.Position = [248 142 43 41];
            app.Button_sub.Text = '-';

            % Create Button_add
            app.Button_add = uibutton(app.UIFigure, 'push');
            app.Button_add.ButtonPushedFcn = createCallbackFcn(app, @Button_addPushed, true);
            app.Button_add.FontName = 'Noto Sans CJK SC';
            app.Button_add.FontSize = 18;
            app.Button_add.Position = [248 91 43 41];
            app.Button_add.Text = '+';

            % Create Button_equal
            app.Button_equal = uibutton(app.UIFigure, 'push');
            app.Button_equal.ButtonPushedFcn = createCallbackFcn(app, @Button_equalPushed, true);
            app.Button_equal.FontName = 'Noto Sans CJK SC';
            app.Button_equal.FontSize = 18;
            app.Button_equal.Position = [248 40 43 41];
            app.Button_equal.Text = '=';

            % Create Button_7
            app.Button_7 = uibutton(app.UIFigure, 'push');
            app.Button_7.ButtonPushedFcn = createCallbackFcn(app, @Button_7Pushed, true);
            app.Button_7.FontName = 'Noto Sans CJK SC';
            app.Button_7.FontSize = 18;
            app.Button_7.Position = [48 194 43 41];
            app.Button_7.Text = '7';

            % Create Button_8
            app.Button_8 = uibutton(app.UIFigure, 'push');
            app.Button_8.ButtonPushedFcn = createCallbackFcn(app, @Button_8Pushed, true);
            app.Button_8.FontName = 'Noto Sans CJK SC';
            app.Button_8.FontSize = 18;
            app.Button_8.Position = [115 194 43 41];
            app.Button_8.Text = '8';

            % Create Button_9
            app.Button_9 = uibutton(app.UIFigure, 'push');
            app.Button_9.ButtonPushedFcn = createCallbackFcn(app, @Button_9Pushed, true);
            app.Button_9.FontName = 'Noto Sans CJK SC';
            app.Button_9.FontSize = 18;
            app.Button_9.Position = [182 194 43 41];
            app.Button_9.Text = '9';

            % Create Button_cent
            app.Button_cent = uibutton(app.UIFigure, 'push');
            app.Button_cent.ButtonPushedFcn = createCallbackFcn(app, @Button_centPushed, true);
            app.Button_cent.FontName = 'Noto Sans CJK SC';
            app.Button_cent.FontSize = 18;
            app.Button_cent.Position = [48 298 43 41];
            app.Button_cent.Text = '%';

            % Create CEButton
            app.CEButton = uibutton(app.UIFigure, 'push');
            app.CEButton.ButtonPushedFcn = createCallbackFcn(app, @CEButtonPushed, true);
            app.CEButton.FontName = 'Noto Sans CJK SC';
            app.CEButton.FontSize = 18;
            app.CEButton.Position = [115 298 43 41];
            app.CEButton.Text = 'CE';

            % Create CButton
            app.CButton = uibutton(app.UIFigure, 'push');
            app.CButton.ButtonPushedFcn = createCallbackFcn(app, @CButtonPushed, true);
            app.CButton.FontName = 'Noto Sans CJK SC';
            app.CButton.FontSize = 18;
            app.CButton.Position = [182 298 43 41];
            app.CButton.Text = 'C';

            % Create Button_multi
            app.Button_multi = uibutton(app.UIFigure, 'push');
            app.Button_multi.ButtonPushedFcn = createCallbackFcn(app, @Button_multiPushed, true);
            app.Button_multi.FontName = 'Noto Sans CJK SC';
            app.Button_multi.FontSize = 18;
            app.Button_multi.Position = [248 194 43 41];
            app.Button_multi.Text = '×';

            % Create Button_daoshu
            app.Button_daoshu = uibutton(app.UIFigure, 'push');
            app.Button_daoshu.ButtonPushedFcn = createCallbackFcn(app, @Button_daoshuPushed, true);
            app.Button_daoshu.FontName = 'Noto Sans CJK SC';
            app.Button_daoshu.FontSize = 18;
            app.Button_daoshu.Position = [48 246 43 41];
            app.Button_daoshu.Text = '1/x';

            % Create Button_sq
            app.Button_sq = uibutton(app.UIFigure, 'push');
            app.Button_sq.ButtonPushedFcn = createCallbackFcn(app, @Button_sqPushed, true);
            app.Button_sq.IconAlignment = 'center';
            app.Button_sq.FontName = 'Noto Sans CJK SC';
            app.Button_sq.FontSize = 18;
            app.Button_sq.Position = [115 246 43 41];
            app.Button_sq.Text = '';

            % Create Button_sqrt
            app.Button_sqrt = uibutton(app.UIFigure, 'push');
            app.Button_sqrt.ButtonPushedFcn = createCallbackFcn(app, @Button_sqrtPushed, true);
            app.Button_sqrt.FontName = 'Noto Sans CJK SC';
            app.Button_sqrt.FontSize = 18;
            app.Button_sqrt.Position = [182 246 43 41];
            app.Button_sqrt.Text = '';

            % Create Button_tuiwei
            app.Button_tuiwei = uibutton(app.UIFigure, 'push');
            app.Button_tuiwei.ButtonPushedFcn = createCallbackFcn(app, @Button_tuiweiPushed, true);
            app.Button_tuiwei.FontName = 'Noto Sans CJK SC';
            app.Button_tuiwei.FontSize = 18;
            app.Button_tuiwei.Position = [248 298 43 41];
            app.Button_tuiwei.Text = '';

            % Create Button_div
            app.Button_div = uibutton(app.UIFigure, 'push');
            app.Button_div.ButtonPushedFcn = createCallbackFcn(app, @Button_divPushed, true);
            app.Button_div.FontName = 'Noto Sans CJK SC';
            app.Button_div.FontSize = 18;
            app.Button_div.Position = [248 246 43 41];
            app.Button_div.Text = '÷';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.UIFigure, 'text');
            app.EditField_2.Editable = 'off';
            app.EditField_2.HorizontalAlignment = 'right';
            app.EditField_2.FontName = 'Noto Sans SC';
            app.EditField_2.FontSize = 20;
            app.EditField_2.Position = [48 454 243 34];

            % Create MCButton
            app.MCButton = uibutton(app.UIFigure, 'push');
            app.MCButton.ButtonPushedFcn = createCallbackFcn(app, @MCButtonPushed, true);
            app.MCButton.FontName = 'Noto Sans CJK SC';
            app.MCButton.FontSize = 14;
            app.MCButton.Position = [48 353 29 29];
            app.MCButton.Text = 'MC';

            % Create MRButton
            app.MRButton = uibutton(app.UIFigure, 'push');
            app.MRButton.ButtonPushedFcn = createCallbackFcn(app, @MRButtonPushed, true);
            app.MRButton.FontName = 'Noto Sans CJK SC';
            app.MRButton.FontSize = 14;
            app.MRButton.Position = [102 353 29 29];
            app.MRButton.Text = 'MR';

            % Create MSButton
            app.MSButton = uibutton(app.UIFigure, 'push');
            app.MSButton.ButtonPushedFcn = createCallbackFcn(app, @MSButtonPushed, true);
            app.MSButton.FontName = 'Noto Sans CJK SC';
            app.MSButton.FontSize = 14;
            app.MSButton.Position = [262 353 29 29];
            app.MSButton.Text = 'MS';

            % Create MplusButton
            app.MplusButton = uibutton(app.UIFigure, 'push');
            app.MplusButton.ButtonPushedFcn = createCallbackFcn(app, @MplusButtonPushed, true);
            app.MplusButton.FontName = 'Noto Sans CJK SC';
            app.MplusButton.FontSize = 14;
            app.MplusButton.Position = [156 353 29 29];
            app.MplusButton.Text = 'M+';

            % Create MsubButton
            app.MsubButton = uibutton(app.UIFigure, 'push');
            app.MsubButton.ButtonPushedFcn = createCallbackFcn(app, @MsubButtonPushed, true);
            app.MsubButton.FontName = 'Noto Sans CJK SC';
            app.MsubButton.FontSize = 14;
            app.MsubButton.Position = [209 353 29 29];
            app.MsubButton.Text = 'M-';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = zj_1915000475_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end

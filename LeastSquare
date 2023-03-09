classdef LeastSquare_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure   matlab.ui.Figure
        Button_7   matlab.ui.control.Button
        EditField  matlab.ui.control.NumericEditField
        Button_6   matlab.ui.control.Button
        Button_2   matlab.ui.control.Button
        Button     matlab.ui.control.Button
        Button_5   matlab.ui.control.Button
        UITable    matlab.ui.control.Table
        UIAxes     matlab.ui.control.UIAxes
    end

    
    properties (Access = public)
        filename            % 导入文件名称
        mline                 % 线性标志位            
        mexp                 % 指数标志位
        N                       % 多项式拟合阶数
        col                 % 多项式标志位
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            app.mline=0;
            app.mexp=0;
            app.N=2;
            app.col=0;
                
        end

        % Button pushed function: Button_5
        function Button_5Pushed(app, event)

            app.UITable.Data=[];
            cla(app.UIAxes,"reset");                     %清除原来生成的拟合曲线和导入的数据
            [app.filename, pathname] = ...                        % app.filename 接受文件名； pathname接受路径名称
            uigetfile({'*.xlsx';'*.xls';'*.txt';'*.*'},'File Selector');     % 规定可选的文件类型
            pathname = string(pathname);
            app.filename = string(app.filename);               
            if isequal(app.filename,'0')||isequal(pathname,'0')   %判断路径是否为空
                return;
            else
                t = readtable(app.filename);
                vars = {'X','Y'};                     
                t = t(:,vars);                   % 数据对应var
                app.UITable.Data = t;   % 读取表格数据
                
                x1=app.UITable.Data.X;
                y1=app.UITable.Data.Y;
                plot(app.UIAxes,x1,y1,'b.');
                legend(app.UIAxes,'原始数据');
                hold(app.UIAxes,"on");
            end

        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
            if app.mline == 1   %防止重复使用造成标签过多
                return;
            else
                x1=app.UITable.Data.X;
                y1=app.UITable.Data.Y;
                [row, ~]=size(app.UITable.Data);
                sumx=sum(x1);
                sumx2=sum(x1.^2);
                sumyx=sum(x1.*y1);
                sumy=sum(y1);
                M=[row sumx;sumx sumx2 ];
                b=[sumy;sumyx];
                a=M\b;
                a0=a(1,:);
                a1=a(2,:);               %最小二乘法                
                x1=x1(1,:):0.1:x1(row,:);
                y2=a0+(a1)*(x1);
                m=string(a0);
                    if a1>=0
                        n=strcat('+',string(a1));
                    else
                        n=string(a1);
                    end                                         %转string
                plot(app.UIAxes,x1,y2,'r',DisplayName='y='+m+n+'x');
                app.mline=1;
                hold(app.UIAxes,"on");
            end

        end

        % Button pushed function: Button_2
        function Button_2Pushed(app, event)
            
            if app.mexp == 1
                return;
            else
                x1=app.UITable.Data.X;
                y1=app.UITable.Data.Y;
                [row, ~]=size(app.UITable.Data);
                sumx=sum(x1);
                sumx2=sum(x1.^2);
                sumyx=sum(x1.*log(y1));
                sumy=sum(log(y1));
                M=[row sumx;sumx sumx2 ];
                b=[sumy;sumyx];
                a=M\b;
                a0=a(1,:);
                a1=a(2,:);
                m=string(exp(a0));
                n=string(a1);          
                x1=x1(1,:):0.1:x1(row,:);
                y2=exp(a0+a1*x1);
                plot(app.UIAxes,x1,y2,'c-',DisplayName='y='+m+'e^{'+n+'x}'); %latex表示
                hold(app.UIAxes,"on");
                app.mexp=1;
            end

        end

        % Value changed function: EditField
        function EditFieldValueChanged(app, event)
            %读取多项式拟合阶数
            value = app.EditField.Value;
            app.N=value;                      
           
        end

        % Button pushed function: Button_6
        function Button_6Pushed(app, event)
            
            if app.col==app.N+1  %防止同阶次重复生成曲线和标签
                return;
            else
                x1=app.UITable.Data.X;
                y1=app.UITable.Data.Y;
                [row, ~]=size(app.UITable.Data);
                p=polyfit(x1,y1,app.N);
                n=app.N;
                [~,app.col]=size(p);
                x1=x1(1,:):0.1:x1(row,:);
                y2= polyval(p,x1);
                b='';
                for i=1:app.col          %小循环写出表达式
                    if p(:,i)>=0
                        ji=strcat('+',string(p(:,i)));
                    else
                        ji=string(p(:,i));
                    end
                    a=ji+'x^{'+string(n)+'}';   %latex表示
                    b=strcat(b,a);
                    n=n-1;
                end

                plot(app.UIAxes,x1,y2,'-',DisplayName=b); 
                hold(app.UIAxes,"on");
            end

        end

        % Button pushed function: Button_7
        function Button_7Pushed(app, event)
            %清除键    
            app.mexp=0;
            app.mline=0;
            app.col=0;
            cla(app.UIAxes,"reset");
            x1=app.UITable.Data.X;
            y1=app.UITable.Data.Y;
            plot(app.UIAxes,x1,y1,'b.');
            legend(app.UIAxes,'原始数据');
            hold(app.UIAxes,"on");                

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1107 591];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [276 61 632 474];

            % Create UITable
            app.UITable = uitable(app.UIFigure);
            app.UITable.ColumnName = {'X'; 'Y'};
            app.UITable.RowName = {};
            app.UITable.Position = [31 38 201 497];

            % Create Button_5
            app.Button_5 = uibutton(app.UIFigure, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @Button_5Pushed, true);
            app.Button_5.FontSize = 18;
            app.Button_5.Position = [953 446 100 49];
            app.Button_5.Text = '导入数据';

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.FontSize = 18;
            app.Button.Position = [952 376 101 49];
            app.Button.Text = '线性拟合';

            % Create Button_2
            app.Button_2 = uibutton(app.UIFigure, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button_2.FontSize = 18;
            app.Button_2.Position = [953 303 100 49];
            app.Button_2.Text = '指数拟合';

            % Create Button_6
            app.Button_6 = uibutton(app.UIFigure, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_6.FontSize = 18;
            app.Button_6.Position = [953 224 100 49];
            app.Button_6.Text = '多项式拟合';

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'numeric');
            app.EditField.Limits = [2 Inf];
            app.EditField.ValueChangedFcn = createCallbackFcn(app, @EditFieldValueChanged, true);
            app.EditField.HorizontalAlignment = 'center';
            app.EditField.FontSize = 24;
            app.EditField.Position = [953 176 100 49];
            app.EditField.Value = 2;

            % Create Button_7
            app.Button_7 = uibutton(app.UIFigure, 'push');
            app.Button_7.ButtonPushedFcn = createCallbackFcn(app, @Button_7Pushed, true);
            app.Button_7.FontSize = 18;
            app.Button_7.Position = [954 101 100 49];
            app.Button_7.Text = '清除';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = LeastSquare_exported

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

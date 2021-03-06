function varargout = test1(varargin)
% TEST1 MATLAB code for test1.fig
%      TEST1, by itself, creates a new TEST1 or raises the existing
%      singleton*.
%
%      H = TEST1 returns the handle to a new TEST1 or the handle to
%      the existing singleton*.
%
%      TEST1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST1.M with the given input arguments.
%
%      TEST1('Property','Value',...) creates a new TEST1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test1

% Last Modified by GUIDE v2.5 24-Oct-2015 22:08:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test1_OpeningFcn, ...
                   'gui_OutputFcn',  @test1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before test1 is made visible.
function test1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test1 (see VARARGIN)

% Choose default command line output for test1
handles.output = hObject;
handles.noOfObjects = 0;
handles.Objects = Shapes.empty;
handles.inputFileNames = [];
handles.currentFigure = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Draw X and Y axis%
drawAxis();



% --- Outputs from this function are returned to the command line.
function varargout = test1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pointPushButton.
function pointPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to pointPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'X-coordinate','Y-coordinate'};
dlg_title = 'Create a Point';
num_lines =  [1 40;1 40];
defaultans = {'',''};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if ~isempty(answer)
    tempPoint = Point;
    tempPoint.xCoor = str2double(answer(1));
    tempPoint.yCoor = str2double(answer(2));
    handles.noOfObjects = handles.noOfObjects + 1;
    handles.Objects(handles.noOfObjects) = tempPoint;
    handles.currentFigure = handles.noOfObjects;
    updateGraph(hObject, handles);
    guidata(hObject, handles);
end


% --- Executes on button press in lineSegmentPushButton.
function lineSegmentPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to lineSegmentPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'X-coordinate (Point 1)','Y-coordinate (Point 1)','X-coordinate (Point 2)','Y-coordinate (Point 2)'};
dlg_title = 'Create a Line Segment';
num_lines =  [1 50;1 50; 1 50; 1 50];
defaultans = {'','','',''};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if ~isempty(answer)
    x = str2double([answer(1),answer(3)]);
    y = str2double([answer(2),answer(4)]);
    tempLineSegment = LineSegment;
    tempLineSegment.xCoor = x;
    tempLineSegment.yCoor = y;
    handles.noOfObjects = handles.noOfObjects + 1;
    handles.Objects(handles.noOfObjects) = tempLineSegment;
    handles.currentFigure = handles.noOfObjects;
    updateGraph(hObject, handles);
    guidata(hObject, handles);
end

% --- Executes on button press in parabolaPushButton.
function parabolaPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to parabolaPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Vertex X-coordinate','Vertex Y-coordinate','Distance between Vertex and Focus (p)'};
dlg_title = 'Create a Parabola';
num_lines =  [1 45;1 45; 1 45];
defaultans = {'','',''};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if ~isempty(answer)
    h = str2double(answer(1));
    
    k = str2double(answer(2));
    
    p = str2double(answer(3))

    % Construct a questdlg with three options
    choice = questdlg('What is the orientation', ...
        'Orientation', ...
        'Vertical','Horizontal','Cancel');
    
    % Handle response
    switch choice
        case 'Vertical'
            x = -100:1:100;
            y = (x - h).^2 /(4 * p) + k;          
               
        case 'Horizontal'
            y = -100:1:100;
            x = (y - k).^2 /(4 * p) + h;
        case 'Cancel'
    end
    
    if ~isempty(x)
        tempParabola = Parabola;
        tempParabola.xCoor = x;
        tempParabola.yCoor = y;
        handles.noOfObjects = handles.noOfObjects + 1;
        handles.Objects(handles.noOfObjects) = tempParabola;
        handles.currentFigure = handles.noOfObjects;
        updateGraph(hObject, handles);
        guidata(hObject,handles);
    end
end


% --- Executes on button press in hyperbolaPushButton.
function hyperbolaPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to hyperbolaPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Center X-coordinate','Center Y-coordinate','Horizontal Distance (2a)','Vertical Distance (2b)'};
dlg_title = 'Create a Hyperbola';
num_lines =  [1 40;1 40; 1 40; 1 40];
defaultans = {'','','',''};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

if (~isempty(answer))
    % center is given by (h,k)
    % center x
    h = str2double(answer(1));
    % center Y
    k = str2double(answer(2));
    % horizontal distance
    a = str2double(answer(3))/2;
    % vertical distance
    b = str2double(answer(4))/2;

    % Construct a questdlg with three options
    choice = questdlg('What is the orientation', ...
        'Orientation', ...
        'Vertical','Horizontal','Cancel');
    % Handle response
    switch choice
        % copy paste from net do not question pls
        case 'Vertical'
            t = linspace(-2*pi,2*pi, 200);
            x1 = h + b*sinh(t);
            y1 = k + a*cosh(t);
            plot(x1,y1);
            x2 = x1;
            y2 = k - a*cosh(t);
            plot(x2,y2);

        case 'Horizontal'
            t = linspace(-2*pi,2*pi, 200);
            x1 = h + a*cosh(t);
            y1 = k + b*sinh(t);
            plot(x1,y1);
            x2 = h - a*cosh(t);
            y2 = y1;
            plot(x2,y2);
           
        case 'Cancel'
    end
    
    if ~isempty(choice)
        tempHyperbola = Hyperbola;
        tempHyperbola.xCoor = x1;
        tempHyperbola.yCoor = y1;
        tempHyperbola.xCoor2 = x2;
        tempHyperbola.yCoor2 = y2;
        handles.noOfObjects = handles.noOfObjects + 1;
        handles.Objects(handles.noOfObjects) = tempHyperbola;
        handles.currentFigure = handles.noOfObjects;
        updateGraph(hObject, handles);
        guidata(hObject, handles);
    end
end


% --- Executes on button press in polygonPushButton.
function polygonPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to polygonPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Input number of vertices minimum is 3'};
dlg_title = 'Create a Polygon';
num_lines =  [1 40];
defaultans = {'3'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if ~isempty(answer)
    x = zeros(1, str2double(answer) + 1);
    y = zeros(1, str2double(answer) + 1);

    for a = 1:str2double(answer) 
        prompt = {'X-coordinate','Y-coordinate'};
        dlg_title = 'Create a Polygon';
        num_lines =  [1 40;1 40];
        defaultans = {'',''};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        x(a) = str2double(answer(1));
        y(a) = str2double(answer(2));
    end

    x(size(x)) = x(1);
    y(size(y)) = y(1);
    tempPolygon = Polygon;
    tempPolygon.xCoor = x;
    tempPolygon.yCoor = y;
    handles.noOfObjects = handles.noOfObjects + 1;
    handles.Objects(handles.noOfObjects) = tempPolygon;
    handles.currentFigure = handles.noOfObjects;
    updateGraph(hObject, handles);
    guidata(hObject,handles);
end

% --- Executes on button press in ellipsePushButton.
function ellipsePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to ellipsePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Center X-coordinate','Center Y-coordinate','Horizontal Distance (2a)','Vertical Distance (2b)'};
dlg_title = 'Create an Ellipse';
num_lines =  [1 40;1 40; 1 40; 1 40];
defaultans = {'','','',''};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

if ~isempty(answer)
    % center is given by (h,k)
    % center x
    h = str2double(answer(1));
    % center Y
    k = str2double(answer(2));
    % horizontal distance
    a = str2double(answer(3))/2;
    % vertical distance
    b = str2double(answer(4))/2;

    %copy paste from net do not question pls
    t=-pi:0.01:pi;
    x=h+a*cos(t);
    y=k+b*sin(t);

    tempEllipse = Ellipse;
    tempEllipse.xCoor = x;
    tempEllipse.yCoor = y;
    handles.noOfObjects = handles.noOfObjects + 1;
    handles.Objects(handles.noOfObjects) = tempEllipse;
    handles.currentFigure = handles.noOfObjects;
    updateGraph(hObject, handles);
    guidata(hObject, handles);
end


% --- Executes on button press in vectorPushButton.
function vectorPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to vectorPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'X-coordinate','Y-coordinate'};
dlg_title = 'Create a Vector';
num_lines =  [1 40;1 40];
defaultans = {'',''};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if ~isempty(answer)
    x = [0,str2double(answer(1))];
    y = [0,str2double(answer(2))];
    tempVector = Vector;
    tempVector.xCoor = x;
    tempVector.yCoor = y;
    handles.noOfObjects = handles.noOfObjects + 1;
    handles.Objects(handles.noOfObjects) = tempVector;
    handles.currentFigure = handles.noOfObjects;
    updateGraph(hObject, handles);
    guidata(hObject,handles);
end


% --- Executes on selection change in operationsComboBox.
function operationsComboBox_Callback(hObject, eventdata, handles)
% hObject    handle to operationsComboBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns operationsComboBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from operationsComboBox


% --- Executes during object creation, after setting all properties.
function operationsComboBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to operationsComboBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in figuresListBox.
function figuresListBox_Callback(hObject, eventdata, handles)
% hObject    handle to figuresListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns figuresListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from figuresListBox
handles.currentFigure = get(handles.figuresListBox,'value');
updateGraph(hObject, handles);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function figuresListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figuresListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in deletePushButton.
function deletePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to deletePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

index = get(handles.figuresListBox,'value'); 

% to delete from Objects list
if handles.noOfObjects > 0
    handles.Objects(index) = [];
    handles.noOfObjects = handles.noOfObjects - 1;
end

Value=index-1;
handles.currentFigure = handles.currentFigure - 1;
if Value<1
    Value=1;
    handles.currentFigure = 1;
end

updateGraph(hObject, handles);

set(handles.figuresListBox,'Value',Value);
guidata(hObject,handles);


% --- Executes on button press in transformPushButton.
function transformPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to transformPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

names = get(handles.figuresListBox, 'String');
switch get(handles.operationsComboBox, 'Value')
    case 1
        prompt = {'Translate X:', 'Translate Y:'};
        dlg_title = ['Translate ' names{get(handles.figuresListBox, 'Value')}];
        num_lines =  [1 50;1 50];
        defaultans = {'0','0'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        handles.Objects(get(handles.figuresListBox,'value')).translate(str2double(answer(1)), str2double(answer(2)));
        updateGraph(hObject, handles);
    case 2
        prompt = {'Shearing Angle: Clockwise'};
        dlg_title = ['Shear ' names{get(handles.figuresListBox, 'Value')}];
        num_lines =  [1 50];
        defaultans = {'0'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        handles.Objects(get(handles.figuresListBox,'value')).shear(str2double(answer(1)));
        updateGraph(hObject,handles);
    case 3
        prompt = {'Scale X: ', 'Scale Y: '};
        dlg_title = ['Scale ' names{get(handles.figuresListBox, 'Value')}];
        num_lines =  [1 50; 1 50];
        defaultans = {'1','1'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        handles.Objects(get(handles.figuresListBox,'value')).scale(str2double(answer(1)), str2double(answer(2)));
        updateGraph(hObject, handles);
    case 4
        prompt = {'Angle: '};
        dlg_title = ['Rotate ' names{get(handles.figuresListBox, 'Value')}];
        num_lines =  [1 50];
        defaultans = {'1'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        handles.Objects(get(handles.figuresListBox,'value')).rotate(str2double(answer(1)));
        updateGraph(hObject, handles)
    case 5
        answer = questdlg('Over which axis should the object be reflected?', ...
        ['Reflect ' names{get(handles.figuresListBox, 'Value')}], ...
        'X-Axis','Y-Axis','Cancel', 'X-Axis');
        switch answer
            case 'X-Axis'
                handles.Objects(get(handles.figuresListBox,'value')).reflectOverX();
                updateGraph(hObject, handles);

            case 'Y-Axis'
                handles.Objects(get(handles.figuresListBox,'value')).reflectOverY();
                updateGraph(hObject, handles);

            case 'Cancel'
        end
end
guidata(hObject,handles);

function drawAxis()
a = [0, 0];
y = [100, 0];
plot(a ,y ,'k');
hold on;
plot(a, -1 * y, 'k');
a = [100, 0];
y = [0,0];
plot(a, y,'k');
plot(-1*a,y,'k');
axis([-100, 100, -100, 100]);

function updateGraph(hObject, handles)
% reset graph
cla
drawAxis();
handles.inputFileNames = [];
for i = 1:numel(handles.Objects)
    
    if i == handles.currentFigure
        normal = 'r';
        prev = 'm';
    else
        normal = 'b';
        prev = 'c';
    end
    
    % redraw plots on graph
    if isa(handles.Objects(i), 'Point')
        plot(handles.Objects(i).xCoor, handles.Objects(i).yCoor, [normal '*']);
    else
        plot(handles.Objects(i).xCoor, handles.Objects(i).yCoor, normal);
    end
    if isa(handles.Objects(i), 'Hyperbola')
        plot(handles.Objects(i).xCoor2, handles.Objects(i).yCoor2, normal);
    end
    
    % redraw transformed
    if ~isempty(handles.Objects(i).prevXCoor)
        if isa(handles.Objects(i), 'Point')
            plot(handles.Objects(i).prevXCoor, handles.Objects(i).prevYCoor, [prev '*']);
        else
            plot(handles.Objects(i).prevXCoor, handles.Objects(i).prevYCoor, prev);
        end
        if isa(handles.Objects(i), 'Hyperbola')
            plot(handles.Objects(i).prevXCoor2, handles.Objects(i).prevYCoor2, prev);
        end
    end
    
    % readd to listbox
    handles.inputFileNames = [handles.inputFileNames; class(handles.Objects(i)), blanks(12 - length(class(handles.Objects(i))))];
end
set(handles.figuresListBox, 'string', {handles.inputFileNames}, 'Value', handles.currentFigure);
index = get(handles.figuresListBox,'value');
newData = get(handles.resultsTable, 'Data');
if handles.noOfObjects > 0
    if isa(handles.Objects(index), 'Hyperbola')
        if isempty(handles.Objects(index).prevXCoor)
            newData = [
                {'X Coordinates  '}, num2cell(handles.Objects(index).xCoor);
                {'Y Coordinates  '}, num2cell(handles.Objects(index).yCoor);
                {'X Coordinates 2'}, num2cell(handles.Objects(index).xCoor2);
                {'Y Coordinates 2'}, num2cell(handles.Objects(index).yCoor2)];
        else
            newData = [
                {'X Coordinates         '}, num2cell(handles.Objects(index).xCoor);
                {'Y Coordinates         '}, num2cell(handles.Objects(index).yCoor);
                {'Previous X Coords  '}, num2cell(handles.Objects(index).prevXCoor);
                {'Previous Y Coords  '}, num2cell(handles.Objects(index).prevYCoor);
                {'X Coordinates 2       '}, num2cell(handles.Objects(index).xCoor2);
                {'Y Coordinates 2       '}, num2cell(handles.Objects(index).yCoor2);
                {'Previous X Coords 2'}, num2cell(handles.Objects(index).prevXCoor2);
                {'Previous Y Coords 2'}, num2cell(handles.Objects(index).prevYCoor2)];
        end
    else
        if isempty(handles.Objects(index).prevXCoor)
            newData = [
                {'X Coordinates'}, num2cell(handles.Objects(index).xCoor);
                {'Y Coordinates'}, num2cell(handles.Objects(index).yCoor)];
        else
            newData = [
                {'X Coordinates       '}, num2cell(handles.Objects(index).xCoor);
                {'Y Coordinates       '}, num2cell(handles.Objects(index).yCoor);
                {'Previous X Coords'}, num2cell(handles.Objects(index).prevXCoor);
                {'Previous Y Coords'}, num2cell(handles.Objects(index).prevYCoor)];
        end
    end
end
set(handles.resultsTable,'Data', newData);  
guidata(hObject,handles);


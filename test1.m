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
handles.currentFigure = Shapes;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Draw X and Y axis%
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
tempPoint = Point;
tempPoint.xCoor = str2double(answer(1));
tempPoint.yCoor = str2double(answer(2));
tempPoint.handle = plot(tempPoint.xCoor, tempPoint.yCoor, '*');
handles.noOfObjects = handles.noOfObjects + 1;
handles.Objects(handles.noOfObjects) = tempPoint;
handles.inputFileNames = [handles.inputFileNames; 'Point',blanks(7)];
display(handles.Objects);
display(handles.inputFileNames);
set(handles.figuresListBox, 'string', {handles.inputFileNames});
guidata(hObject, handles);


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
x = str2double([answer(1),answer(3)]);
y = str2double([answer(2),answer(4)]);
tempLineSegment = LineSegment;
tempLineSegment.xCoor = x;
tempLineSegment.yCoor = y;
tempLineSegment.handle = plot(x, y);
handles.noOfObjects = handles.noOfObjects + 1;
handles.Objects(handles.noOfObjects) = tempLineSegment;
handles.inputFileNames = [handles.inputFileNames; 'Line Segment'];
display(handles.inputFileNames);
set(handles.figuresListBox, 'string', {handles.inputFileNames});
guidata(hObject, handles);

% --- Executes on button press in parabolaPushButton.
function parabolaPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to parabolaPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Vertex X-coordinate','Vertex Y-coordinate','Magnitude'};
dlg_title = 'Create a Parabola';
num_lines =  [1 45;1 45; 1 45];
defaultans = {'','',''};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if ~isempty(answer)
    %x - vertex
    a = str2double(answer(1));
    
    %y - intercept
    b = str2double(answer(2));
    
    %the power
    c = str2double(answer(3))

    % Construct a questdlg with three options
    choice = questdlg('What is the orientation', ...
        'Orientation', ...
        'Vertical','Horizontal','Cancel');
    
    % Handle response
    switch choice
        case 'Vertical'
            x = -100:1:100;
            y = (c * x.^2) + (a * x) + b;
        case 'Horizontal'
            y = -100:1:100;
            x = (c * y.^2) + (a * y) + b;
        case 'Cancel'
    end
    
    if ~isempty(x)
        tempParabola = Parabola;
        tempParabola.xCoor = x;
        tempParabola.yCoor = y;
        tempParabola.handle = plot(x,y);
        handles.noOfObjects = handles.noOfObjects + 1;
        handles.Objects(handles.noOfObjects) = tempParabola;
        handles.inputFileNames = [handles.inputFileNames; 'Parabola',blanks(4)];
        set(handles.figuresListBox, 'string', {handles.inputFileNames});
        guidata(hObject,handles);
    end
end


% --- Executes on button press in hyperbolaPushButton.
function hyperbolaPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to hyperbolaPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Center X-coordinate','Center Y-coordinate','Horizontal Distance','Vertical Distance'};
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
    
    x = -100:1:100;
    % Construct a questdlg with three options
    choice = questdlg('What is the orientation', ...
        'Orientation', ...
        'Vertical','Horizontal','Cancel');
    % Handle response
    switch choice
        case 'Vertical'
           posY = sqrt((x - h).^2 * b^2 / a^2 + b^2);
           negY = -sqrt((x - h).^2 * b^2 / a^2 + b^2);

        case 'Horizontal'
           posY = sqrt((x - h).^2 * b^2 / a^2 - b^2);
           negY = -sqrt((x - h).^2 * b^2 / a^2 - b^2);
           
        case 'Cancel'
    end
    
    if ~isempty(posY)
        tempHyperbola = Hyperbola;
        tempHyperbola.xCoor = x;
        tempHyperbola.yCoorNeg = negY;
        tempHyperbola.yCoor = posY;
        tempHyperbola.handle = plot(x, posY);
        tempHyperbola.handle2 = plot(x, negY);
        handles.noOfObjects = handles.noOfObjects + 1;
        handles.Objects(handles.noOfObjects) = tempHyperbola;
        handles.inputFileNames = [handles.inputFileNames; 'Hyperbola',blanks(3)];
        display(handles.inputFileNames);
        set(handles.figuresListBox, 'string', {handles.inputFileNames});
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
tempPolgyon.handle = plot(x, y);
handles.noOfObjects = handles.noOfObjects + 1;
handles.Objects(handles.noOfObjects) = tempPolygon;
handles.inputFileNames = [handles.inputFileNames; 'Polygon',blanks(5)];
set(handles.figuresListBox, 'string', {handles.inputFileNames});
guidata(hObject,handles);

% --- Executes on button press in ellipsePushButton.
function ellipsePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to ellipsePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Center X-coordinate','Center Y-coordinate','Horizontal Distance','Vertical Distance'};
dlg_title = 'Create an Ellipse';
num_lines =  [1 40;1 40; 1 40; 1 40];
defaultans = {'','','',''};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

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
tempEllipse.handle = plot(x,y);
handles.noOfObjects = handles.noOfObjects + 1;
handles.Objects(handles.noOfObjects) = tempEllipse;
handles.inputFileNames = [handles.inputFileNames; 'Ellipse',blanks(5)];
display(handles.inputFileNames);
set(handles.figuresListBox, 'string', {handles.inputFileNames});
guidata(hObject, handles);


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
x = [0,str2double(answer(1))];
y = [0,str2double(answer(2))];
tempVector = Vector;
tempVector.xCoor = x;
tempVector.yCoor = y;
tempVector.handle = plot(x,y);
handles.noOfObjects = handles.noOfObjects + 1;
handles.Objects(handles.noOfObjects) = tempVector;
handles.inputFileNames = [handles.inputFileNames; 'Vector',blanks(6)];
set(handles.figuresListBox, 'string', {handles.inputFileNames});
guidata(hObject,handles);



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
index_selected = get(hObject,'Value');


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

handles.noOfObjects = handles.noOfObjects - 1;
display(handles.Objects(get(handles.figuresListBox, 'Value')));
delete(handles.Objects(get(handles.figuresListBox, 'Value')).handle);
display(handles.noOfObjects);

% to delete select from listbox
selected = get(handles.figuresListBox,'Value');
prev_str = get(handles.figuresListBox, 'String');
if ~isempty(prev_str)
    prev_str(get(handles.figuresListBox,'Value')) = [];
    set(handles.figuresListBox, 'String', prev_str, ...
        'Value', min(selected,length(prev_str)));
end





% --- Executes on button press in transformPushButton.
function transformPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to transformPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
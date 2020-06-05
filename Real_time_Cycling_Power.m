function varargout = Real_time_Cycling_Power(varargin)
% REAL_TIME_CYCLING_POWER MATLAB code for Real_time_Cycling_Power.fig
%      REAL_TIME_CYCLING_POWER, by itself, creates a new REAL_TIME_CYCLING_POWER or raises the existing
%      singleton*.
%
%      H = REAL_TIME_CYCLING_POWER returns the handle to a new REAL_TIME_CYCLING_POWER or the handle to
%      the existing singleton*.
%
%      REAL_TIME_CYCLING_POWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REAL_TIME_CYCLING_POWER.M with the given input arguments.
%
%      REAL_TIME_CYCLING_POWER('Property','Value',...) creates a new REAL_TIME_CYCLING_POWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Real_time_Cycling_Power_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Real_time_Cycling_Power_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Real_time_Cycling_Power

% Last Modified by GUIDE v2.5 14-Jun-2017 23:08:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Real_time_Cycling_Power_OpeningFcn, ...
                   'gui_OutputFcn',  @Real_time_Cycling_Power_OutputFcn, ...
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


% --- Executes just before Real_time_Cycling_Power is made visible.
function Real_time_Cycling_Power_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Real_time_Cycling_Power (see VARARGIN)

% Choose default command line output for Real_time_Cycling_Power
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Real_time_Cycling_Power wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Real_time_Cycling_Power_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;      
            
% --- Executes on button press in Disconnect.
function Disconnect_Callback(hObject, eventdata, handles)
% hObject    handle to Disconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
clear('a');
clear all %#ok<CLALL>
clc
msgbox('Arduino Disconnected');

% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all %#ok<CLALL>
clc
close all
Sport_Biomech_Title


% --- Executes on button press in About.
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Michael J. Long, Cardiff Metropolitan University 2017');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Wheel_diameter.
function Wheel_diameter_Callback(hObject, eventdata, handles)
% hObject    handle to Wheel_diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Start_test.
function Start_test_Callback(hObject, eventdata, handles)
% hObject    handle to Start_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a lcd
lcd = addon(a,'ExampleLCD/LCDAddon',{'D11','D12','D5','D4','D3','D2'});
initializeLCD(lcd);
printLCD(lcd,'Hello World!');
msgbox('Message sent'); 


% --- Executes on button press in Stop_test.
function Stop_test_Callback(hObject, eventdata, handles)
% hObject    handle to Stop_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global lcd a
clearLCD(lcd);
msgbox('Message cleared'); 

% --- Executes on button press in Connect_Arduino1.
function Connect_Arduino1_Callback(hObject, eventdata, handles)
% hObject    handle to Connect_Arduino1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a 

% plot(x,y,'lineWidth',1);
 set(handles.axes1,'XColor', 'w');
 set(handles.axes1,'YColor', 'w');
 Yaxes_max=5;   
 axis([0 100 0 Yaxes_max])
  drawnow limitrate;
 hold(handles.axes1, 'on')
 
%   addpath C:\MATLAB\SupportPackages\R2016a\toolbox\matlab\hardware\supportpackages\arduinoio\arduinoioexamples\SDKExampleLCD\+arduinoioaddons\+ExampleLCD\
a=arduino('COM7','Uno','Libraries','ExampleLCD/LCDAddon')
  
  msgbox('Arduino connected'); 

function varargout = EMG_Aquisition(varargin)
% EMG_AQUISITION MATLAB code for EMG_Aquisition.fig
%      EMG_AQUISITION, by itself, creates a new EMG_AQUISITION or raises the existing
%      singleton*.
%
%      H = EMG_AQUISITION returns the handle to a new EMG_AQUISITION or the handle to
%      the existing singleton*.
%
%      EMG_AQUISITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EMG_AQUISITION.M with the given input arguments.
%
%      EMG_AQUISITION('Property','Value',...) creates a new EMG_AQUISITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EMG_Aquisition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      close.  All inputs are passed to EMG_Aquisition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EMG_Aquisition

% Last Modified by GUIDE v2.5 10-May-2017 09:58:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EMG_Aquisition_OpeningFcn, ...
                   'gui_OutputFcn',  @EMG_Aquisition_OutputFcn, ...
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


% --- Executes just before EMG_Aquisition is made visible.
function EMG_Aquisition_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<*INUSL>
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EMG_Aquisition (see VARARGIN)

% Choose default command line output for EMG_Aquisition
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EMG_Aquisition wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global a k x trial_number number_samples y; %#ok<*NUSED>



% --- Outputs from this function are returned to the command line.
function varargout = EMG_Aquisition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;  

% --- Executes on button press in Connect_arduino.
function Connect_arduino_Callback(hObject, eventdata, handles)
% hObject    handle to Connect_arduino (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a b  x y z xa ya za Total_samples c d e f g number_samples Yaxes_max

 a=arduino('COM3','Uno','Libraries','');
%  {'I2C','SPI','Servo'}

configurePin(a,'A0','AnalogInput');
configurePin(a,'A1','AnalogInput');
configurePin(a,'A1','AnalogInput');
configurePin(a,'A1','AnalogInput');
configurePin(a,'A1','AnalogInput');
configurePin(a,'A1','AnalogInput');

x=[];
y=[];
z=[];
xa=[];
ya=[];
za=[];
Total_samples=1;




% Construct a questdlg with 2 options                                       % Save data from GUI
choice = questdlg('Connected to Mytus Emflex', ...
	'Connection status', ...
	'OK','cancel','cancel'); %#ok<NASGU>

% --- Executes on button press in Read_Analog_Signal.
function Read_Analog_Signal_Callback(hObject, eventdata, handles)
% hObject    handle to Read_Analog_Signal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a k x y z xa ya za number_samples button button1 button2 axes1 axes2 b c d e f g true x_max y_max z_max xa_max ya_max za_max Yaxes_max Save_Analog_0 Save_Analog_1...
    Save_Analog_2 Save_Analog_3 Save_Analog_4 Save_Analog_5 xaa xx yy zz  yaa Read_Analog Total_samples; 

Total_samples=1;
cla

% set graph limits %
b=zeros(length(1:number_samples));
b=b(:,1);
c=zeros(length(1:number_samples));
c=c(:,1);
d=zeros(length(1:number_samples));
d=d(:,1);
e=zeros(length(1:number_samples));
e=e(:,1);
f=zeros(length(1:number_samples));
f=f(:,1);
g=zeros(length(1:number_samples));
g=g(:,1);

% plot(x,y,'lineWidth',1);
 set(handles.axes6,'XColor', 'w');
 set(handles.axes6,'YColor', 'w');
 Yaxes_max=5;   
 axis([0 number_samples 0 Yaxes_max])
  drawnow limitrate;
 hold(handles.axes6, 'on')
 
tic 
while Total_samples<number_samples

Total_samples=Total_samples+1;
if Save_Analog_0==0
elseif Save_Analog_0==1 
 b(Total_samples,:)=readVoltage(a,'A0');
end

if Save_Analog_1==0
elseif Save_Analog_1==1 
c(Total_samples,:)=readVoltage(a,'A1'); 
end

if Save_Analog_2==0
elseif Save_Analog_2==1 
d(Total_samples,:)=readVoltage(a,'A2'); 
end

if Save_Analog_3==0
elseif Save_Analog_3==1
e(Total_samples,:)=readVoltage(a,'A3'); 
end

if Save_Analog_4==0
elseif Save_Analog_4==1
f(Total_samples,:)=readVoltage(a,'A4'); 
end

if Save_Analog_5==0
elseif Save_Analog_5==1
g(Total_samples,:)=readVoltage(a,'A5'); 
end

 plot(b,'b','lineWidth',1)
 hold on
 plot(c,'g','lineWidth',1)
 plot(d,'r','lineWidth',1)
 plot(e,'c','lineWidth',1)
 plot(f,'m','lineWidth',1)
 plot(g,'k','lineWidth',1)
 drawnow limitrate;
 pause(0.001)

end

%%% Number of Sample %%%
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global number_samples
handles.data1=get(hObject,'String');
handles.xSamples=str2double(handles.data1);
number_samples=handles.xSamples;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles) %#ok<*INUSD>
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Analog_0.
function Analog_0_Callback(hObject, eventdata, handles)
% hObject    handle to Analog_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Analog_0
global a Save_Analog_0;
handles.Analog_0=get(hObject,'Value');
Save_Analog_0=handles.Analog_0;

% --- Executes on button press in Analog_1.
function Analog_1_Callback(hObject, eventdata, handles)
% hObject    handle to Analog_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Analog_1
global a Save_Analog_1;
handles.Analog_1=get(hObject,'Value');
Save_Analog_1=handles.Analog_1;

% --- Executes on button press in Analog_2.
function Analog_2_Callback(hObject, eventdata, handles)
% hObject    handle to Analog_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Analog_2
global a Save_Analog_2;
handles.Analog_2=get(hObject,'Value');
Save_Analog_2=handles.Analog_2;

% --- Executes on button press in Analog_3.
function Analog_3_Callback(hObject, eventdata, handles)
% hObject    handle to Analog_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Analog_3
global a Save_Analog_3;
handles.Analog_3=get(hObject,'Value');
Save_Analog_3=handles.Analog_3;

% --- Executes on button press in Analog_4.
function Analog_4_Callback(hObject, eventdata, handles)
% hObject    handle to Analog_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Analog_4
global a Save_Analog_4;
handles.Analog_4=get(hObject,'Value');
Save_Analog_4=handles.Analog_4;

% --- Executes on button press in Analog_5.
function Analog_5_Callback(hObject, eventdata, handles)
% hObject    handle to Analog_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Analog_5
global a Save_Analog_5;
handles.Analog_5=get(hObject,'Value');
Save_Analog_5=handles.Analog_5;


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Analog_0.
function Analog_0_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Analog_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes6

function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Export_EMG.
function Export_EMG_Callback(hObject, eventdata, handles)
% hObject    handle to Export_EMG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a k x y z xa ya za number_samples button button1 button2 axes1 axes2 b c d e f g true x_max y_max z_max xa_max ya_max za_max Yaxes_max Save_Analog_0 Save_Analog_1...
    Save_Analog_2 Save_Analog_3 Save_Analog_4 Save_Analog_5 xaa xx yy zz  yaa OutputFile Total_sample; 

Trial_number=get(handles.Trial_number_box, 'String');
Initial_box=get(handles.Initial_box, 'String');

for i=1:number_samples
Total_sample(i)=i;
end

b=b';
c=c';
d=d';
e=e';
f=f';
g=g';
Total_sample=Total_sample';



%%% Filter %%%

wn = 2/16;
[t, v] = butter(4,wn, 'low');
b1=filtfilt(t,v,b);


%%% work out mean %%%

%%% Work out peak %%%

%%% work out area under the curve %%%


% Set export folder %
folder_name = uigetdir;
OutputFile = [folder_name,'\EMG_',Initial_box,Trial_number,'.xlsx'];
% copies template file to that of trial name %
copyfile('C:\Users\sm21438\Documents\Cardiff Met\Biomechanics\Sport Science Support\EMG_outputs\EMG_.xlsx',...
strcat('C:\Users\sm21438\Documents\Cardiff Met\Biomechanics\Sport Science Support\EMG_outputs\EMG_',Initial_box,Trial_number,'.xlsx')); 

TEXT1=Total_sample;
TEXT2=b;
TEXT3=c;
TEXT4=d;
TEXT5=e;
TEXT6=f;
TEXT7=g;
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT1,'EMG','A19'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT2,'EMG','B19'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT3,'EMG','J19'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT4,'EMG','R19'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT5,'EMG','Z19'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT6,'EMG','AH19'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT7,'EMG','AP19'); 

 msgbox('Export Successful');


%%%%% GUI Info %%
% --- Executes on button press in About.
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Michael J. Long, Cardiff Metropolitan University 2017');

% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'1. Enter number of Sample' '2.Connect to EMG' '4. select channels to plot','6. Save trial'});

% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
    clear('a');
    clear all %#ok<CLALL>
    clc
    close all
Sport_Biomech_Title



function Trial_number_box_Callback(hObject, eventdata, handles)
% hObject    handle to Trial_number_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Trial_number_box as text
%        str2double(get(hObject,'String')) returns contents of Trial_number_box as a double


% --- Executes during object creation, after setting all properties.
function Trial_number_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Trial_number_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Initial_box_Callback(hObject, eventdata, handles)
% hObject    handle to Initial_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Initial_box as text
%        str2double(get(hObject,'String')) returns contents of Initial_box as a double


% --- Executes during object creation, after setting all properties.
function Initial_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Initial_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

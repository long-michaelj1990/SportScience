function varargout = Perturbation(varargin)
% PERTURBATION MATLAB code for Perturbation.fig
%      PERTURBATION, by itself, creates a new PERTURBATION or raises the existing
%      singleton*.
%
%      H = PERTURBATION returns the handle to a new PERTURBATION or the handle to
%      the existing singleton*.
%
%      PERTURBATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PERTURBATION.M with the given input arguments.
%
%      PERTURBATION('Property','Value',...) creates a new PERTURBATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Perturbation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      close.  All inputs are passed to Perturbation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Perturbation

% Last Modified by GUIDE v2.5 22-Mar-2017 16:07:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Perturbation_OpeningFcn, ...
                   'gui_OutputFcn',  @Perturbation_OutputFcn, ...
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


% --- Executes just before Perturbation is made visible.
function Perturbation_OpeningFcn(hObject, eventdata, handles, varargin) 
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Perturbation (see VARARGIN)

% Choose default command line output for Perturbation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Perturbation wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global a k x trial_number number_samples y; %#ok<NUSED>



% --- Outputs from this function are returned to the command line.
function varargout = Perturbation_OutputFcn(hObject, eventdata, handles)  %#ok<*INUSL>
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;  

% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles) %#ok<DEFNU,*INUSD>
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a; %#ok<NUSED>
clear('a');
clear all %#ok<CLALL>
clc
close all
Sport_Biomech_Title



% --- Executes on button press in Connect_arduino.
function Connect_arduino_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to Connect_arduino (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a 

%%%%%%% Increase BaudeRate of COM5 port %%% LR
x=serial('COM5');
x.Baudrate = 115200;
%%%%%%%
a=arduino('COM5','Uno') %#ok<NOPRT>
configurePin(a,'D12','DigitalOutput')
configurePin(a,'D13','DigitalOutput')
configurePin(a,'D11','DigitalOutput')

writeDigitalPin(a,'D13',0);
writeDigitalPin(a,'D12',0);
writeDigitalPin(a,'D11',0);

% fopen(a);
% Construct a questdlg with 2 options                                       % Save data from GUI
choice = questdlg('Connected to Arduino', ...
	'Connection status', ...
	'OK','cancel','cancel'); %#ok<NASGU>


% --- Executes on button press in About.

function About_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Michael J. Long, Cardiff Metropolitan University 2017');


% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'1. Connect to Vicon' '2. Connect to Arduino' '3. Set Body Weight' '4. Start Trial' '5. Stop Capture'});


% % --- Executes during object creation, after setting all properties.
% function axes6_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to axes6 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: place code in OpeningFcn to populate axes6
% 

% --- Executes on button press in Body_Weight.
function Body_Weight_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to Body_Weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  MyClient ForcePlateIndex  FP_1_Value FP_2_Value FP_3_Value Body_Weight...
    Average_Force_FP1 Average_Force_FP3 Average_Force_FP2 Counter ForcePlateSubsample...
 FP_1_Value_BW  FP_2_Value_BW  FP_3_Value_BW a %#ok<NUSED>



% FP_1=get(handles.FP_1,'Value');
% FP_2=get(handles.FP_2,'Value');
FP_3=get(handles.FP_3,'Value');

if FP_3==1
   FP_3_Value_BW=FP_3_Value.ForceVector(3)*-1;
end

% if (FP_1~=1 && FP_3~=1)
% elseif (FP_1==1 && FP_3==1)
%      FP_1_Value_BW=FP_1_Value.ForceVector(3)*-1;
%       FP_3_Value_BW=FP_3_Value.ForceVector(3)*-1;
% end
% 
% if (FP_1~=1 && FP_2~=1)
% elseif (FP_1==1 && FP_2==1)
%      FP_1_Value_BW=FP_1_Value.ForceVector(3)*-1;
%      FP_2_Value_BW=FP_2_Value.ForceVector(3)*-1;
% end
% 
% if (FP_2~=1 && FP_3~=1)
% elseif (FP_2==1 && FP_3==1)
%     FP_2_Value_BW=FP_2_Value.ForceVector(3)*-1;
%     FP_3_Value_BW=FP_3_Value.ForceVector(3)*-1;
% end

% if (FP_1~=1 && FP_2~=1 && FP_3~=1)
% elseif (FP_1==1 && FP_2==1 && FP_3==1)
%     FP_1_Value_BW=FP_1_Value.ForceVector(3)*-1;
%     FP_2_Value_BW=FP_2_Value.ForceVector(3)*-1;
%     FP_3_Value_BW=FP_3_Value.ForceVector(3)*-1;
% end
% 
% set(handles.FP_1_BW,'String','')
% if FP_1~=1 
% elseif FP_1==1
% 
% set(handles.FP_1_BW,'String',FP_1_Value_BW)
% end
% 
% 
% set(handles.FP_2_BW,'String','')
% if FP_2~=1 
% elseif FP_2==1
% 
% set(handles.FP_2_BW,'String',FP_2_Value_BW)
% end


set(handles.FP_3_BW,'String','')
if FP_3~=1 
elseif FP_3==1

set(handles.FP_3_BW,'String',FP_3_Value_BW)
end


% if (FP_1~=1 && FP_3~=1)
% elseif (FP_1==1 && FP_3==1)
% Body_Weight=FP_1_Value_BW+FP_3_Value_BW; 
% end
% 
% if (FP_1~=1 && FP_2~=1)
% elseif (FP_1==1 && FP_2==1)
%     Body_Weight=FP_1_Value_BW+FP_2_Value_BW; 
% end
% 
% if (FP_2~=1 && FP_3~=1)
% elseif (FP_2==1 && FP_3==1)
%     Body_Weight=FP_2_Value_BW+FP_3_Value_BW; 
% end

% if (FP_1~=1 && FP_2~=1 && FP_3~=1)
% elseif (FP_1==1 && FP_2==1 && FP_3==1)
%     Body_Weight=FP_1_Value_BW+FP_2_Value_BW+FP_3_Value_BW; 
% end
% 
% Body_Weight_STR=num2str(Body_Weight);
% 
% msgbox({[Body_Weight_STR 'N']});



function FP_1_BW_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to FP_1_BW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FP_1_BW as text
%        str2double(get(hObject,'String')) returns contents of FP_1_BW as a double


% --- Executes during object creation, after setting all properties.
function FP_1_BW_CreateFcn(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to FP_1_BW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Vicon_Connect.
function Vicon_Connect_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to Vicon_Connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MessageBox
MessageBox=[];
ViconDataStreamSDK_MATLABTest


% --- Executes on button press in Stop_Vicon.
function Stop_Vicon_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to Stop_Vicon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MessageBox a %#ok<NUSED>
% set(MessageBox,'Visible','on');
clear('a');
clear all %#ok<CLALL>
clc



% --- Executes on button press in FP_1.
function FP_1_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to FP_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FP_1

% --- Executes on button press in FP_2.
function FP_2_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to FP_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FP_2
global  MessageBox MyClient Output_GetGlobalForceVector ForcePlateCount ForcePlateIndex   %#ok<NUSED>

% --- Executes on button press in FP_3.
function FP_3_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to FP_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FP_3
global  MessageBox MyClient Output_GetGlobalForceVector ForcePlateCount ForcePlateIndex   %#ok<NUSED>

% --- Executes on selection change in BW_Change.
function BW_Change_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to BW_Change (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns BW_Change contents as cell array
%        contents{get(hObject,'Value')} returns selected item from BW_Change


% --- Executes during object creation, after setting all properties.
function BW_Change_CreateFcn(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to BW_Change (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FP_2_BW_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to FP_2_BW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FP_2_BW as text
%        str2double(get(hObject,'String')) returns contents of FP_2_BW as a double


% --- Executes during object creation, after setting all properties.
function FP_2_BW_CreateFcn(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to FP_2_BW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FP_3_BW_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to FP_3_BW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FP_3_BW as text
%        str2double(get(hObject,'String')) returns contents of FP_3_BW as a double


% --- Executes during object creation, after setting all properties.
function FP_3_BW_CreateFcn(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to FP_3_BW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Apply_Percent.
function Apply_Percent_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to Apply_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  Percentage_str FP_1_Value_BW FP_2_Value_BW Percentage_BW_FP1 Percentage_BW_FP2 Percentage_BW_FP3 FP_3_Value_BW ...
    Percentage_Val FP_1_Value FP_2_Value FP_3_Value a Percent_Toggle Percentage_BW_FP1_minus Percentage_BW_FP2_minus Percentage_BW_FP3_minus...
    Percentage_BW_FP1_plus Percentage_BW_FP2_plus Percentage_BW_FP3_plus %#ok<NUSED>

Percent_Toggle=get(handles.Apply_Percent,'Value');


Percentage_str=get(handles.BW_Change,'String');
Percentage_Val=get(handles.BW_Change,'Value');


      Percentage_BW_FP1=FP_1_Value_BW.*5/100;
        Percentage_BW_FP2=FP_2_Value_BW.*5/100;
        Percentage_BW_FP3=FP_3_Value_BW.*5/100;

% switch Percentage_str{Percentage_Val}
%     
%     case'10'
% 
%         Percentage_BW_FP1=FP_1_Value_BW.*10/100;
%         Percentage_BW_FP2=FP_2_Value_BW.*10/100;
%         Percentage_BW_FP3=FP_3_Value_BW.*10/100;
%     
%     
% end      
%         
%       Percentage_BW_FP1_minus= (FP_1_Value_BW-Percentage_BW_FP1);
%            Percentage_BW_FP2_minus=  (FP_2_Value_BW-Percentage_BW_FP2);
%                 Percentage_BW_FP3_minus=(FP_3_Value_BW-Percentage_BW_FP3);
                
         Percentage_BW_FP1_plus=  (FP_1_Value_BW+Percentage_BW_FP1);
           Percentage_BW_FP2_plus=  (FP_2_Value_BW+Percentage_BW_FP2);
                Percentage_BW_FP3_plus=(FP_3_Value_BW+Percentage_BW_FP3);
                
  

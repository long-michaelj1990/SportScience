function varargout = Sport_Biomech_Title(varargin)
% SPORT_BIOMECH_TITLE MATLAB code for Sport_Biomech_Title.fig
%      SPORT_BIOMECH_TITLE, by itself, creates a new SPORT_BIOMECH_TITLE or raises the existing
%      singleton*.
%
%      H = SPORT_BIOMECH_TITLE returns the handle to a new SPORT_BIOMECH_TITLE or the handle to
%      the existing singleton*.
%
%      SPORT_BIOMECH_TITLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPORT_BIOMECH_TITLE.M with the given input arguments.
%
%      SPORT_BIOMECH_TITLE('Property','Value',...) creates a new SPORT_BIOMECH_TITLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sport_Biomech_Title_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sport_Biomech_Title_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sport_Biomech_Title

% Last Modified by GUIDE v2.5 14-Jun-2017 20:22:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sport_Biomech_Title_OpeningFcn, ...
                   'gui_OutputFcn',  @Sport_Biomech_Title_OutputFcn, ...
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


% --- Executes just before Sport_Biomech_Title is made visible.
function Sport_Biomech_Title_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sport_Biomech_Title (see VARARGIN)

% Choose default command line output for Sport_Biomech_Title
handles.output = hObject;

guidata(hObject, handles);

% UIWAIT makes Sport_Biomech_Title wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sport_Biomech_Title_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in EMG_Aquisition.
function EMG_Aquisition_Callback(hObject, eventdata, handles)
% hObject    handle to EMG_Aquisition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EMG_Aquisition
close Sport_Biomech_Title


% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Sport_Biomech_Title

% --- Executes on button press in Cycle.
function Cycle_Callback(hObject, eventdata, handles)
% hObject    handle to Cycle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Cycling
close Sport_Biomech_Title

% --- Executes on button press in Vicon_Accuracy.
function Vicon_Accuracy_Callback(hObject, eventdata, handles)
% hObject    handle to Vicon_Accuracy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Sport_Biomech_Title

% --- Executes on button press in POZYX.
function POZYX_Callback(hObject, eventdata, handles)
% hObject    handle to POZYX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
POZYX
close Sport_Biomech_Title

% --- Executes on button press in IpISoft.
function IpISoft_Callback(hObject, eventdata, handles)
% hObject    handle to IpISoft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Sport_Biomech_Title

% --- Executes on button press in Long_Jump.
function Long_Jump_Callback(hObject, eventdata, handles)
% hObject    handle to Long_Jump (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Sport_Biomech_Title

% --- Executes on button press in About.
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Michael J. Long, Cardiff Metropolitan University 2017');


% --- Executes on button press in Digitising.
function Digitising_Callback(hObject, eventdata, handles)
% hObject    handle to Digitising (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DLTdv5
close Sport_Biomech_Title


% --- Executes on button press in OA_Predict.
function OA_Predict_Callback(hObject, eventdata, handles)
% hObject    handle to OA_Predict (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Sport_Biomech_Title

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Sport_Biomech_Title


% --- Executes on button press in Perturbation.
function Perturbation_Callback(hObject, eventdata, handles)
% hObject    handle to Perturbation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Perturbation
close Sport_Biomech_Title


% --- Executes on button press in Cycling_Power.
function Cycling_Power_Callback(hObject, eventdata, handles)
% hObject    handle to Cycling_Power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Real_time_Cycling_Power
close Sport_Biomech_Title

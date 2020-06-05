function varargout = Cycling_Graphs(varargin)
% CYCLING_GRAPHS MATLAB code for Cycling_Graphs.fig
%      CYCLING_GRAPHS, by itself, creates a new CYCLING_GRAPHS or raises the existing
%      singleton*.
%
%      H = CYCLING_GRAPHS returns the handle to a new CYCLING_GRAPHS or the handle to
%      the existing singleton*.
%
%      CYCLING_GRAPHS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CYCLING_GRAPHS.M with the given input arguments.
%
%      CYCLING_GRAPHS('Property','Value',...) creates a new CYCLING_GRAPHS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Cycling_Graphs_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Cycling_Graphs_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Cycling_Graphs

% Last Modified by GUIDE v2.5 27-Mar-2017 10:53:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Cycling_Graphs_OpeningFcn, ...
                   'gui_OutputFcn',  @Cycling_Graphs_OutputFcn, ...
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


% --- Executes just before Cycling_Graphs is made visible.
function Cycling_Graphs_OpeningFcn(hObject, eventdata, handles, varargin) 
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Cycling_Graphs (see VARARGIN)

% Choose default command line output for Cycling_Graphs
handles.output = hObject;

Crank=imread('C:\Users\sm21438\Documents\Cardiff Met\Biomechanics\Sport Science Support\Tangential.jpg');

axes(handles.axes9);
imshow(Crank)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Cycling_Graphs wait for user response (see UIRESUME)
% uiwait(handles.figure1);


 


% --- Outputs from this function are returned to the command line.
function varargout = Cycling_Graphs_OutputFcn(hObject, eventdata, handles)  %#ok<*INUSL>
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in View_Graphs.
function View_Graphs_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% hObject    handle to View_Graphs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OutputFile file Torso_Length Sternum_Height Pelvis_Height Left_Arm_Length Right_Arm_Length Left_Upper_Arm_Length...
Left_Lower_Arm_Length left_Upper_Leg_Length Left_Shank_Length Left_Foot_Length Right_Upper_Arm_Length...
 Right_Lower_Arm_Length Right_Upper_Leg_Length Right_Shank_Length Right_Foot_Length fn d    ...
   Ankle_Angle_R Ankle_Angle_L Knee_Angle_R Knee_Angle_L Hip_Angle_R Hip_Angle_L...
 Hip_Angle_L_Max_val Hip_Angle_R_Max_val Hip_Angle_L_Min_val Hip_Angle_R_Min_val idx1 idx11 idx2 idx22 Knee_Angle_L_Max_val idx3 Knee_Angle_L_Min_val idx33...
 Knee_Angle_R_Max_val idx4 Knee_Angle_R_Min_val idx44 Ankle_Angle_L_Max_val idx5 Ankle_Angle_L_Min_val idx55 Ankle_Angle_R_Max_val idx6 Ankle_Angle_R_Min_val idx66...
 Hip_Angle_L_Knee_Flex Hip_Angle_L_Knee_ext Hip_Angle_R_Knee_Flex Hip_Angle_R_Knee_ext Ankle_Angle_L_Knee_Flex Ankle_Angle_L_Knee_ext Ankle_Angle_R_Knee_Flex Ankle_Angle_R_Knee_ext...
 Tangenital_180 Tangenital_0_360 Tangenital_0_360_R Tangenital_180_R Tangenital_90 Tangenital_90_R Tangenital_270 Tangenital_270_R Tangenital_Front_hip_L Tangenital_Back_hip_L Tangenital_Front_hip_R Tangenital_Back_hip_R...
Tangenital_Front_knee_L Tangenital_Back_knee_L Tangenital_Front_knee_R Tangenital_Back_knee_R Tangenital_Front_ankle_L Tangenital_Back_ankle_L Tangenital_Front_ankle_R Tangenital_Back_ankle_R...
Frontal Sagital Hip_RoM_R Hip_RoM_L Knee_RoM_R Knee_RoM_L Ankle_RoM_R Ankle_RoM_L Cadence Shoulder_Angle_L Shoulder_Angle_R Elbow_Angle_R Elbow_Angle_L Back_Bike_R Back_Bike_L...
Shoulder_Angle_L_Max_val Shoulder_Angle_L_Min_val Shoulder_Angle_R_Max_val Shoulder_Angle_R_Min_val Elbow_Angle_L_Max_val Elbow_Angle_L_Min_val Elbow_Angle_R_Max_val Elbow_Angle_R_Min_val...
Back_Angle_L_Max_val Back_Angle_L_Min_val Back_Angle_R_Max_val Back_Angle_R_Min_val  Saddle_Setback_L Saddle_Setback_R  Horizontal_crank_Angle_L Horizontal_crank_Angle_R KOPS_Angle_R KOPS_Angle_L Overall_KOPS_Angle_R Overall_KOPS_Angle_L...
Tangential_Crank_Angle_R Tangential_Crank_Angle_L...
Hip_Angle_velocity_L Hip_Angle_velocity_R Knee_Angle_velocity_L Knee_Angle_velocity_R Ankle_Angle_velocity_L Ankle_Angle_velocity_R Crank_L_angle_velocity Crank_R_angle_velocity...
Hip_Angle_Acceleration_L Hip_Angle_Acceleration_R Knee_Angle_Acceleration_L Knee_Angle_Acceleration_R Ankle_Angle_Acceleration_L Ankle_Angle_Acceleration_R Crank_L_angle_Acceleration Crank_R_angle_Acceleration...
Hip_Angle_Acceleration_L_Max_val Hip_Angle_Acceleration_L_Min_val Hip_Angle_Acceleration_R_Max_val Hip_Angle_Acceleration_R_Min_val Knee_Angle_Acceleration_L_Max_val Knee_Angle_Acceleration_L_Min_val...
Knee_Angle_Acceleration_R_Max_val Knee_Angle_Acceleration_R_Min_val Ankle_Angle_Acceleration_L_Max_val Ankle_Angle_Acceleration_L_Min_val Ankle_Angle_Acceleration_R_Max_val ...
Ankle_Angle_Acceleration_R_Min_val Hip_Angle_velocity_L_Max_val Hip_Angle_velocity_L_Min_val Hip_Angle_velocity_R_Max_val Hip_Angle_velocity_R_Min_val Knee_Angle_velocity_L_Max_val ...
Knee_Angle_velocity_L_Min_val Knee_Angle_velocity_R_Max_val Knee_Angle_velocity_R_Min_val Ankle_Angle_velocity_L_Max_val Ankle_Angle_velocity_L_Min_val Ankle_Angle_velocity_R_Max_val Ankle_Angle_velocity_R_Min_val...
Tangenital_Vel_Back_hip_L Tangenital_Vel_Front_hip_L Tangenital_Vel_Front_hip_R Tangenital_Vel_Back_hip_R Tangenital_Vel_Front_knee_L Tangenital_Vel_Back_knee_L Tangenital_Vel_Front_knee_R Tangenital_Vel_Back_knee_R...
Tangenital_Vel_Back_ankle_L Tangenital_Vel_Front_ankle_L Tangenital_Vel_Front_ankle_R Tangenital_Vel_Back_ankle_R Tangenital_Acceleration_Back_hip_L Tangenital_Acceleration_Back_hip_R Tangenital_Acceleration_Back_knee_L...
Tangenital_Acceleration_Back_knee_R Tangenital_Acceleration_Back_ankle_R Tangenital_Acceleration_Back_ankle_L Tangenital_Acceleration_Front_hip_L Tangenital_Acceleration_Front_hip_R Tangenital_Acceleration_Front_knee_L Tangenital_Acceleration_Front_knee_R ...
Tangenital_Acceleration_Front_ankle_L Tangenital_Acceleration_Front_ankle_R...
Hip_Tangential_Velocity_L_Max_val Hip_Tangential_Velocity_L_Min_val Hip_Tangential_Velocity_R_Max_val Hip_Tangential_Velocity_R_Min_val...
Knee_Tangential_Velocity_L_Max_val Knee_Tangential_Velocity_L_Min_val Knee_Tangential_Velocity_R_Max_val Knee_Tangential_Velocity_R_Min_val...
Ankle_Tangential_Velocity_L_Max_val Ankle_Tangential_Velocity_L_Min_val Ankle_Tangential_Velocity_R_Max_val Ankle_Tangential_Velocity_R_Min_val...
Hip_Tangential_Acceleration_L_Max_val Hip_Tangential_Acceleration_L_Min_val Hip_Tangential_Acceleration_R_Max_val Hip_Tangential_Acceleration_R_Min_val...
Knee_Tangential_Acceleration_L_Max_val Knee_Tangential_Acceleration_L_Min_val Knee_Tangential_Acceleration_R_Max_val Knee_Tangential_Acceleration_R_Min_val...
Ankle_Tangential_Acceleration_L_Max_val Ankle_Tangential_Acceleration_L_Min_val Ankle_Tangential_Acceleration_R_Max_val Ankle_Tangential_Acceleration_R_Min_val...
Tangenital_Vel_Front_hip_negative_up_L Tangenital_Vel_Front_hip_negative_down_L Tangenital_Vel_Back_hip_positive_up_L Tangenital_Vel_Back_hip_positive_down_L...
 Tangenital_Vel_Back_hip_positive_up_R Tangenital_Vel_Back_hip_positive_down_R Tangenital_Vel_Front_hip_negative_up_R Tangenital_Vel_Front_hip_negative_down_R...
Tangenital_Vel_Front_knee_negative_up_L Tangenital_Vel_Front_knee_negative_down_L Tangenital_Vel_Back_knee_positive_up_L Tangenital_Vel_Back_knee_positive_down_L...
Tangenital_Vel_Back_knee_positive_up_R Tangenital_Vel_Back_knee_positive_down_R Tangenital_Vel_Front_knee_negative_up_R Tangenital_Vel_Front_knee_negative_down_R...
Tangenital_Vel_Front_ankle_negative_up_L Tangenital_Vel_Front_ankle_negative_down_L Tangenital_Vel_Back_ankle_positive_up_L Tangenital_Vel_Back_ankle_positive_down_L...
Tangenital_Vel_Back_ankle_positive_up_R Tangenital_Vel_Back_ankle_positive_down_R Tangenital_Vel_Front_ankle_negative_up_R Tangenital_Vel_Front_ankle_negative_down_R...
...
Tangenital_Acceleration_Front_hip_negative_up_L Tangenital_Acceleration_Front_hip_negative_down_L Tangenital_Acceleration_Back_hip_positive_up_L Tangenital_Acceleration_Back_hip_positive_down_L... 
Tangenital_Acceleration_Back_hip_positive_up_R Tangenital_Acceleration_Back_hip_positive_down_R Tangenital_Acceleration_Front_hip_negative_up_R Tangenital_Acceleration_Front_hip_negative_down_R...
Tangenital_Acceleration_Front_knee_negative_up_L Tangenital_Acceleration_Front_knee_negative_down_L Tangenital_Acceleration_Back_knee_positive_up_L Tangenital_Acceleration_Back_knee_positive_down_L...
Tangenital_Acceleration_Back_knee_positive_up_R Tangenital_Acceleration_Back_knee_positive_down_R Tangenital_Acceleration_Front_knee_negative_up_R Tangenital_Acceleration_Front_knee_negative_down_R...
Tangenital_Acceleration_Front_ankle_negative_up_L Tangenital_Acceleration_Front_ankle_negative_down_L Tangenital_Acceleration_Back_ankle_positive_up_L Tangenital_Acceleration_Back_ankle_positive_down_L...
Tangenital_Acceleration_Back_ankle_positive_up_R Tangenital_Acceleration_Back_ankle_positive_down_R Tangenital_Acceleration_Front_ankle_negative_up_R Tangenital_Acceleration_Front_ankle_negative_down_R...
i q w e r t y 

i=[];
q=[];
w=[];
e=[];

r=[];
t=[];
y=[];
%% Crank Tangenital
Tangenital_0_360=[5 360];
Tangenital_90=90;
Tangenital_180=180;
Tangenital_270=270;
Tangenital_0_360_R=[1 360];
Tangenital_90_R=90;
Tangenital_180_R=180;
Tangenital_270_R=270;
Fs=500;

Graph_Time=d.lastframe/500; %#ok<*NASGU>


% Find angle Peaks %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Left Back %

Back_angle_L_max=max(Back_Bike_L);
Back_angle_L_max=Back_angle_L_max-10;
Back_angle_L_min=min(Back_Bike_L);
Back_angle_L_min=Back_angle_L_min+10;

[Back_Angle_L_Max_val1, idx208]=findpeaks(Back_Bike_L,Fs,'MinPeakDistance',0.5);
[Back_Angle_L_Max_val12, idx209]=findpeaks(Back_Bike_L*-1,Fs,'MinPeakDistance',0.5);
Back_Angle_L_Max_val12=Back_Angle_L_Max_val12*-1;

for i=1:size(Back_Angle_L_Max_val1)
if Back_Angle_L_Max_val1(i) < Back_angle_L_max
    Back_Angle_L_Max_val1(i)=0;
    idx208(i)=0;
end
end

Back_Angle_L_Max_val1=Back_Angle_L_Max_val1(max(Back_Angle_L_Max_val1~=0,[],2),:);
idx208=idx208(max(idx208~=0,[],2),:);

for i=1:size(Back_Angle_L_Max_val12)
if Back_Angle_L_Max_val12(i) > Back_angle_L_min
    Back_Angle_L_Max_val12(i)=0;
    idx209(i)=0;
end
end
Back_Angle_L_Max_val12=Back_Angle_L_Max_val12(max(Back_Angle_L_Max_val12~=0,[],2),:);
idx209=idx209(max(idx209~=0,[],2),:);

Back_Angle_L_Max_val=Back_Angle_L_Max_val1;
idx2008=idx208;
Back_Angle_L_Min_val=Back_Angle_L_Max_val12;
idx2018=idx209;

% Right Back %
Back_angle_R_max=max(Back_Bike_R(30000,:));
Back_angle_R_max=Back_angle_R_max-10;
Back_angle_R_min=min(Back_Bike_R(30000,:));
Back_angle_R_min=Back_angle_R_min+10;

[Back_Angle_R_Max_val1, idx210]=findpeaks(Back_Bike_R,Fs,'MinPeakDistance',0.5);
[Back_Angle_R_Max_val12, idx211]=findpeaks(Back_Bike_R*-1,Fs,'MinPeakDistance',0.5);
Back_Angle_R_Max_val12=Back_Angle_R_Max_val12*-1;

for i=1:size(Back_Angle_R_Max_val1)
if Back_Angle_R_Max_val1(i) < Back_angle_R_max
    Back_Angle_R_Max_val1(i)=0;
    idx210(i)=0;
end
end

Back_Angle_R_Max_val1=Back_Angle_R_Max_val1(max(Back_Angle_R_Max_val1~=0,[],2),:);
idx210=idx210(max(idx210~=0,[],2),:);

for i=1:size(Back_Angle_R_Max_val12)
if Back_Angle_R_Max_val12(i) > Back_angle_R_min
    Back_Angle_R_Max_val12(i)=0;
    idx211(i)=0;
end
end

Back_Angle_R_Max_val12=Back_Angle_R_Max_val12(max(Back_Angle_R_Max_val12~=0,[],2),:);
idx211=idx211(max(idx211~=0,[],2),:);

Back_Angle_R_Max_val=Back_Angle_R_Max_val1;
idx2010=idx210;
Back_Angle_R_Min_val=Back_Angle_R_Max_val12;
idx2021=idx211;

% Left Shoulder %

Shoulder_angle_L_max=max(Shoulder_Angle_L);
Shoulder_angle_L_max=Shoulder_angle_L_max-10;
Shoulder_angle_L_min=min(Shoulder_Angle_L);
Shoulder_angle_L_min=Shoulder_angle_L_min+10;

[Shoulder_Angle_L_Max_val1, idx200]=findpeaks(Shoulder_Angle_L,Fs,'MinPeakDistance',0.5);
[Shoulder_Angle_L_Max_val12, idx201]=findpeaks(Shoulder_Angle_L*-1,Fs,'MinPeakDistance',0.5);
Shoulder_Angle_L_Max_val12=Shoulder_Angle_L_Max_val12*-1;

for i=1:size(Shoulder_Angle_L_Max_val1)
if Shoulder_Angle_L_Max_val1(i) < Shoulder_angle_L_max
    Shoulder_Angle_L_Max_val1(i)=0;
    idx200(i)=0;
end
end

Shoulder_Angle_L_Max_val1=Shoulder_Angle_L_Max_val1(max(Shoulder_Angle_L_Max_val1~=0,[],2),:);
idx200=idx200(max(idx200~=0,[],2),:);

for i=1:size(Shoulder_Angle_L_Max_val12)
if Shoulder_Angle_L_Max_val12(i) > Shoulder_angle_L_min
    Shoulder_Angle_L_Max_val12(i)=0;
    idx201(i)=0;
end
end

Shoulder_Angle_L_Max_val12=Shoulder_Angle_L_Max_val12(max(Shoulder_Angle_L_Max_val12~=0,[],2),:);
idx201=idx201(max(idx201~=0,[],2),:);

Shoulder_Angle_L_Max_val=Shoulder_Angle_L_Max_val1;
idx2001=idx200;
Shoulder_Angle_L_Min_val=Shoulder_Angle_L_Max_val12;
idx2011=idx201;


% Right Shoulder %

Shoulder_angle_R_max=max(Shoulder_Angle_R);
Shoulder_angle_R_max=Shoulder_angle_R_max-10;
Shoulder_angle_R_min=min(Shoulder_Angle_R);
Shoulder_angle_R_min=Shoulder_angle_R_min+10;

[Shoulder_Angle_R_Max_val1, idx202]=findpeaks(Shoulder_Angle_R,Fs,'MinPeakDistance',0.5);
[Shoulder_Angle_R_Max_val12, idx203]=findpeaks(Shoulder_Angle_R*-1,Fs,'MinPeakDistance',0.5);
Shoulder_Angle_R_Max_val12=Shoulder_Angle_R_Max_val12*-1;

for i=1:size(Shoulder_Angle_R_Max_val1)
if Shoulder_Angle_R_Max_val1(i) < Shoulder_angle_R_max
    Shoulder_Angle_R_Max_val1(i)=0;
    idx202(i)=0;
end
end

Shoulder_Angle_R_Max_val1=Shoulder_Angle_R_Max_val1(max(Shoulder_Angle_R_Max_val1~=0,[],2),:);
idx202=idx202(max(idx202~=0,[],2),:);

for i=1:size(Shoulder_Angle_R_Max_val12)
if Shoulder_Angle_R_Max_val12(i) > Shoulder_angle_R_min
    Shoulder_Angle_R_Max_val12(i)=0;
    idx203(i)=0;
end
end

Shoulder_Angle_R_Max_val12=Shoulder_Angle_R_Max_val12(max(Shoulder_Angle_R_Max_val12~=0,[],2),:);
idx203=idx203(max(idx203~=0,[],2),:);

Shoulder_Angle_R_Max_val=Shoulder_Angle_R_Max_val1;
idx2002=idx202;
Shoulder_Angle_R_Min_val=Shoulder_Angle_R_Max_val12;
idx2011=idx203;


% Left elbow %

Elbow_angle_L_max=max(Elbow_Angle_L);
Elbow_angle_L_max=Elbow_angle_L_max-10;
Elbow_angle_L_min=min(Elbow_Angle_L);
Elbow_angle_L_min=Elbow_angle_L_min+10;

[Elbow_Angle_L_Max_val1, idx204]=findpeaks(Elbow_Angle_L,Fs,'MinPeakDistance',0.5);
[Elbow_Angle_L_Max_val12, idx205]=findpeaks(Elbow_Angle_L*-1,Fs,'MinPeakDistance',0.5);
Elbow_Angle_L_Max_val12=Elbow_Angle_L_Max_val12*-1;

for i=1:size(Elbow_Angle_L_Max_val1)
if Elbow_Angle_L_Max_val1(i) < Elbow_angle_L_max
    Elbow_Angle_L_Max_val1(i)=0;
    idx204(i)=0;
end
end

Elbow_Angle_L_Max_val1=Elbow_Angle_L_Max_val1(max(Elbow_Angle_L_Max_val1~=0,[],2),:);
idx204=idx204(max(idx204~=0,[],2),:);

for i=1:size(Elbow_Angle_L_Max_val12)
if Elbow_Angle_L_Max_val12(i) > Elbow_angle_L_min
    Elbow_Angle_L_Max_val12(i)=0;
    idx205(i)=0;
end
end

Elbow_Angle_L_Max_val12=Elbow_Angle_L_Max_val12(max(Elbow_Angle_L_Max_val12~=0,[],2),:);
idx205=idx205(max(idx205~=0,[],2),:);

Elbow_Angle_L_Max_val=Elbow_Angle_L_Max_val1;
idx2004=idx204;
Elbow_Angle_L_Min_val=Elbow_Angle_L_Max_val12;
idx2015=idx205;
 
% Right Elbow %

Elbow_angle_R_max=max(Elbow_Angle_R);
Elbow_angle_R_max=Elbow_angle_R_max-10;
Elbow_angle_R_min=min(Elbow_Angle_R);
Elbow_angle_R_min=Elbow_angle_R_min+10;

[Elbow_Angle_R_Max_val1, idx206]=findpeaks(Elbow_Angle_R,Fs,'MinPeakDistance',0.5);
[Elbow_Angle_R_Max_val12, idx207]=findpeaks(Elbow_Angle_R*-1,Fs,'MinPeakDistance',0.5);
Elbow_Angle_R_Max_val12=Elbow_Angle_R_Max_val12*-1;

for i=1:size(Elbow_Angle_R_Max_val1)
if Elbow_Angle_R_Max_val1(i) < Elbow_angle_R_max
    Elbow_Angle_R_Max_val1(i)=0;
    idx206(i)=0;
end
end

Elbow_Angle_R_Max_val1=Elbow_Angle_R_Max_val1(max(Elbow_Angle_R_Max_val1~=0,[],2),:);
idx206=idx206(max(idx206~=0,[],2),:);

for i=1:size(Elbow_Angle_R_Max_val12)
if Elbow_Angle_R_Max_val12(i) > Elbow_angle_R_min
    Elbow_Angle_R_Max_val12(i)=0;
    idx207(i)=0;
end
end

Elbow_Angle_R_Max_val12=Elbow_Angle_R_Max_val12(max(Elbow_Angle_R_Max_val12~=0,[],2),:);
idx207=idx207(max(idx207~=0,[],2),:);

Elbow_Angle_R_Max_val=Elbow_Angle_R_Max_val1;
idx2006=idx206;
Elbow_Angle_R_Min_val=Elbow_Angle_R_Max_val12;
idx2017=idx207;

% Left Hip %

Hip_angle_L_max=max(Hip_Angle_L);
Hip_angle_L_max=Hip_angle_L_max-10;
Hip_angle_L_min=min(Hip_Angle_L);
Hip_angle_L_min=Hip_angle_L_min+10;

[Hip_Angle_L_Max_val1, idx111]=findpeaks(Hip_Angle_L,Fs,'MinPeakDistance',0.5);
[Hip_Angle_L_Max_val12, idx112]=findpeaks(Hip_Angle_L*-1,Fs,'MinPeakDistance',0.5);
Hip_Angle_L_Max_val12=Hip_Angle_L_Max_val12*-1;

for i=1:size(Hip_Angle_L_Max_val1)
if Hip_Angle_L_Max_val1(i) < Hip_angle_L_max
    Hip_Angle_L_Max_val1(i)=0;
    idx111(i)=0;
end
end

Hip_Angle_L_Max_val1=Hip_Angle_L_Max_val1(max(Hip_Angle_L_Max_val1~=0,[],2),:);
idx111=idx111(max(idx111~=0,[],2),:);

for i=1:size(Hip_Angle_L_Max_val12)
if Hip_Angle_L_Max_val12(i) > Hip_angle_L_min
    Hip_Angle_L_Max_val12(i)=0;
    idx112(i)=0;
end
end

Hip_Angle_L_Max_val12=Hip_Angle_L_Max_val12(max(Hip_Angle_L_Max_val12~=0,[],2),:);
idx112=idx112(max(idx112~=0,[],2),:);

Hip_Angle_L_Max_val=Hip_Angle_L_Max_val1;
idx1=idx111;
Hip_Angle_L_Min_val=Hip_Angle_L_Max_val12;
idx11=idx112;

% Right Hip %

Hip_angle_R_max=max(Hip_Angle_R);
Hip_angle_R_max=Hip_angle_R_max-10;
Hip_angle_R_min=min(Hip_Angle_R);
Hip_angle_R_min=Hip_angle_R_min+10;

[Hip_Angle_R_Max_val13, idx113]=findpeaks(Hip_Angle_R,Fs,'MinPeakDistance',0.5);
[Hip_Angle_R_Max_val14, idx114]=findpeaks(Hip_Angle_R*-1,Fs,'MinPeakDistance',0.5);
Hip_Angle_R_Max_val14=Hip_Angle_R_Max_val14*-1;

for i=1:size(Hip_Angle_R_Max_val13)
if Hip_Angle_R_Max_val13(i) < Hip_angle_R_max
    Hip_Angle_R_Max_val13(i)=0;
    idx113(i)=0;
end
end
Hip_Angle_R_Max_val13=Hip_Angle_R_Max_val13(max(Hip_Angle_R_Max_val13~=0,[],2),:);
idx113=idx113(max(idx113~=0,[],2),:);

for i=1:size(Hip_Angle_R_Max_val14)
if Hip_Angle_R_Max_val14(i) > Hip_angle_R_min
    Hip_Angle_R_Max_val14(i)=0;
    idx114(i)=0;
end
end

Hip_Angle_R_Max_val14=Hip_Angle_R_Max_val14(max(Hip_Angle_R_Max_val14~=0,[],2),:);
idx114=idx114(max(idx114~=0,[],2),:);

Hip_Angle_R_Max_val=Hip_Angle_R_Max_val13;
idx2=idx113;
Hip_Angle_R_Min_val=Hip_Angle_R_Max_val14;
idx22=idx114;

% Left Knee %

Knee_angle_L_max=max(Knee_Angle_L);
Knee_angle_L_max=Knee_angle_L_max-10;
Knee_angle_L_min=min(Knee_Angle_L);
Knee_angle_L_min=Knee_angle_L_min+10;

[Knee_Angle_L_Max_val15, idx115]=findpeaks(Knee_Angle_L,Fs,'MinPeakDistance',0.5);
[Knee_Angle_L_Max_val16, idx116]=findpeaks(Knee_Angle_L*-1,Fs,'MinPeakDistance',0.5);
Knee_Angle_L_Max_val16=Knee_Angle_L_Max_val16*-1;

for i=1:size(Knee_Angle_L_Max_val15)
if Knee_Angle_L_Max_val15(i) < Knee_angle_L_max
    Knee_Angle_L_Max_val15(i)=0;
    idx115(i)=0;
end
end

Knee_Angle_L_Max_val15=Knee_Angle_L_Max_val15(max(Knee_Angle_L_Max_val15~=0,[],2),:);
idx115=idx115(max(idx115~=0,[],2),:);

for i=1:size(Knee_Angle_L_Max_val16)
if Knee_Angle_L_Max_val16(i) > Knee_angle_L_min
    Knee_Angle_L_Max_val16(i)=0;
    idx116(i)=0;
end
end

Knee_Angle_L_Max_val16=Knee_Angle_L_Max_val16(max(Knee_Angle_L_Max_val16~=0,[],2),:);
idx116=idx116(max(idx116~=0,[],2),:);

Knee_Angle_L_Max_val=Knee_Angle_L_Max_val15;
idx3=idx115;
Knee_Angle_L_Min_val=Knee_Angle_L_Max_val16;
idx33=idx116;


% Right Knee %

Knee_angle_R_max=max(Knee_Angle_R);
Knee_angle_R_max=Knee_angle_R_max-10;
Knee_angle_R_min=min(Knee_Angle_R);
Knee_angle_R_min=Knee_angle_R_min+10;


[Knee_Angle_R_Max_val17, idx117]=findpeaks(Knee_Angle_R,Fs,'MinPeakDistance',0.5);
[Knee_Angle_R_Max_val18, idx118]=findpeaks(Knee_Angle_R*-1,Fs,'MinPeakDistance',0.5);
Knee_Angle_R_Max_val18=Knee_Angle_R_Max_val18*-1;

for i=1:size(Knee_Angle_R_Max_val17)
if Knee_Angle_R_Max_val17(i) < Knee_angle_R_max
    Knee_Angle_R_Max_val17(i)=0;
    idx117(i)=0;
end
end

Knee_Angle_R_Max_val17=Knee_Angle_R_Max_val17(max(Knee_Angle_R_Max_val17~=0,[],2),:);
idx117=idx117(max(idx117~=0,[],2),:);

for i=1:size(Knee_Angle_R_Max_val18)
if Knee_Angle_R_Max_val18(i) > Knee_angle_R_min
    Knee_Angle_R_Max_val18(i)=0;
    idx118(i)=0;
end
end

Knee_Angle_R_Max_val18=Knee_Angle_R_Max_val18(max(Knee_Angle_R_Max_val18~=0,[],2),:);
idx118=idx118(max(idx118~=0,[],2),:);

Knee_Angle_R_Max_val=Knee_Angle_R_Max_val17;
idx4=idx117;
Knee_Angle_R_Min_val=Knee_Angle_R_Max_val18;
idx44=idx118;

% Left Ankle %

Ankle_angle_L_max=max(Ankle_Angle_L);
Ankle_angle_L_max=Ankle_angle_L_max-10;
Ankle_angle_L_min=min(Ankle_Angle_L);
Ankle_angle_L_min=Ankle_angle_L_min+10;

if Cadence>=102
[Ankle_Angle_L_Max_val19, idx119]=findpeaks(Ankle_Angle_L,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Ankle_Angle_L_Max_val20, idx120]=findpeaks(Ankle_Angle_L*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Ankle_Angle_L_Max_val19, idx119]=findpeaks(Ankle_Angle_L,Fs,'MinPeakDistance',1); %1 
[Ankle_Angle_L_Max_val20, idx120]=findpeaks(Ankle_Angle_L*-1,Fs,'MinPeakDistance',1);
end

Ankle_Angle_L_Max_val20=Ankle_Angle_L_Max_val20*-1;
% 
for i=1:size(Ankle_Angle_L_Max_val19)
    if Ankle_Angle_L_Max_val19(i) < Ankle_angle_L_max
   Ankle_Angle_L_Max_val19(i)=0;
    idx119(i)=0;
     end
end
Ankle_Angle_L_Max_val19=Ankle_Angle_L_Max_val19(max(Ankle_Angle_L_Max_val19~=0,[],2),:);
idx119=idx119(max(idx119~=0,[],2),:);

for i=1:size(Ankle_Angle_L_Max_val20)
if Ankle_Angle_L_Max_val20(i) > Ankle_angle_L_min
    Ankle_Angle_L_Max_val20(i)=0;
    idx120(i)=0;
end
end
Ankle_Angle_L_Max_val20=Ankle_Angle_L_Max_val20(max(Ankle_Angle_L_Max_val20~=0,[],2),:);
idx120=idx120(max(idx120~=0,[],2),:);



Ankle_Angle_L_Max_val=Ankle_Angle_L_Max_val19;
idx5=idx119;
Ankle_Angle_L_Min_val=Ankle_Angle_L_Max_val20;
idx55=idx120;

% Right ankle %

Ankle_angle_R_max=max(Ankle_Angle_R);
Ankle_angle_R_max=Ankle_angle_L_max-10;
Ankle_angle_R_min=min(Ankle_Angle_R);
Ankle_angle_R_min=Ankle_angle_R_min+10;

if Cadence>=102
[Ankle_Angle_R_Max_val21, idx121]=findpeaks(Ankle_Angle_R,Fs,'MinPeakDistance',0.3);
[Ankle_Angle_R_Max_val22, idx122]=findpeaks(Ankle_Angle_R*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
    [Ankle_Angle_R_Max_val21, idx121]=findpeaks(Ankle_Angle_R,Fs,'MinPeakDistance',1);
[Ankle_Angle_R_Max_val22, idx122]=findpeaks(Ankle_Angle_R*-1,Fs,'MinPeakDistance',1);
end
    
Ankle_Angle_R_Max_val22=Ankle_Angle_R_Max_val22*-1;

for i=1:size(Ankle_Angle_R_Max_val21)
if Ankle_Angle_R_Max_val21(i) < Ankle_angle_R_max
    Ankle_Angle_R_Max_val21(i)=0;
    idx121(i)=0;
end
end
Ankle_Angle_R_Max_val21=Ankle_Angle_R_Max_val21(max(Ankle_Angle_R_Max_val21~=0,[],2),:);
idx121=idx121(max(idx121~=0,[],2),:);

for i=1:size(Ankle_Angle_R_Max_val22)
if Ankle_Angle_R_Max_val22(i) > Ankle_angle_R_min
    Ankle_Angle_R_Max_val22(i)=0;
    idx122(i)=0;
end
end

Ankle_Angle_R_Max_val22=Ankle_Angle_R_Max_val22(max(Ankle_Angle_R_Max_val22~=0,[],2),:);
idx122=idx122(max(idx122~=0,[],2),:);

Ankle_Angle_R_Max_val=Ankle_Angle_R_Max_val21;
idx6=idx121;
Ankle_Angle_R_Min_val=Ankle_Angle_R_Max_val22;
idx66=idx122;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find 90 degree Left crank angle %

if Cadence>=102
[PED_Horizontal_L_Max_val21, idx225]=findpeaks(d.markerName.PED_ANT_L(:,2),Fs,'MinPeakDistance',0.5);

elseif Cadence<102
    [PED_Horizontal_L_Max_val21, idx225]=findpeaks(d.markerName.PED_ANT_L(:,2),Fs,'MinPeakDistance',1); %1
end
idx225=round(idx225*500);


for i=1:size(Saddle_Setback_L)
for j=1:size(idx225)
 if idx225(j)~=i
 elseif idx225(j)==i
     Horizontal_crank_Angle_L(j)=Saddle_Setback_L(i);
 end
end
end
Horizontal_crank_Angle_L=Horizontal_crank_Angle_L';
Horizontal_crank_Angle_L=mean(Horizontal_crank_Angle_L);

% Find 90 degree Left crank angle %

if Cadence>=102
[PED_Horizontal_R_Max_val21, idx226]=findpeaks(d.markerName.PED_ANT_R(:,2),Fs,'MinPeakDistance',0.5);

elseif Cadence<102
    [PED_Horizontal_R_Max_val21, idx226]=findpeaks(d.markerName.PED_ANT_R(:,2),Fs,'MinPeakDistance',1);
end
idx226=round(idx226*500);


for i=1:size(Saddle_Setback_R)
for j=1:size(idx226)
 if idx226(j)~=i
 elseif idx226(j)==i
     Horizontal_crank_Angle_R(j)=Saddle_Setback_R(i);
 end
end
end
Horizontal_crank_Angle_R=Horizontal_crank_Angle_R';
Horizontal_crank_Angle_R=mean(Horizontal_crank_Angle_R);

% Left KOPS angle %

if Cadence>=102
[KOPS_Angle_L_Max_val21, idx227]=findpeaks(d.markerName.MTP5_L(:,2),Fs,'MinPeakDistance',0.5);

elseif Cadence<102
    [KOPS_Angle_L_Max_val21, idx227]=findpeaks(d.markerName.MTP5_L(:,2),Fs,'MinPeakDistance',1);
end
idx227=round(idx227*500);


for i=1:size(KOPS_Angle_L)
for j=1:size(idx227)
 if idx227(j)~=i
 elseif idx227(j)==i
     Overall_KOPS_Angle_L(j)=KOPS_Angle_L(i);
 end
end
end
Overall_KOPS_Angle_L=Overall_KOPS_Angle_L';
Overall_KOPS_Angle_L=mean(Overall_KOPS_Angle_L);

% Right KOPS angle %

if Cadence>=102
[KOPS_Angle_R_Max_val21, idx228]=findpeaks(d.markerName.MTP5_R(:,2),Fs,'MinPeakDistance',0.5);

elseif Cadence<102
    [KOPS_Angle_R_Max_val21, idx228]=findpeaks(d.markerName.MTP5_R(:,2),Fs,'MinPeakDistance',1);
end
idx228=round(idx228*500);


for i=1:size(KOPS_Angle_R)
for j=1:size(idx228)
 if idx228(j)~=i
 elseif idx228(j)==i
     Overall_KOPS_Angle_R(j)=KOPS_Angle_R(i);
 end
end
end
Overall_KOPS_Angle_R=Overall_KOPS_Angle_R';
Overall_KOPS_Angle_R=mean(Overall_KOPS_Angle_R);

idx11=round(idx11*500);
idx1=round(idx1*500);
idx22=round(idx22*500);
idx2=round(idx2*500);
idx33=round(idx33*500);
idx3=round(idx3*500);
idx44=round(idx44*500);
idx4=round(idx4*500);

idx55=round(idx55*500);
idx5=round(idx5*500);
idx66=round(idx66*500);
idx6=round(idx6*500);

Hip_Angle_L_Knee_Flex=Hip_Angle_L(idx33);
Hip_Angle_L_Knee_ext=Hip_Angle_L(idx3);

Ankle_Angle_L_Knee_Flex=Ankle_Angle_L(idx33);
Ankle_Angle_L_Knee_ext=Ankle_Angle_L(idx3);

Hip_Angle_R_Knee_Flex=Hip_Angle_R(idx44);
Hip_Angle_R_Knee_ext=Hip_Angle_R(idx4);

Ankle_Angle_R_Knee_Flex=Ankle_Angle_R(idx44);
Ankle_Angle_R_Knee_ext=Ankle_Angle_R(idx4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pause (0.5)
% Tangential Angles %
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% left hip %

for i=1:size(Tangential_Crank_Angle_L)
if (Tangential_Crank_Angle_L(i)>Tangenital_0_360(:,1) && Tangential_Crank_Angle_L(i)< Tangenital_180(:,1))
Tangenital_Front_hip_L(i)=Hip_Angle_L(i);

elseif (Tangential_Crank_Angle_L(i)>Tangenital_180(:,1) && Tangential_Crank_Angle_L(i)< Tangenital_0_360(:,2))
    Tangenital_Back_hip_L(i)=Hip_Angle_L(i);
end
end
Tangenital_Front_hip_L=Tangenital_Front_hip_L(Tangenital_Front_hip_L~=0);
Tangenital_Back_hip_L=Tangenital_Back_hip_L(Tangenital_Back_hip_L~=0);
Tangenital_Front_hip_L=Tangenital_Front_hip_L';
Tangenital_Back_hip_L=Tangenital_Back_hip_L';

% Right Hip %

for i=1:size(Tangential_Crank_Angle_R)
if (Tangential_Crank_Angle_R(i)>Tangenital_0_360(:,1) && Tangential_Crank_Angle_R(i)< Tangenital_180(:,1))
Tangenital_Front_hip_R(i)=Hip_Angle_R(i);

elseif (Tangential_Crank_Angle_R(i)>Tangenital_180(:,1) && Tangential_Crank_Angle_R(i)< Tangenital_0_360(:,2))
Tangenital_Back_hip_R(i)=Hip_Angle_R(i);
end
end
Tangenital_Front_hip_R=Tangenital_Front_hip_R(Tangenital_Front_hip_R~=0);
Tangenital_Back_hip_R=Tangenital_Back_hip_R(Tangenital_Back_hip_R~=0);
Tangenital_Front_hip_R=Tangenital_Front_hip_R';
Tangenital_Back_hip_R=Tangenital_Back_hip_R';

% Left knee %

for i=1:size(Tangential_Crank_Angle_L)
if (Tangential_Crank_Angle_L(i)>Tangenital_0_360(:,1) && Tangential_Crank_Angle_L(i)< Tangenital_180(:,1))
Tangenital_Front_knee_L(i)=Knee_Angle_L(i);

elseif (Tangential_Crank_Angle_L(i)>Tangenital_180(:,1) && Tangential_Crank_Angle_L(i)< Tangenital_0_360(:,2))
Tangenital_Back_knee_L(i)=Knee_Angle_L(i);
   
end
end
Tangenital_Front_knee_L=Tangenital_Front_knee_L(Tangenital_Front_knee_L~=0);
Tangenital_Back_knee_L=Tangenital_Back_knee_L(Tangenital_Back_knee_L~=0);
Tangenital_Front_knee_L=Tangenital_Front_knee_L';
Tangenital_Back_knee_L=Tangenital_Back_knee_L';

% Right knee %

for i=1:size(Tangential_Crank_Angle_R)
if (Tangential_Crank_Angle_R(i)>Tangenital_0_360(:,1) && Tangential_Crank_Angle_R(i)< Tangenital_180(:,1))
Tangenital_Front_knee_R(i)=Knee_Angle_R(i);

elseif (Tangential_Crank_Angle_R(i)>Tangenital_180(:,1) && Tangential_Crank_Angle_R(i)< Tangenital_0_360(:,2))
Tangenital_Back_knee_R(i)=Knee_Angle_R(i);
end
end

Tangenital_Front_knee_R=Tangenital_Front_knee_R(Tangenital_Front_knee_R~=0);
Tangenital_Back_knee_R=Tangenital_Back_knee_R(Tangenital_Back_knee_R~=0);
Tangenital_Front_knee_R=Tangenital_Front_knee_R';
Tangenital_Back_knee_R=Tangenital_Back_knee_R';

% Left ankle %

for i=1:size(Tangential_Crank_Angle_L)
if (Tangential_Crank_Angle_L(i)>Tangenital_0_360(:,1) && Tangential_Crank_Angle_L(i)< Tangenital_180(:,1))
  Tangenital_Front_ankle_L(i)=Ankle_Angle_L(i);

elseif (Tangential_Crank_Angle_L(i)>Tangenital_180(:,1) && Tangential_Crank_Angle_L(i)< Tangenital_0_360(:,2))
    Tangenital_Back_ankle_L(i)=Ankle_Angle_L(i);
end
end

Tangenital_Front_ankle_L=Tangenital_Front_ankle_L(Tangenital_Front_ankle_L~=0);
Tangenital_Back_ankle_L=Tangenital_Back_ankle_L(Tangenital_Back_ankle_L~=0);
Tangenital_Front_ankle_L=Tangenital_Front_ankle_L';
Tangenital_Back_ankle_L=Tangenital_Back_ankle_L';

% right ankle %

for i=1:size(Tangential_Crank_Angle_R)
if (Tangential_Crank_Angle_R(i)>Tangenital_0_360(:,1) && Tangential_Crank_Angle_R(i)< Tangenital_180(:,1))
Tangenital_Front_ankle_R(i)=Ankle_Angle_R(i);

elseif (Tangential_Crank_Angle_R(i)>Tangenital_180(:,1) && Tangential_Crank_Angle_R(i)< Tangenital_0_360(:,2))
Tangenital_Back_ankle_R(i)=Ankle_Angle_R(i);
end
end

Tangenital_Front_ankle_R=Tangenital_Front_ankle_R(Tangenital_Front_ankle_R~=0);
Tangenital_Back_ankle_R=Tangenital_Back_ankle_R(Tangenital_Back_ankle_R~=0);
Tangenital_Front_ankle_R=Tangenital_Front_ankle_R';
Tangenital_Back_ankle_R=Tangenital_Back_ankle_R';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pause (0.5)
% Find Angular Velocity %
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Left hip %

Hip_Angle_velocity_L_max=max(Hip_Angle_velocity_L);
Hip_Angle_velocity_L_max=Hip_Angle_velocity_L_max-5;
Hip_Angle_velocity_L_min=min(Hip_Angle_velocity_L);
Hip_Angle_velocity_L_min=Hip_Angle_velocity_L_min+5;

if Cadence>=102
[Hip_Angle_velocity_L_Max_val19, idx300]=findpeaks(Hip_Angle_velocity_L,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Hip_Angle_velocity_L_Max_val20, idx301]=findpeaks(Hip_Angle_velocity_L*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Hip_Angle_velocity_L_Max_val19, idx300]=findpeaks(Hip_Angle_velocity_L,Fs,'MinPeakDistance',1); 
[Hip_Angle_velocity_L_Max_val20, idx301]=findpeaks(Hip_Angle_velocity_L*-1,Fs,'MinPeakDistance',1);
end

Hip_Angle_velocity_L_Max_val20=Hip_Angle_velocity_L_Max_val20*-1;
%   
for i=1:size(Hip_Angle_velocity_L_Max_val19)
    if Hip_Angle_velocity_L_Max_val19(i) < Hip_Angle_velocity_L_max
   Hip_Angle_velocity_L_Max_val19(i)=0;
    idx300(i)=0;
     end
end
Hip_Angle_velocity_L_Max_val19=Hip_Angle_velocity_L_Max_val19(max(Hip_Angle_velocity_L_Max_val19~=0,[],2),:);
idx300=idx300(max(idx300~=0,[],2),:);

for i=1:size(Hip_Angle_velocity_L_Max_val20)
if Hip_Angle_velocity_L_Max_val20(i) > Hip_Angle_velocity_L_min
    Hip_Angle_velocity_L_Max_val20(i)=0;
    idx301(i)=0;
end
end
Hip_Angle_velocity_L_Max_val20=Hip_Angle_velocity_L_Max_val20(max(Hip_Angle_velocity_L_Max_val20~=0,[],2),:);
idx301=idx301(max(idx301~=0,[],2),:);

Hip_Angle_velocity_L_Max_val=Hip_Angle_velocity_L_Max_val19;
Hip_Angle_velocity_L_Min_val=Hip_Angle_velocity_L_Max_val20;

% Right Hip %

Hip_Angle_velocity_R_max=max(Hip_Angle_velocity_R);
Hip_Angle_velocity_R_max=Hip_Angle_velocity_R_max-5;
Hip_Angle_velocity_R_min=min(Hip_Angle_velocity_R);
Hip_Angle_velocity_R_min=Hip_Angle_velocity_R_min+5;

if Cadence>=102
[Hip_Angle_velocity_R_Max_val19, idx302]=findpeaks(Hip_Angle_velocity_R,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Hip_Angle_velocity_R_Max_val20, idx303]=findpeaks(Hip_Angle_velocity_R*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Hip_Angle_velocity_R_Max_val19, idx302]=findpeaks(Hip_Angle_velocity_R,Fs,'MinPeakDistance',1); 
[Hip_Angle_velocity_R_Max_val20, idx303]=findpeaks(Hip_Angle_velocity_R*-1,Fs,'MinPeakDistance',1);
end

Hip_Angle_velocity_R_Max_val20=Hip_Angle_velocity_R_Max_val20*-1;
% 
for i=1:size(Hip_Angle_velocity_R_Max_val19)
    if Hip_Angle_velocity_R_Max_val19(i) < Hip_Angle_velocity_R_max
   Hip_Angle_velocity_R_Max_val19(i)=0;
    idx302(i)=0;
     end
end
Hip_Angle_velocity_R_Max_val19=Hip_Angle_velocity_R_Max_val19(max(Hip_Angle_velocity_R_Max_val19~=0,[],2),:);
idx302=idx302(max(idx302~=0,[],2),:);

for i=1:size(Hip_Angle_velocity_R_Max_val20)
if Hip_Angle_velocity_R_Max_val20(i) > Hip_Angle_velocity_R_min
    Hip_Angle_velocity_R_Max_val20(i)=0;
    idx303(i)=0;
end
end
Hip_Angle_velocity_R_Max_val20=Hip_Angle_velocity_R_Max_val20(max(Hip_Angle_velocity_R_Max_val20~=0,[],2),:);
idx303=idx303(max(idx303~=0,[],2),:);

Hip_Angle_velocity_R_Max_val=Hip_Angle_velocity_R_Max_val19;
Hip_Angle_velocity_R_Min_val=Hip_Angle_velocity_R_Max_val20;

 % Left knee % 
Knee_Angle_velocity_L_max=max(Knee_Angle_velocity_L);
Knee_Angle_velocity_L_max=Knee_Angle_velocity_L_max-5;
Knee_Angle_velocity_L_min=min(Knee_Angle_velocity_L);
Kee_Angle_velocity_L_min=Knee_Angle_velocity_L_min+5;

if Cadence>=102
[Knee_Angle_velocity_L_Max_val19, idx304]=findpeaks(Knee_Angle_velocity_L,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Knee_Angle_velocity_L_Max_val20, idx305]=findpeaks(Knee_Angle_velocity_L*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Knee_Angle_velocity_L_Max_val19, idx304]=findpeaks(Knee_Angle_velocity_L,Fs,'MinPeakDistance',1); 
[Knee_Angle_velocity_L_Max_val20, idx305]=findpeaks(Knee_Angle_velocity_L*-1,Fs,'MinPeakDistance',1);
end

Knee_Angle_velocity_L_Max_val20=Knee_Angle_velocity_L_Max_val20*-1;
% 
for i=1:size(Knee_Angle_velocity_L_Max_val19)
    if Knee_Angle_velocity_L_Max_val19(i) < Knee_Angle_velocity_L_max
   Knee_Angle_velocity_L_Max_val19(i)=0;
    idx304(i)=0;
     end
end
Knee_Angle_velocity_L_Max_val19=Knee_Angle_velocity_L_Max_val19(max(Knee_Angle_velocity_L_Max_val19~=0,[],2),:);
idx304=idx304(max(idx304~=0,[],2),:);

for i=1:size(Knee_Angle_velocity_L_Max_val20)
if Knee_Angle_velocity_L_Max_val20(i) > Kee_Angle_velocity_L_min
    Knee_Angle_velocity_L_Max_val20(i)=0;
    idx305(i)=0;
end
end
Knee_Angle_velocity_L_Max_val20=Knee_Angle_velocity_L_Max_val20(max(Knee_Angle_velocity_L_Max_val20~=0,[],2),:);
idx305=idx305(max(idx305~=0,[],2),:);



Knee_Angle_velocity_L_Max_val=Knee_Angle_velocity_L_Max_val19;
Knee_Angle_velocity_L_Min_val=Knee_Angle_velocity_L_Max_val20;

% Right knee %
Knee_Angle_velocity_R_max=max(Knee_Angle_velocity_R);
Knee_Angle_velocity_R_max=Knee_Angle_velocity_R_max-5;
Knee_Angle_velocity_R_min=min(Knee_Angle_velocity_R);
Kee_Angle_velocity_R_min=Knee_Angle_velocity_R_min+5;

if Cadence>=102
[Knee_Angle_velocity_R_Max_val19, idx306]=findpeaks(Knee_Angle_velocity_R,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Knee_Angle_velocity_R_Max_val20, idx307]=findpeaks(Knee_Angle_velocity_R*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Knee_Angle_velocity_R_Max_val19, idx306]=findpeaks(Knee_Angle_velocity_R,Fs,'MinPeakDistance',1); 
[Knee_Angle_velocity_R_Max_val20, idx307]=findpeaks(Knee_Angle_velocity_R*-1,Fs,'MinPeakDistance',1);
end

Knee_Angle_velocity_R_Max_val20=Knee_Angle_velocity_R_Max_val20*-1;
% 
for i=1:size(Knee_Angle_velocity_R_Max_val19)
    if Knee_Angle_velocity_R_Max_val19(i) < Knee_Angle_velocity_R_max
   Knee_Angle_velocity_R_Max_val19(i)=0;
    idx306(i)=0;
     end
end
Knee_Angle_velocity_R_Max_val19=Knee_Angle_velocity_R_Max_val19(max(Knee_Angle_velocity_R_Max_val19~=0,[],2),:);
idx306=idx306(max(idx306~=0,[],2),:);

for i=1:size(Knee_Angle_velocity_R_Max_val20)
if Knee_Angle_velocity_R_Max_val20(i) > Kee_Angle_velocity_R_min
    Knee_Angle_velocity_R_Max_val20(i)=0;
    idx307(i)=0;
end
end
Knee_Angle_velocity_R_Max_val20=Knee_Angle_velocity_R_Max_val20(max(Knee_Angle_velocity_R_Max_val20~=0,[],2),:);
idx307=idx307(max(idx307~=0,[],2),:);

Knee_Angle_velocity_R_Max_val=Knee_Angle_velocity_R_Max_val19;
Knee_Angle_velocity_R_Min_val=Knee_Angle_velocity_R_Max_val20;

% Left ankle %

Ankle_Angle_velocity_L_max=max(Ankle_Angle_velocity_L);
Ankle_Angle_velocity_L_max=Ankle_Angle_velocity_L_max-5;
Ankle_Angle_velocity_L_min=min(Ankle_Angle_velocity_L);
Ankle_Angle_velocity_L_min=Ankle_Angle_velocity_L_min+5;

if Cadence>=102
[Ankle_Angle_velocity_L_Max_val19, idx308]=findpeaks(Ankle_Angle_velocity_L,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Ankle_Angle_velocity_L_Max_val20, idx309]=findpeaks(Ankle_Angle_velocity_L*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Ankle_Angle_velocity_L_Max_val19, idx308]=findpeaks(Ankle_Angle_velocity_L,Fs,'MinPeakDistance',1); 
[Ankle_Angle_velocity_L_Max_val20, idx309]=findpeaks(Ankle_Angle_velocity_L*-1,Fs,'MinPeakDistance',1);
end

Ankle_Angle_velocity_L_Max_val20=Ankle_Angle_velocity_L_Max_val20*-1;
% 
for i=1:size(Ankle_Angle_velocity_L_Max_val19)
    if Ankle_Angle_velocity_L_Max_val19(i) < Ankle_Angle_velocity_L_max
   Ankle_Angle_velocity_L_Max_val19(i)=0;
    idx308(i)=0;
     end
end
Ankle_Angle_velocity_L_Max_val19=Ankle_Angle_velocity_L_Max_val19(max(Ankle_Angle_velocity_L_Max_val19~=0,[],2),:);
idx308=idx308(max(idx308~=0,[],2),:);

for i=1:size(Ankle_Angle_velocity_L_Max_val20)
if Ankle_Angle_velocity_L_Max_val20(i) > Ankle_Angle_velocity_L_min
    Ankle_Angle_velocity_L_Max_val20(i)=0;
    idx309(i)=0;
end
end
Ankle_Angle_velocity_L_Max_val20=Ankle_Angle_velocity_L_Max_val20(max(Ankle_Angle_velocity_L_Max_val20~=0,[],2),:);
idx309=idx309(max(idx309~=0,[],2),:);



Ankle_Angle_velocity_L_Max_val=Ankle_Angle_velocity_L_Max_val19;
Ankle_Angle_velocity_L_Min_val=Ankle_Angle_velocity_L_Max_val20;

% Right Ankle %

Ankle_Angle_velocity_R_max=max(Ankle_Angle_velocity_R);
Ankle_Angle_velocity_R_max=Ankle_Angle_velocity_R_max-5;
Ankle_Angle_velocity_R_min=min(Ankle_Angle_velocity_R);
Ankle_Angle_velocity_R_min=Ankle_Angle_velocity_R_min+5;

if Cadence>=102
[Ankle_Angle_velocity_R_Max_val19, idx310]=findpeaks(Ankle_Angle_velocity_R,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Ankle_Angle_velocity_R_Max_val20, idx311]=findpeaks(Ankle_Angle_velocity_R*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Ankle_Angle_velocity_R_Max_val19, idx310]=findpeaks(Ankle_Angle_velocity_R,Fs,'MinPeakDistance',1); 
[Ankle_Angle_velocity_R_Max_val20, idx311]=findpeaks(Ankle_Angle_velocity_R*-1,Fs,'MinPeakDistance',1);
end

Ankle_Angle_velocity_R_Max_val20=Ankle_Angle_velocity_R_Max_val20*-1;
% 
for i=1:size(Ankle_Angle_velocity_R_Max_val19)
    if Ankle_Angle_velocity_R_Max_val19(i) < Ankle_Angle_velocity_R_max
   Ankle_Angle_velocity_R_Max_val19(i)=0;
    idx310(i)=0;
     end
end
Ankle_Angle_velocity_R_Max_val19=Ankle_Angle_velocity_R_Max_val19(max(Ankle_Angle_velocity_R_Max_val19~=0,[],2),:);
idx310=idx310(max(idx310~=0,[],2),:);

for i=1:size(Ankle_Angle_velocity_R_Max_val20)
if Ankle_Angle_velocity_R_Max_val20(i) > Ankle_Angle_velocity_R_min
    Ankle_Angle_velocity_R_Max_val20(i)=0;
    idx311(i)=0;
end
end
Ankle_Angle_velocity_R_Max_val20=Ankle_Angle_velocity_R_Max_val20(max(Ankle_Angle_velocity_R_Max_val20~=0,[],2),:);
idx311=idx311(max(idx311~=0,[],2),:);

Ankle_Angle_velocity_R_Max_val=Ankle_Angle_velocity_R_Max_val19;
Ankle_Angle_velocity_R_Min_val=Ankle_Angle_velocity_R_Max_val20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tangential Angular velocity %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% negative = anticlockwise, positive = clockwise moving angle (i.e hip
% extension =negative, hip flexion = positive

for q=1:size(Tangential_Crank_Angle_L)
if (Tangential_Crank_Angle_L(q,1)>0&& Tangential_Crank_Angle_L(q,1)<180)

Tangenital_Vel_Front_hip_L(q,1)=Hip_Angle_velocity_L(q,1);
Tangenital_Vel_Front_knee_L(q,1)=Knee_Angle_velocity_L(q,1);
Tangenital_Vel_Front_ankle_L(q,1)=Ankle_Angle_velocity_L(q,1);
    elseif (Tangential_Crank_Angle_L(q,1)>=180 && Tangential_Crank_Angle_L(q,1)<360)
Tangenital_Vel_Back_hip_L(q,1)=Hip_Angle_velocity_L(q,1);
Tangenital_Vel_Back_knee_L(q,1)=Knee_Angle_velocity_L(q,1);
Tangenital_Vel_Back_ankle_L(q,1)=Ankle_Angle_velocity_L(q,1);
end
end


for q=1:size(Tangential_Crank_Angle_R)
if (Tangential_Crank_Angle_R(q,1)>0&& Tangential_Crank_Angle_R(q,1)<180)

Tangenital_Vel_Front_hip_R(q,1)=Hip_Angle_velocity_R(q,1);
Tangenital_Vel_Front_knee_R(q,1)=Knee_Angle_velocity_R(q,1);
Tangenital_Vel_Front_ankle_R(q,1)=Ankle_Angle_velocity_R(q,1);
    elseif (Tangential_Crank_Angle_R(q,1)>=180 && Tangential_Crank_Angle_R(q,1)<360)
Tangenital_Vel_Back_hip_R(q,1)=Hip_Angle_velocity_R(q,1);
Tangenital_Vel_Back_knee_R(q,1)=Knee_Angle_velocity_R(q,1);
Tangenital_Vel_Back_ankle_R(q,1)=Ankle_Angle_velocity_R(q,1);
end
end

for w=1:size(Tangenital_Vel_Front_hip_L)-1
if Tangenital_Vel_Front_hip_L(w+1,1)>=Tangenital_Vel_Front_hip_L(w,1)
    
Tangenital_Vel_Front_hip_negative_up_L(w,1)=Tangenital_Vel_Front_hip_L(w,1);
Tangenital_Vel_Front_knee_negative_up_L(w,1)=Tangenital_Vel_Front_knee_L(w,1);
Tangenital_Vel_Front_ankle_negative_up_L(w,1)=Tangenital_Vel_Front_ankle_L(w,1);
elseif Tangenital_Vel_Front_hip_L(w+1,1)<Tangenital_Vel_Front_hip_L(w,1)
Tangenital_Vel_Front_hip_negative_down_L(w,1)=Tangenital_Vel_Front_hip_L(w,1);
Tangenital_Vel_Front_knee_negative_down_L(w,1)=Tangenital_Vel_Front_knee_L(w,1);
Tangenital_Vel_Front_ankle_negative_down_L(w,1)=Tangenital_Vel_Front_ankle_L(w,1);
end
end

for w=1:size(Tangenital_Vel_Front_hip_R)-1
if Tangenital_Vel_Front_hip_R(w+1,1)>=Tangenital_Vel_Front_hip_R(w,1)
    
 Tangenital_Vel_Front_hip_negative_up_R(w,1)=Tangenital_Vel_Front_hip_R(w,1);
Tangenital_Vel_Front_knee_negative_up_R(w,1)=Tangenital_Vel_Front_knee_R(w,1);
Tangenital_Vel_Front_ankle_negative_up_R(w,1)=Tangenital_Vel_Front_ankle_R(w,1);

elseif Tangenital_Vel_Front_hip_R(w+1,1)<Tangenital_Vel_Front_hip_R(w,1)

Tangenital_Vel_Front_hip_negative_down_R(w,1)=Tangenital_Vel_Front_hip_R(w,1);
Tangenital_Vel_Front_knee_negative_down_R(w,1)=Tangenital_Vel_Front_knee_R(w,1);
Tangenital_Vel_Front_ankle_negative_down_R(w,1)=Tangenital_Vel_Front_ankle_R(w,1);

end
end

for e=1:size(Tangenital_Vel_Back_hip_L)-1
if Tangenital_Vel_Back_hip_L(e+1,1)>Tangenital_Vel_Back_hip_L(e,1)
    
Tangenital_Vel_Back_hip_positive_up_L(e,1)=Tangenital_Vel_Back_hip_L(e,1);
Tangenital_Vel_Back_knee_positive_up_L(e,1)=Tangenital_Vel_Back_knee_L(e,1);
Tangenital_Vel_Back_ankle_positive_up_L(e,1)=Tangenital_Vel_Back_ankle_L(e,1);

elseif Tangenital_Vel_Back_hip_L(e+1,1)<Tangenital_Vel_Back_hip_L(e,1)
    
Tangenital_Vel_Back_hip_positive_down_L(e,1)=Tangenital_Vel_Back_hip_L(e,1);
Tangenital_Vel_Back_knee_positive_down_L(e,1)=Tangenital_Vel_Back_knee_L(e,1);
Tangenital_Vel_Back_ankle_positive_down_L(e,1)=Tangenital_Vel_Back_ankle_L(e,1);

end
end

for e=1:size(Tangenital_Vel_Back_hip_R)-1
if Tangenital_Vel_Back_hip_R(e+1,1)>Tangenital_Vel_Back_hip_R(e,1)
    
Tangenital_Vel_Back_hip_positive_up_R(e,1)=Tangenital_Vel_Back_hip_R(e,1);
Tangenital_Vel_Back_knee_positive_up_R(e,1)=Tangenital_Vel_Back_knee_R(e,1);
Tangenital_Vel_Back_ankle_positive_up_R(e,1)=Tangenital_Vel_Back_ankle_R(e,1);

elseif Tangenital_Vel_Back_hip_R(e+1,1)<Tangenital_Vel_Back_hip_R(e,1)
    
Tangenital_Vel_Back_hip_positive_down_R(e,1)=Tangenital_Vel_Back_hip_R(e,1);
Tangenital_Vel_Back_knee_positive_down_R(e,1)=Tangenital_Vel_Back_knee_R(e,1);
Tangenital_Vel_Back_ankle_positive_down_R(e,1)=Tangenital_Vel_Back_ankle_R(e,1);

end
end

Tangenital_Vel_Front_hip_negative_up_L=Tangenital_Vel_Front_hip_negative_up_L(Tangenital_Vel_Front_hip_negative_up_L~=0);
Tangenital_Vel_Front_hip_negative_down_L=Tangenital_Vel_Front_hip_negative_down_L(Tangenital_Vel_Front_hip_negative_down_L~=0);
Tangenital_Vel_Back_hip_positive_up_L=Tangenital_Vel_Back_hip_positive_up_L(Tangenital_Vel_Back_hip_positive_up_L~=0);
Tangenital_Vel_Back_hip_positive_down_L=Tangenital_Vel_Back_hip_positive_down_L(Tangenital_Vel_Back_hip_positive_down_L~=0);
Tangenital_Vel_Back_hip_positive_up_R=Tangenital_Vel_Back_hip_positive_up_R(Tangenital_Vel_Back_hip_positive_up_R~=0);
Tangenital_Vel_Back_hip_positive_down_R=Tangenital_Vel_Back_hip_positive_down_R(Tangenital_Vel_Back_hip_positive_down_R~=0);
Tangenital_Vel_Front_hip_negative_up_R=Tangenital_Vel_Front_hip_negative_up_R(Tangenital_Vel_Front_hip_negative_up_R~=0);
Tangenital_Vel_Front_hip_negative_down_R=Tangenital_Vel_Front_hip_negative_down_R(Tangenital_Vel_Front_hip_negative_down_R~=0);
Tangenital_Vel_Front_knee_negative_up_L=Tangenital_Vel_Front_knee_negative_up_L(Tangenital_Vel_Front_knee_negative_up_L~=0);
Tangenital_Vel_Front_knee_negative_down_L=Tangenital_Vel_Front_knee_negative_down_L(Tangenital_Vel_Front_knee_negative_down_L~=0);
Tangenital_Vel_Back_knee_positive_up_L=Tangenital_Vel_Back_knee_positive_up_L(Tangenital_Vel_Back_knee_positive_up_L~=0);
Tangenital_Vel_Back_knee_positive_down_L=Tangenital_Vel_Back_knee_positive_down_L(Tangenital_Vel_Back_knee_positive_down_L~=0);
Tangenital_Vel_Back_knee_positive_up_R=Tangenital_Vel_Back_knee_positive_up_R(Tangenital_Vel_Back_knee_positive_up_R~=0);
Tangenital_Vel_Back_knee_positive_down_R=Tangenital_Vel_Back_knee_positive_down_R(Tangenital_Vel_Back_knee_positive_down_R~=0);
Tangenital_Vel_Front_knee_negative_up_R=Tangenital_Vel_Front_knee_negative_up_R(Tangenital_Vel_Front_knee_negative_up_R~=0);
Tangenital_Vel_Front_knee_negative_down_R=Tangenital_Vel_Front_knee_negative_down_R(Tangenital_Vel_Front_knee_negative_down_R~=0);
Tangenital_Vel_Front_ankle_negative_up_L=Tangenital_Vel_Front_ankle_negative_up_L(Tangenital_Vel_Front_ankle_negative_up_L~=0);
Tangenital_Vel_Front_ankle_negative_down_L=Tangenital_Vel_Front_ankle_negative_down_L(Tangenital_Vel_Front_ankle_negative_down_L~=0);
Tangenital_Vel_Back_ankle_positive_up_L=Tangenital_Vel_Back_ankle_positive_up_L(Tangenital_Vel_Back_ankle_positive_up_L~=0);
Tangenital_Vel_Back_ankle_positive_down_L=Tangenital_Vel_Back_ankle_positive_down_L(Tangenital_Vel_Back_ankle_positive_down_L~=0);
Tangenital_Vel_Back_ankle_positive_up_R=Tangenital_Vel_Back_ankle_positive_up_R(Tangenital_Vel_Back_ankle_positive_up_R~=0);
Tangenital_Vel_Back_ankle_positive_down_R=Tangenital_Vel_Back_ankle_positive_down_R(Tangenital_Vel_Back_ankle_positive_down_R~=0);
Tangenital_Vel_Front_ankle_negative_up_R=Tangenital_Vel_Front_ankle_negative_up_R(Tangenital_Vel_Front_ankle_negative_up_R~=0);
Tangenital_Vel_Front_ankle_negative_down_R=Tangenital_Vel_Front_ankle_negative_down_R(Tangenital_Vel_Front_ankle_negative_down_R~=0);

Tangenital_Vel_Front_hip_negative_up_L=mean(Tangenital_Vel_Front_hip_negative_up_L);
Tangenital_Vel_Front_hip_negative_down_L=mean(Tangenital_Vel_Front_hip_negative_down_L);
Tangenital_Vel_Back_hip_positive_up_L=mean (Tangenital_Vel_Back_hip_positive_up_L);
Tangenital_Vel_Back_hip_positive_down_L=mean(Tangenital_Vel_Back_hip_positive_down_L);
Tangenital_Vel_Back_hip_positive_up_R=mean (Tangenital_Vel_Back_hip_positive_up_R);
Tangenital_Vel_Back_hip_positive_down_R=mean(Tangenital_Vel_Back_hip_positive_down_R);
Tangenital_Vel_Front_hip_negative_up_R=mean (Tangenital_Vel_Front_hip_negative_up_R);
Tangenital_Vel_Front_hip_negative_down_R=mean(Tangenital_Vel_Front_hip_negative_down_R);
Tangenital_Vel_Front_knee_negative_up_L=mean (Tangenital_Vel_Front_knee_negative_up_L);
Tangenital_Vel_Front_knee_negative_down_L=mean(Tangenital_Vel_Front_knee_negative_down_L);
Tangenital_Vel_Back_knee_positive_up_L=mean (Tangenital_Vel_Back_knee_positive_up_L);
Tangenital_Vel_Back_knee_positive_down_L=mean(Tangenital_Vel_Back_knee_positive_down_L);
Tangenital_Vel_Back_knee_positive_up_R=mean (Tangenital_Vel_Back_knee_positive_up_R);
Tangenital_Vel_Back_knee_positive_down_R=mean(Tangenital_Vel_Back_knee_positive_down_R);
Tangenital_Vel_Front_knee_negative_up_R=mean (Tangenital_Vel_Front_knee_negative_up_R);
Tangenital_Vel_Front_knee_negative_down_R=mean(Tangenital_Vel_Front_knee_negative_down_R);
Tangenital_Vel_Front_ankle_negative_up_L=mean (Tangenital_Vel_Front_ankle_negative_up_L);
Tangenital_Vel_Front_ankle_negative_down_L=mean(Tangenital_Vel_Front_ankle_negative_down_L);
Tangenital_Vel_Back_ankle_positive_up_L=mean (Tangenital_Vel_Back_ankle_positive_up_L);
Tangenital_Vel_Back_ankle_positive_down_L=mean(Tangenital_Vel_Back_ankle_positive_down_L);
Tangenital_Vel_Back_ankle_positive_up_R=mean (Tangenital_Vel_Back_ankle_positive_up_R);
Tangenital_Vel_Back_ankle_positive_down_R=mean(Tangenital_Vel_Back_ankle_positive_down_R);
Tangenital_Vel_Front_ankle_negative_up_R=mean (Tangenital_Vel_Front_ankle_negative_up_R);
Tangenital_Vel_Front_ankle_negative_down_R=mean(Tangenital_Vel_Front_ankle_negative_down_R);


Tangenital_Vel_Front_hip_L=Tangenital_Vel_Front_hip_L(Tangenital_Vel_Front_hip_L~=0);
Tangenital_Vel_Back_hip_L=Tangenital_Vel_Back_hip_L(Tangenital_Vel_Back_hip_L~=0);
Tangenital_Vel_Front_hip_L=Tangenital_Vel_Front_hip_L';
Tangenital_Vel_Back_hip_L=Tangenital_Vel_Back_hip_L';

Tangenital_Vel_Front_hip_R=Tangenital_Vel_Front_hip_R(Tangenital_Vel_Front_hip_R~=0);
Tangenital_Vel_Back_hip_R=Tangenital_Vel_Back_hip_R(Tangenital_Vel_Back_hip_R~=0);
Tangenital_Vel_Front_hip_R=Tangenital_Vel_Front_hip_R';
Tangenital_Vel_Back_hip_R=Tangenital_Vel_Back_hip_R';

Tangenital_Vel_Front_knee_L=Tangenital_Vel_Front_knee_L(Tangenital_Vel_Front_knee_L~=0);
Tangenital_Vel_Back_knee_L=Tangenital_Vel_Back_knee_L(Tangenital_Vel_Back_knee_L~=0);
Tangenital_Vel_Front_knee_L=Tangenital_Vel_Front_knee_L';
Tangenital_Vel_Back_knee_L=Tangenital_Vel_Back_knee_L';

Tangenital_Vel_Front_knee_R=Tangenital_Vel_Front_knee_R(Tangenital_Vel_Front_knee_R~=0);
Tangenital_Vel_Back_knee_R=Tangenital_Vel_Back_knee_R(Tangenital_Vel_Back_knee_R~=0);
Tangenital_Vel_Front_knee_R=Tangenital_Vel_Front_knee_R';
Tangenital_Vel_Back_knee_R=Tangenital_Vel_Back_knee_R';

Tangenital_Vel_Front_ankle_L=Tangenital_Vel_Front_ankle_L(Tangenital_Vel_Front_ankle_L~=0);
Tangenital_Vel_Back_ankle_L=Tangenital_Vel_Back_ankle_L(Tangenital_Vel_Back_ankle_L~=0);
Tangenital_Vel_Front_ankle_L=Tangenital_Vel_Front_ankle_L';
Tangenital_Vel_Back_ankle_L=Tangenital_Vel_Back_ankle_L';

Tangenital_Vel_Front_ankle_R=Tangenital_Vel_Front_ankle_R(Tangenital_Vel_Front_ankle_R~=0);
Tangenital_Vel_Back_ankle_R=Tangenital_Vel_Back_ankle_R(Tangenital_Vel_Back_ankle_R~=0);
Tangenital_Vel_Front_ankle_R=Tangenital_Vel_Front_ankle_R';
Tangenital_Vel_Back_ankle_R=Tangenital_Vel_Back_ankle_R';


if Cadence>=102
[Hip_Tangential_Velocity_L_Max_val19, idx500]=findpeaks(Tangenital_Vel_Back_hip_L,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Velocity_L_Max_val20, idx501]=findpeaks(Tangenital_Vel_Back_hip_L*-1,Fs,'MinPeakDistance',0.3);

[Hip_Tangential_Velocity_L_Max_val21, idx500]=findpeaks(Tangenital_Vel_Front_hip_L,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Velocity_L_Max_val22, idx501]=findpeaks(Tangenital_Vel_Front_hip_L*-1,Fs,'MinPeakDistance',0.3);

[Hip_Tangential_Velocity_R_Max_val23, idx500]=findpeaks(Tangenital_Vel_Back_hip_R,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Velocity_R_Max_val24, idx501]=findpeaks(Tangenital_Vel_Back_hip_R*-1,Fs,'MinPeakDistance',0.3);

[Hip_Tangential_Velocity_R_Max_val25, idx500]=findpeaks(Tangenital_Vel_Front_hip_R,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Velocity_R_Max_val26, idx501]=findpeaks(Tangenital_Vel_Front_hip_R*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Velocity_L_Max_val19, idx500]=findpeaks(Tangenital_Vel_Back_knee_L,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Velocity_L_Max_val20, idx501]=findpeaks(Tangenital_Vel_Back_knee_L*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Velocity_L_Max_val21, idx500]=findpeaks(Tangenital_Vel_Front_knee_L,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Velocity_L_Max_val22, idx501]=findpeaks(Tangenital_Vel_Front_knee_L*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Velocity_R_Max_val23, idx500]=findpeaks(Tangenital_Vel_Back_knee_R,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Velocity_R_Max_val24, idx501]=findpeaks(Tangenital_Vel_Back_knee_R*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Velocity_R_Max_val25, idx500]=findpeaks(Tangenital_Vel_Front_knee_R,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Velocity_R_Max_val26, idx501]=findpeaks(Tangenital_Vel_Front_knee_R*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Velocity_L_Max_val19, idx500]=findpeaks(Tangenital_Vel_Back_ankle_L,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Velocity_L_Max_val20, idx501]=findpeaks(Tangenital_Vel_Back_ankle_L*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Velocity_L_Max_val21, idx500]=findpeaks(Tangenital_Vel_Front_ankle_L,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Velocity_L_Max_val22, idx501]=findpeaks(Tangenital_Vel_Front_ankle_L*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Velocity_R_Max_val23, idx500]=findpeaks(Tangenital_Vel_Back_ankle_R,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Velocity_R_Max_val24, idx501]=findpeaks(Tangenital_Vel_Back_ankle_R*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Velocity_R_Max_val25, idx500]=findpeaks(Tangenital_Vel_Front_ankle_R,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Velocity_R_Max_val26, idx501]=findpeaks(Tangenital_Vel_Front_ankle_R*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Hip_Tangential_Velocity_L_Max_val19, idx500]=findpeaks(Tangenital_Vel_Back_hip_L,Fs,'MinPeakDistance',1); 
[Hip_Tangential_Velocity_L_Max_val20, idx501]=findpeaks(Tangenital_Vel_Back_hip_L*-1,Fs,'MinPeakDistance',1);

[Hip_Tangential_Velocity_L_Max_val21, idx500]=findpeaks(Tangenital_Vel_Front_hip_L,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Velocity_L_Max_val22, idx501]=findpeaks(Tangenital_Vel_Front_hip_L*-1,Fs,'MinPeakDistance',0.3);

[Hip_Tangential_Velocity_R_Max_val23, idx500]=findpeaks(Tangenital_Vel_Back_hip_R,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Velocity_R_Max_val24, idx501]=findpeaks(Tangenital_Vel_Back_hip_R*-1,Fs,'MinPeakDistance',0.3);

[Hip_Tangential_Velocity_R_Max_val25, idx500]=findpeaks(Tangenital_Vel_Front_hip_R,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Velocity_R_Max_val26, idx501]=findpeaks(Tangenital_Vel_Front_hip_R*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Velocity_L_Max_val19, idx500]=findpeaks(Tangenital_Vel_Back_knee_L,Fs,'MinPeakDistance',1); 
[Knee_Tangential_Velocity_L_Max_val20, idx501]=findpeaks(Tangenital_Vel_Back_knee_L*-1,Fs,'MinPeakDistance',1);

[Knee_Tangential_Velocity_L_Max_val21, idx500]=findpeaks(Tangenital_Vel_Front_knee_L,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Velocity_L_Max_val22, idx501]=findpeaks(Tangenital_Vel_Front_knee_L*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Velocity_R_Max_val23, idx500]=findpeaks(Tangenital_Vel_Back_knee_R,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Velocity_R_Max_val24, idx501]=findpeaks(Tangenital_Vel_Back_knee_R*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Velocity_R_Max_val25, idx500]=findpeaks(Tangenital_Vel_Front_knee_R,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Velocity_R_Max_val26, idx501]=findpeaks(Tangenital_Vel_Front_knee_R*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Velocity_L_Max_val19, idx500]=findpeaks(Tangenital_Vel_Back_ankle_L,Fs,'MinPeakDistance',1); 
[Ankle_Tangential_Velocity_L_Max_val20, idx501]=findpeaks(Tangenital_Vel_Back_ankle_L*-1,Fs,'MinPeakDistance',1);

[Ankle_Tangential_Velocity_L_Max_val21, idx500]=findpeaks(Tangenital_Vel_Front_ankle_L,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Velocity_L_Max_val22, idx501]=findpeaks(Tangenital_Vel_Front_ankle_L*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Velocity_R_Max_val23, idx500]=findpeaks(Tangenital_Vel_Back_ankle_R,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Velocity_R_Max_val24, idx501]=findpeaks(Tangenital_Vel_Back_ankle_R*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Velocity_R_Max_val25, idx500]=findpeaks(Tangenital_Vel_Front_ankle_R,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Velocity_R_Max_val26, idx501]=findpeaks(Tangenital_Vel_Front_ankle_R*-1,Fs,'MinPeakDistance',0.3);

end
Hip_Tangential_Velocity_L_Max_val20=Hip_Tangential_Velocity_L_Max_val20*-1;
Hip_Tangential_Velocity_L_Max_val22=Hip_Tangential_Velocity_L_Max_val22*-1;

Hip_Tangential_Velocity_R_Max_val24=Hip_Tangential_Velocity_R_Max_val24*-1;
Hip_Tangential_Velocity_R_Max_val26=Hip_Tangential_Velocity_R_Max_val26*-1;


Hip_Tangential_Velocity_L_Max_Back_val=Hip_Tangential_Velocity_L_Max_val19;
Hip_Tangential_Velocity_L_Min_Back_val=Hip_Tangential_Velocity_L_Max_val20;
Hip_Tangential_Velocity_L_Max_Front_val=Hip_Tangential_Velocity_L_Max_val21;
Hip_Tangential_Velocity_L_Min_Front_val=Hip_Tangential_Velocity_L_Max_val22;

Hip_Tangential_Velocity_R_Max_Back_val=Hip_Tangential_Velocity_R_Max_val23;
Hip_Tangential_Velocity_R_Min_Back_val=Hip_Tangential_Velocity_R_Max_val24;
Hip_Tangential_Velocity_R_Max_Front_val=Hip_Tangential_Velocity_R_Max_val25;
Hip_Tangential_Velocity_R_Min_Front_val=Hip_Tangential_Velocity_R_Max_val26;

Knee_Tangential_Velocity_L_Max_val20=Knee_Tangential_Velocity_L_Max_val20*-1;
Knee_Tangential_Velocity_L_Max_val22=Knee_Tangential_Velocity_L_Max_val22*-1;

Knee_Tangential_Velocity_R_Max_val24=Knee_Tangential_Velocity_R_Max_val24*-1;
Knee_Tangential_Velocity_R_Max_val26=Knee_Tangential_Velocity_R_Max_val26*-1;

Knee_Tangential_Velocity_L_Max_Back_val=Knee_Tangential_Velocity_L_Max_val19;
Knee_Tangential_Velocity_L_Min_Back_val=Knee_Tangential_Velocity_L_Max_val20;
Knee_Tangential_Velocity_L_Max_Front_val=Knee_Tangential_Velocity_L_Max_val21;
Knee_Tangential_Velocity_L_Min_Front_val=Knee_Tangential_Velocity_L_Max_val22;

Knee_Tangential_Velocity_R_Max_Back_val=Knee_Tangential_Velocity_R_Max_val23;
Knee_Tangential_Velocity_R_Min_Back_val=Knee_Tangential_Velocity_R_Max_val24;
Knee_Tangential_Velocity_R_Max_Front_val=Knee_Tangential_Velocity_R_Max_val25;
Knee_Tangential_Velocity_R_Min_Front_val=Knee_Tangential_Velocity_R_Max_val26;

Ankle_Tangential_Velocity_L_Max_val20=Ankle_Tangential_Velocity_L_Max_val20*-1;
Ankle_Tangential_Velocity_L_Max_val22=Ankle_Tangential_Velocity_L_Max_val22*-1;

Ankle_Tangential_Velocity_R_Max_val24=Ankle_Tangential_Velocity_R_Max_val24*-1;
Ankle_Tangential_Velocity_R_Max_val26=Ankle_Tangential_Velocity_R_Max_val26*-1;

Ankle_Tangential_Velocity_L_Max_Back_val=Ankle_Tangential_Velocity_L_Max_val19;
Ankle_Tangential_Velocity_L_Min_Back_val=Ankle_Tangential_Velocity_L_Max_val20;
Ankle_Tangential_Velocity_L_Max_Front_val=Ankle_Tangential_Velocity_L_Max_val21;
Ankle_Tangential_Velocity_L_Min_Front_val=Ankle_Tangential_Velocity_L_Max_val22;

Ankle_Tangential_Velocity_R_Max_Back_val=Ankle_Tangential_Velocity_R_Max_val23;
Ankle_Tangential_Velocity_R_Min_Back_val=Ankle_Tangential_Velocity_R_Max_val24;
Ankle_Tangential_Velocity_R_Max_Front_val=Ankle_Tangential_Velocity_R_Max_val25;
Ankle_Tangential_Velocity_R_Min_Front_val=Ankle_Tangential_Velocity_R_Max_val26;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pause(0.5)
% Angular Accelerations %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Left Hip %

Hip_Angle_Acceleration_L_max=max(Hip_Angle_Acceleration_L);
Hip_Angle_Acceleration_L_max=Hip_Angle_Acceleration_L_max-0.5;
Hip_Angle_Acceleration_L_min=min(Hip_Angle_Acceleration_L);
Hip_Angle_Acceleration_L_min=Hip_Angle_Acceleration_L_min+0.5;

if Cadence>=102
[Hip_Angle_Acceleration_L_Max_val19, idx400]=findpeaks(Hip_Angle_Acceleration_L,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Hip_Angle_Acceleration_L_Max_val20, idx401]=findpeaks(Hip_Angle_Acceleration_L*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Hip_Angle_Acceleration_L_Max_val19, idx400]=findpeaks(Hip_Angle_Acceleration_L,Fs,'MinPeakDistance',1); 
[Hip_Angle_Acceleration_L_Max_val20, idx401]=findpeaks(Hip_Angle_Acceleration_L*-1,Fs,'MinPeakDistance',1);
end

Hip_Angle_Acceleration_L_Max_val20=Hip_Angle_Acceleration_L_Max_val20*-1;
% 
for i=1:size(Hip_Angle_Acceleration_L_Max_val19)
    if Hip_Angle_Acceleration_L_Max_val19(i) < Hip_Angle_Acceleration_L_max
   Hip_Angle_Acceleration_L_Max_val19(i)=0;
    idx400(i)=0;
     end
end
Hip_Angle_Acceleration_L_Max_val19=Hip_Angle_Acceleration_L_Max_val19(max(Hip_Angle_Acceleration_L_Max_val19~=0,[],2),:);
idx400=idx400(max(idx400~=0,[],2),:);

for i=1:size(Hip_Angle_Acceleration_L_Max_val20)
if Hip_Angle_Acceleration_L_Max_val20(i) > Hip_Angle_Acceleration_L_min
    Hip_Angle_Acceleration_L_Max_val20(i)=0;
    idx401(i)=0;
end
end
Hip_Angle_Acceleration_L_Max_val20=Hip_Angle_Acceleration_L_Max_val20(max(Hip_Angle_Acceleration_L_Max_val20~=0,[],2),:);
idx401=idx401(max(idx401~=0,[],2),:);

Hip_Angle_Acceleration_L_Max_val=Hip_Angle_Acceleration_L_Max_val19;
Hip_Angle_Acceleration_L_Min_val=Hip_Angle_Acceleration_L_Max_val20;

% Right Hip %

Hip_Angle_Acceleration_R_max=max(Hip_Angle_Acceleration_R);
Hip_Angle_Acceleration_R_max=Hip_Angle_Acceleration_R_max-0.5;
Hip_Angle_Acceleration_R_min=min(Hip_Angle_Acceleration_R);
Hip_Angle_Acceleration_R_min=Hip_Angle_Acceleration_R_min+0.5;

if Cadence>=102
[Hip_Angle_Acceleration_R_Max_val19, idx402]=findpeaks(Hip_Angle_Acceleration_R,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Hip_Angle_Acceleration_R_Max_val20, idx403]=findpeaks(Hip_Angle_Acceleration_R*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Hip_Angle_Acceleration_R_Max_val19, idx402]=findpeaks(Hip_Angle_Acceleration_R,Fs,'MinPeakDistance',1); 
[Hip_Angle_Acceleration_R_Max_val20, idx403]=findpeaks(Hip_Angle_Acceleration_R*-1,Fs,'MinPeakDistance',1);
end

Hip_Angle_Acceleration_R_Max_val20=Hip_Angle_Acceleration_R_Max_val20*-1;
% 
for i=1:size(Hip_Angle_Acceleration_R_Max_val19)
    if Hip_Angle_Acceleration_R_Max_val19(i) < Hip_Angle_Acceleration_R_max
   Hip_Angle_Acceleration_R_Max_val19(i)=0;
    idx402(i)=0;
     end
end
Hip_Angle_Acceleration_R_Max_val19=Hip_Angle_Acceleration_R_Max_val19(max(Hip_Angle_Acceleration_R_Max_val19~=0,[],2),:);
idx402=idx402(max(idx402~=0,[],2),:);

for i=1:size(Hip_Angle_Acceleration_R_Max_val20)
if Hip_Angle_Acceleration_R_Max_val20(i) > Hip_Angle_Acceleration_R_min
    Hip_Angle_Acceleration_R_Max_val20(i)=0;
    idx403(i)=0;
end
end
Hip_Angle_Acceleration_R_Max_val20=Hip_Angle_Acceleration_R_Max_val20(max(Hip_Angle_Acceleration_R_Max_val20~=0,[],2),:);
idx403=idx403(max(idx403~=0,[],2),:);

Hip_Angle_Acceleration_R_Max_val=Hip_Angle_Acceleration_R_Max_val19;
Hip_Angle_Acceleration_R_Min_val=Hip_Angle_Acceleration_R_Max_val20;

% Left knee %

Knee_Angle_Acceleration_L_max=max(Knee_Angle_Acceleration_L);
Knee_Angle_Acceleration_L_max=Knee_Angle_Acceleration_L_max-0.5;
Knee_Angle_Acceleration_L_min=min(Knee_Angle_Acceleration_L);
Knee_Angle_Acceleration_L_min=Knee_Angle_Acceleration_L_min+0.5;

if Cadence>=102
[Knee_Angle_Acceleration_L_Max_val19, idx404]=findpeaks(Knee_Angle_Acceleration_L,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Knee_Angle_Acceleration_L_Max_val20, idx405]=findpeaks(Knee_Angle_Acceleration_L*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Knee_Angle_Acceleration_L_Max_val19, idx404]=findpeaks(Knee_Angle_Acceleration_L,Fs,'MinPeakDistance',1); 
[Knee_Angle_Acceleration_L_Max_val20, idx405]=findpeaks(Knee_Angle_Acceleration_L*-1,Fs,'MinPeakDistance',1);
end

Knee_Angle_Acceleration_L_Max_val20=Knee_Angle_Acceleration_L_Max_val20*-1;
% 
for i=1:size(Knee_Angle_Acceleration_L_Max_val19)
    if Knee_Angle_Acceleration_L_Max_val19(i) < Knee_Angle_Acceleration_L_max
   Knee_Angle_Acceleration_L_Max_val19(i)=0;
    idx404(i)=0;
     end
end
Knee_Angle_Acceleration_L_Max_val19=Knee_Angle_Acceleration_L_Max_val19(max(Knee_Angle_Acceleration_L_Max_val19~=0,[],2),:);
idx404=idx404(max(idx404~=0,[],2),:);

for i=1:size(Knee_Angle_Acceleration_L_Max_val20)
if Knee_Angle_Acceleration_L_Max_val20(i) > Knee_Angle_Acceleration_L_min
    Knee_Angle_Acceleration_L_Max_val20(i)=0;
    idx405(i)=0;
end
end
Knee_Angle_Acceleration_L_Max_val20=Knee_Angle_Acceleration_L_Max_val20(max(Knee_Angle_Acceleration_L_Max_val20~=0,[],2),:);
idx405=idx405(max(idx405~=0,[],2),:);

Knee_Angle_Acceleration_L_Max_val=Knee_Angle_Acceleration_L_Max_val19;
Knee_Angle_Acceleration_L_Min_val=Knee_Angle_Acceleration_L_Max_val20;

% Right knee %

Knee_Angle_Acceleration_R_max=max(Knee_Angle_Acceleration_R);
Knee_Angle_Acceleration_R_max=Knee_Angle_Acceleration_R_max-0.5;
Knee_Angle_Acceleration_R_min=min(Knee_Angle_Acceleration_R);
Knee_Angle_Acceleration_R_min=Knee_Angle_Acceleration_R_min+0.5;

if Cadence>=102
[Knee_Angle_Acceleration_R_Max_val19, idx406]=findpeaks(Knee_Angle_Acceleration_R,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Knee_Angle_Acceleration_R_Max_val20, idx407]=findpeaks(Knee_Angle_Acceleration_R*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Knee_Angle_Acceleration_R_Max_val19, idx406]=findpeaks(Knee_Angle_Acceleration_R,Fs,'MinPeakDistance',1); 
[Knee_Angle_Acceleration_R_Max_val20, idx407]=findpeaks(Knee_Angle_Acceleration_R*-1,Fs,'MinPeakDistance',1);
end

Knee_Angle_Acceleration_R_Max_val20=Knee_Angle_Acceleration_R_Max_val20*-1;
% 
for i=1:size(Knee_Angle_Acceleration_R_Max_val19)
    if Knee_Angle_Acceleration_R_Max_val19(i) < Knee_Angle_Acceleration_R_max
   Knee_Angle_Acceleration_R_Max_val19(i)=0;
    idx406(i)=0;
     end
end
Knee_Angle_Acceleration_R_Max_val19=Knee_Angle_Acceleration_R_Max_val19(max(Knee_Angle_Acceleration_R_Max_val19~=0,[],2),:);
idx406=idx406(max(idx406~=0,[],2),:);

for i=1:size(Knee_Angle_Acceleration_R_Max_val20)
if Knee_Angle_Acceleration_R_Max_val20(i) > Knee_Angle_Acceleration_R_min
    Knee_Angle_Acceleration_R_Max_val20(i)=0;
    idx407(i)=0;
end
end
Knee_Angle_Acceleration_R_Max_val20=Knee_Angle_Acceleration_R_Max_val20(max(Knee_Angle_Acceleration_R_Max_val20~=0,[],2),:);
idx407=idx407(max(idx407~=0,[],2),:);

Knee_Angle_Acceleration_R_Max_val=Knee_Angle_Acceleration_R_Max_val19;
Knee_Angle_Acceleration_R_Min_val=Knee_Angle_Acceleration_R_Max_val20;

% Left ankle %

Ankle_Angle_Acceleration_L_max=max(Ankle_Angle_Acceleration_L);
Ankle_Angle_Acceleration_L_max=Ankle_Angle_Acceleration_L_max-0.5;
Ankle_Angle_Acceleration_L_min=min(Ankle_Angle_Acceleration_L);
Ankle_Angle_Acceleration_L_min=Ankle_Angle_Acceleration_L_min+0.5;

if Cadence>=102
[Ankle_Angle_Acceleration_L_Max_val19, idx408]=findpeaks(Ankle_Angle_Acceleration_L,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Ankle_Angle_Acceleration_L_Max_val20, idx409]=findpeaks(Ankle_Angle_Acceleration_L*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Ankle_Angle_Acceleration_L_Max_val19, idx408]=findpeaks(Ankle_Angle_Acceleration_L,Fs,'MinPeakDistance',1); 
[Ankle_Angle_Acceleration_L_Max_val20, idx409]=findpeaks(Ankle_Angle_Acceleration_L*-1,Fs,'MinPeakDistance',1);
end

Ankle_Angle_Acceleration_L_Max_val20=Ankle_Angle_Acceleration_L_Max_val20*-1;
% 
for i=1:size(Ankle_Angle_Acceleration_L_Max_val19)
    if Ankle_Angle_Acceleration_L_Max_val19(i) < Ankle_Angle_Acceleration_L_max
   Ankle_Angle_Acceleration_L_Max_val19(i)=0;
    idx408(i)=0;
     end
end
Ankle_Angle_Acceleration_L_Max_val19=Ankle_Angle_Acceleration_L_Max_val19(max(Ankle_Angle_Acceleration_L_Max_val19~=0,[],2),:);
idx408=idx408(max(idx408~=0,[],2),:);

for i=1:size(Ankle_Angle_Acceleration_L_Max_val20)
if Ankle_Angle_Acceleration_L_Max_val20(i) > Ankle_Angle_Acceleration_L_min
    Ankle_Angle_Acceleration_L_Max_val20(i)=0;
    idx409(i)=0;
end
end
Ankle_Angle_Acceleration_L_Max_val20=Ankle_Angle_Acceleration_L_Max_val20(max(Ankle_Angle_Acceleration_L_Max_val20~=0,[],2),:);
idx409=idx409(max(idx409~=0,[],2),:);

Ankle_Angle_Acceleration_L_Max_val=Ankle_Angle_Acceleration_L_Max_val19;
Ankle_Angle_Acceleration_L_Min_val=Ankle_Angle_Acceleration_L_Max_val20;

% Right ankle %

Ankle_Angle_Acceleration_R_max=max(Ankle_Angle_Acceleration_R);
Ankle_Angle_Acceleration_R_max=Ankle_Angle_Acceleration_R_max-0.5;
Ankle_Angle_Acceleration_R_min=min(Ankle_Angle_Acceleration_R);
Ankle_Angle_Acceleration_R_min=Ankle_Angle_Acceleration_R_min+0.5;

if Cadence>=102
[Ankle_Angle_Acceleration_R_Max_val19, idx410]=findpeaks(Ankle_Angle_Acceleration_R,Fs,'MinPeakDistance',0.3);  % For both ankles 1 when at lower cadence (80) 0.3 when cadence 90 plus
[Ankle_Angle_Acceleration_R_Max_val20, idx411]=findpeaks(Ankle_Angle_Acceleration_R*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Ankle_Angle_Acceleration_R_Max_val19, idx410]=findpeaks(Ankle_Angle_Acceleration_R,Fs,'MinPeakDistance',1); 
[Ankle_Angle_Acceleration_R_Max_val20, idx411]=findpeaks(Ankle_Angle_Acceleration_R*-1,Fs,'MinPeakDistance',1);
end

Ankle_Angle_Acceleration_R_Max_val20=Ankle_Angle_Acceleration_R_Max_val20*-1;
% 
for i=1:size(Ankle_Angle_Acceleration_R_Max_val19)
    if Ankle_Angle_Acceleration_R_Max_val19(i) < Ankle_Angle_Acceleration_R_max
   Ankle_Angle_Acceleration_R_Max_val19(i)=0;
    idx410(i)=0;
     end
end
Ankle_Angle_Acceleration_R_Max_val19=Ankle_Angle_Acceleration_R_Max_val19(max(Ankle_Angle_Acceleration_R_Max_val19~=0,[],2),:);
idx410=idx410(max(idx410~=0,[],2),:);

for i=1:size(Ankle_Angle_Acceleration_R_Max_val20)
if Ankle_Angle_Acceleration_R_Max_val20(i) > Ankle_Angle_Acceleration_R_min
    Ankle_Angle_Acceleration_R_Max_val20(i)=0;
    idx411(i)=0;
end
end
Ankle_Angle_Acceleration_R_Max_val20=Ankle_Angle_Acceleration_R_Max_val20(max(Ankle_Angle_Acceleration_R_Max_val20~=0,[],2),:);
idx411=idx411(max(idx411~=0,[],2),:);

Ankle_Angle_Acceleration_R_Max_val=Ankle_Angle_Acceleration_R_Max_val19;
Ankle_Angle_Acceleration_R_Min_val=Ankle_Angle_Acceleration_R_Max_val20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tangential angular accelerations %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% left hip %


for r=1:size(Tangential_Crank_Angle_L)
if (Tangential_Crank_Angle_L(r,1)>0&& Tangential_Crank_Angle_L(r,1)<180)

Tangenital_Acceleration_Front_hip_L(r,1)=Hip_Angle_Acceleration_L(r,1);
Tangenital_Acceleration_Front_knee_L(r,1)=Knee_Angle_Acceleration_L(r,1);
Tangenital_Acceleration_Front_ankle_L(r,1)=Ankle_Angle_Acceleration_L(r,1);
    elseif (Tangential_Crank_Angle_L(r,1)>=180 && Tangential_Crank_Angle_L(r,1)<360)
Tangenital_Acceleration_Back_hip_L(r,1)=Hip_Angle_Acceleration_L(r,1);
Tangenital_Acceleration_Back_knee_L(r,1)=Knee_Angle_Acceleration_L(r,1);
Tangenital_Acceleration_Back_ankle_L(r,1)=Ankle_Angle_Acceleration_L(r,1);
end
end


for r=1:size(Tangential_Crank_Angle_R)
if (Tangential_Crank_Angle_R(r,1)>0&& Tangential_Crank_Angle_R(r,1)<180)

Tangenital_Acceleration_Front_hip_R(r,1)=Hip_Angle_Acceleration_R(r,1);
Tangenital_Acceleration_Front_knee_R(r,1)=Knee_Angle_Acceleration_R(r,1);
Tangenital_Acceleration_Front_ankle_R(r,1)=Ankle_Angle_Acceleration_R(r,1);
    elseif (Tangential_Crank_Angle_R(r,1)>=180 && Tangential_Crank_Angle_R(r,1)<360)
Tangenital_Acceleration_Back_hip_R(r,1)=Hip_Angle_Acceleration_R(r,1);
Tangenital_Acceleration_Back_knee_R(r,1)=Knee_Angle_Acceleration_R(r,1);
Tangenital_Acceleration_Back_ankle_R(r,1)=Ankle_Angle_Acceleration_R(r,1);
end
end

for t=1:size(Tangenital_Acceleration_Front_hip_L)-1
if Tangenital_Acceleration_Front_hip_L(t+1,1)>=Tangenital_Acceleration_Front_hip_L(t,1)
 
Tangenital_Acceleration_Front_hip_negative_up_L(t,1)=Tangenital_Acceleration_Front_hip_L(t,1);
Tangenital_Acceleration_Front_knee_negative_up_L(t,1)=Tangenital_Acceleration_Front_knee_L(t,1);
Tangenital_Acceleration_Front_ankle_negative_up_L(t,1)=Tangenital_Acceleration_Front_ankle_L(t,1);
elseif Tangenital_Acceleration_Front_hip_L(t+1,1)<Tangenital_Acceleration_Front_hip_L(t,1)
Tangenital_Acceleration_Front_hip_negative_down_L(t,1)=Tangenital_Acceleration_Front_hip_L(t,1);
Tangenital_Acceleration_Front_knee_negative_down_L(t,1)=Tangenital_Acceleration_Front_knee_L(t,1);
Tangenital_Acceleration_Front_ankle_negative_down_L(t,1)=Tangenital_Acceleration_Front_ankle_L(t,1);
end
end

for t=1:size(Tangenital_Acceleration_Front_hip_R)-1
if Tangenital_Acceleration_Front_hip_R(t+1,1)>=Tangenital_Acceleration_Front_hip_R(t,1)
    
 Tangenital_Acceleration_Front_hip_negative_up_R(t,1)=Tangenital_Acceleration_Front_hip_R(t,1);
Tangenital_Acceleration_Front_knee_negative_up_R(t,1)=Tangenital_Acceleration_Front_knee_R(t,1);
Tangenital_Acceleration_Front_ankle_negative_up_R(t,1)=Tangenital_Acceleration_Front_ankle_R(t,1);

elseif Tangenital_Acceleration_Front_hip_R(t+1,1)<Tangenital_Acceleration_Front_hip_R(t,1)

Tangenital_Acceleration_Front_hip_negative_down_R(t,1)=Tangenital_Acceleration_Front_hip_R(t,1);
Tangenital_Acceleration_Front_knee_negative_down_R(t,1)=Tangenital_Acceleration_Front_knee_R(t,1);
Tangenital_Acceleration_Front_ankle_negative_down_R(t,1)=Tangenital_Acceleration_Front_ankle_R(t,1);

end
end

for y=1:size(Tangenital_Acceleration_Back_hip_L)-1
if Tangenital_Acceleration_Back_hip_L(y+1,1)>Tangenital_Acceleration_Back_hip_L(y,1)
    
Tangenital_Acceleration_Back_hip_positive_up_L(y,1)=Tangenital_Acceleration_Back_hip_L(y,1);
Tangenital_Acceleration_Back_knee_positive_up_L(y,1)=Tangenital_Acceleration_Back_knee_L(y,1);
Tangenital_Acceleration_Back_ankle_positive_up_L(y,1)=Tangenital_Acceleration_Back_ankle_L(y,1);

elseif Tangenital_Acceleration_Back_hip_L(y+1,1)<Tangenital_Acceleration_Back_hip_L(y,1)
    
Tangenital_Acceleration_Back_hip_positive_down_L(y,1)=Tangenital_Acceleration_Back_hip_L(y,1);
Tangenital_Acceleration_Back_knee_positive_down_L(y,1)=Tangenital_Acceleration_Back_knee_L(y,1);
Tangenital_Acceleration_Back_ankle_positive_down_L(y,1)=Tangenital_Acceleration_Back_ankle_L(y,1);

end
end

for y=1:size(Tangenital_Acceleration_Back_hip_R)-1
if Tangenital_Acceleration_Back_hip_R(y+1,1)>Tangenital_Acceleration_Back_hip_R(y,1)
    
Tangenital_Acceleration_Back_hip_positive_up_R(y,1)=Tangenital_Acceleration_Back_hip_R(y,1);
Tangenital_Acceleration_Back_knee_positive_up_R(y,1)=Tangenital_Acceleration_Back_knee_R(y,1);
Tangenital_Acceleration_Back_ankle_positive_up_R(y,1)=Tangenital_Acceleration_Back_ankle_R(y,1);

elseif Tangenital_Acceleration_Back_hip_R(y+1,1)<Tangenital_Acceleration_Back_hip_R(y,1)
    
Tangenital_Acceleration_Back_hip_positive_down_R(y,1)=Tangenital_Acceleration_Back_hip_R(y,1);
Tangenital_Acceleration_Back_knee_positive_down_R(y,1)=Tangenital_Acceleration_Back_knee_R(y,1);
Tangenital_Acceleration_Back_ankle_positive_down_R(y,1)=Tangenital_Acceleration_Back_ankle_R(y,1);

end
end

Tangenital_Acceleration_Front_hip_negative_up_L=Tangenital_Acceleration_Front_hip_negative_up_L(Tangenital_Acceleration_Front_hip_negative_up_L~=0);
Tangenital_Acceleration_Front_hip_negative_down_L=Tangenital_Acceleration_Front_hip_negative_down_L(Tangenital_Acceleration_Front_hip_negative_down_L~=0);
Tangenital_Acceleration_Back_hip_positive_up_L=Tangenital_Acceleration_Back_hip_positive_up_L(Tangenital_Acceleration_Back_hip_positive_up_L~=0);
Tangenital_Acceleration_Back_hip_positive_down_L=Tangenital_Acceleration_Back_hip_positive_down_L(Tangenital_Acceleration_Back_hip_positive_down_L~=0);
Tangenital_Acceleration_Back_hip_positive_up_R=Tangenital_Acceleration_Back_hip_positive_up_R(Tangenital_Acceleration_Back_hip_positive_up_R~=0);
Tangenital_Acceleration_Back_hip_positive_down_R=Tangenital_Acceleration_Back_hip_positive_down_R(Tangenital_Acceleration_Back_hip_positive_down_R~=0);
Tangenital_Acceleration_Front_hip_negative_up_R=Tangenital_Acceleration_Front_hip_negative_up_R(Tangenital_Acceleration_Front_hip_negative_up_R~=0);
Tangenital_Acceleration_Front_hip_negative_down_R=Tangenital_Acceleration_Front_hip_negative_down_R(Tangenital_Acceleration_Front_hip_negative_down_R~=0);
Tangenital_Acceleration_Front_knee_negative_up_L=Tangenital_Acceleration_Front_knee_negative_up_L(Tangenital_Acceleration_Front_knee_negative_up_L~=0);
Tangenital_Acceleration_Front_knee_negative_down_L=Tangenital_Acceleration_Front_knee_negative_down_L(Tangenital_Acceleration_Front_knee_negative_down_L~=0);
Tangenital_Acceleration_Back_knee_positive_up_L=Tangenital_Acceleration_Back_knee_positive_up_L(Tangenital_Acceleration_Back_knee_positive_up_L~=0);
Tangenital_Acceleration_Back_knee_positive_down_L=Tangenital_Acceleration_Back_knee_positive_down_L(Tangenital_Acceleration_Back_knee_positive_down_L~=0);
Tangenital_Acceleration_Back_knee_positive_up_R=Tangenital_Acceleration_Back_knee_positive_up_R(Tangenital_Acceleration_Back_knee_positive_up_R~=0);
Tangenital_Acceleration_Back_knee_positive_down_R=Tangenital_Acceleration_Back_knee_positive_down_R(Tangenital_Acceleration_Back_knee_positive_down_R~=0);
Tangenital_Acceleration_Front_knee_negative_up_R=Tangenital_Acceleration_Front_knee_negative_up_R(Tangenital_Acceleration_Front_knee_negative_up_R~=0);
Tangenital_Acceleration_Front_knee_negative_down_R=Tangenital_Acceleration_Front_knee_negative_down_R(Tangenital_Acceleration_Front_knee_negative_down_R~=0);
Tangenital_Acceleration_Front_ankle_negative_up_L=Tangenital_Acceleration_Front_ankle_negative_up_L(Tangenital_Acceleration_Front_ankle_negative_up_L~=0);
Tangenital_Acceleration_Front_ankle_negative_down_L=Tangenital_Acceleration_Front_ankle_negative_down_L(Tangenital_Acceleration_Front_ankle_negative_down_L~=0);
Tangenital_Acceleration_Back_ankle_positive_up_L=Tangenital_Acceleration_Back_ankle_positive_up_L(Tangenital_Acceleration_Back_ankle_positive_up_L~=0);
Tangenital_Acceleration_Back_ankle_positive_down_L=Tangenital_Acceleration_Back_ankle_positive_down_L(Tangenital_Acceleration_Back_ankle_positive_down_L~=0);
Tangenital_Acceleration_Back_ankle_positive_up_R=Tangenital_Acceleration_Back_ankle_positive_up_R(Tangenital_Acceleration_Back_ankle_positive_up_R~=0);
Tangenital_Acceleration_Back_ankle_positive_down_R=Tangenital_Acceleration_Back_ankle_positive_down_R(Tangenital_Acceleration_Back_ankle_positive_down_R~=0);
Tangenital_Acceleration_Front_ankle_negative_up_R=Tangenital_Acceleration_Front_ankle_negative_up_R(Tangenital_Acceleration_Front_ankle_negative_up_R~=0);
Tangenital_Acceleration_Front_ankle_negative_down_R=Tangenital_Acceleration_Front_ankle_negative_down_R(Tangenital_Acceleration_Front_ankle_negative_down_R~=0);

Tangenital_Acceleration_Front_hip_negative_up_L=mean(Tangenital_Acceleration_Front_hip_negative_up_L);
Tangenital_Acceleration_Front_hip_negative_down_L=mean(Tangenital_Acceleration_Front_hip_negative_down_L);
Tangenital_Acceleration_Back_hip_positive_up_L=mean(Tangenital_Acceleration_Back_hip_positive_up_L);
Tangenital_Acceleration_Back_hip_positive_down_L=mean(Tangenital_Acceleration_Back_hip_positive_down_L);
Tangenital_Acceleration_Back_hip_positive_up_R=mean(Tangenital_Acceleration_Back_hip_positive_up_R);
Tangenital_Acceleration_Back_hip_positive_down_R=mean(Tangenital_Acceleration_Back_hip_positive_down_R);
Tangenital_Acceleration_Front_hip_negative_up_R=mean(Tangenital_Acceleration_Front_hip_negative_up_R);
Tangenital_Acceleration_Front_hip_negative_down_R=mean(Tangenital_Acceleration_Front_hip_negative_down_R);
Tangenital_Acceleration_Front_knee_negative_up_L=mean(Tangenital_Acceleration_Front_knee_negative_up_L);
Tangenital_Acceleration_Front_knee_negative_down_L=mean(Tangenital_Acceleration_Front_knee_negative_down_L);
Tangenital_Acceleration_Back_knee_positive_up_L=mean(Tangenital_Acceleration_Back_knee_positive_up_L);
Tangenital_Acceleration_Back_knee_positive_down_L=mean(Tangenital_Acceleration_Back_knee_positive_down_L);
Tangenital_Acceleration_Back_knee_positive_up_R=mean(Tangenital_Acceleration_Back_knee_positive_up_R);
Tangenital_Acceleration_Back_knee_positive_down_R=mean(Tangenital_Acceleration_Back_knee_positive_down_R);
Tangenital_Acceleration_Front_knee_negative_up_R=mean(Tangenital_Acceleration_Front_knee_negative_up_R);
Tangenital_Acceleration_Front_knee_negative_down_R=mean(Tangenital_Acceleration_Front_knee_negative_down_R);
Tangenital_Acceleration_Front_ankle_negative_up_L=mean(Tangenital_Acceleration_Front_ankle_negative_up_L);
Tangenital_Acceleration_Front_ankle_negative_down_L=mean(Tangenital_Acceleration_Front_ankle_negative_down_L);
Tangenital_Acceleration_Back_ankle_positive_up_L=mean(Tangenital_Acceleration_Back_ankle_positive_up_L);
Tangenital_Acceleration_Back_ankle_positive_down_L=mean(Tangenital_Acceleration_Back_ankle_positive_down_L);
Tangenital_Acceleration_Back_ankle_positive_up_R=mean(Tangenital_Acceleration_Back_ankle_positive_up_R);
Tangenital_Acceleration_Back_ankle_positive_down_R=mean(Tangenital_Acceleration_Back_ankle_positive_down_R);
Tangenital_Acceleration_Front_ankle_negative_up_R=mean(Tangenital_Acceleration_Front_ankle_negative_up_R);
Tangenital_Acceleration_Front_ankle_negative_down_R=mean(Tangenital_Acceleration_Front_ankle_negative_down_R);


Tangenital_Acceleration_Front_hip_L=Tangenital_Acceleration_Front_hip_L(Tangenital_Acceleration_Front_hip_L~=0);
Tangenital_Acceleration_Back_hip_L=Tangenital_Acceleration_Back_hip_L(Tangenital_Acceleration_Back_hip_L~=0);
Tangenital_Acceleration_Front_hip_L=Tangenital_Acceleration_Front_hip_L';
Tangenital_Acceleration_Back_hip_L=Tangenital_Acceleration_Back_hip_L';

Tangenital_Acceleration_Front_hip_R=Tangenital_Acceleration_Front_hip_R(Tangenital_Acceleration_Front_hip_R~=0);
Tangenital_Acceleration_Back_hip_R=Tangenital_Acceleration_Back_hip_R(Tangenital_Acceleration_Back_hip_R~=0);
Tangenital_Acceleration_Front_hip_R=Tangenital_Acceleration_Front_hip_R';
Tangenital_Acceleration_Back_hip_R=Tangenital_Acceleration_Back_hip_R';

Tangenital_Acceleration_Front_knee_L=Tangenital_Acceleration_Front_knee_L(Tangenital_Acceleration_Front_knee_L~=0);
Tangenital_Acceleration_Back_knee_L=Tangenital_Acceleration_Back_knee_L(Tangenital_Acceleration_Back_knee_L~=0);
Tangenital_Acceleration_Front_knee_L=Tangenital_Acceleration_Front_knee_L';
Tangenital_Acceleration_Back_knee_L=Tangenital_Acceleration_Back_knee_L';

Tangenital_Acceleration_Front_knee_R=Tangenital_Acceleration_Front_knee_R(Tangenital_Acceleration_Front_knee_R~=0);
Tangenital_Acceleration_Back_knee_R=Tangenital_Acceleration_Back_knee_R(Tangenital_Acceleration_Back_knee_R~=0);
Tangenital_Acceleration_Front_knee_R=Tangenital_Acceleration_Front_knee_R';
Tangenital_Acceleration_Back_knee_R=Tangenital_Acceleration_Back_knee_R';

Tangenital_Acceleration_Front_ankle_L=Tangenital_Acceleration_Front_ankle_L(Tangenital_Acceleration_Front_ankle_L~=0);
Tangenital_Acceleration_Back_ankle_L=Tangenital_Acceleration_Back_ankle_L(Tangenital_Acceleration_Back_ankle_L~=0);
Tangenital_Acceleration_Front_ankle_L=Tangenital_Acceleration_Front_ankle_L';
Tangenital_Acceleration_Back_ankle_L=Tangenital_Acceleration_Back_ankle_L';

Tangenital_Acceleration_Front_ankle_R=Tangenital_Acceleration_Front_ankle_R(Tangenital_Acceleration_Front_ankle_R~=0);
Tangenital_Acceleration_Back_ankle_R=Tangenital_Acceleration_Back_ankle_R(Tangenital_Acceleration_Back_ankle_R~=0);
Tangenital_Acceleration_Front_ankle_R=Tangenital_Acceleration_Front_ankle_R';
Tangenital_Acceleration_Back_ankle_R=Tangenital_Acceleration_Back_ankle_R';


if Cadence>=102
[Hip_Tangential_Acceleration_L_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_hip_L,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Acceleration_L_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_hip_L*-1,Fs,'MinPeakDistance',0.3);

[Hip_Tangential_Acceleration_L_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_hip_L,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Acceleration_L_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_hip_L*-1,Fs,'MinPeakDistance',0.3);

[Hip_Tangential_Acceleration_R_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_hip_R,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Acceleration_R_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_hip_R*-1,Fs,'MinPeakDistance',0.3);

[Hip_Tangential_Acceleration_R_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_hip_R,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Acceleration_R_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_hip_R*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Acceleration_L_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_knee_L,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Acceleration_L_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_knee_L*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Acceleration_L_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_knee_L,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Acceleration_L_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_knee_L*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Acceleration_R_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_knee_R,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Acceleration_R_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_knee_R*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Acceleration_R_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_knee_R,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Acceleration_R_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_knee_R*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Acceleration_L_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_ankle_L,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Acceleration_L_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_ankle_L*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Acceleration_L_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_ankle_L,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Acceleration_L_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_ankle_L*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Acceleration_R_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_ankle_R,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Acceleration_R_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_ankle_R*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Acceleration_R_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_ankle_R,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Acceleration_R_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_ankle_R*-1,Fs,'MinPeakDistance',0.3);

elseif Cadence<102
[Hip_Tangential_Acceleration_L_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_hip_L,Fs,'MinPeakDistance',1); 
[Hip_Tangential_Acceleration_L_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_hip_L*-1,Fs,'MinPeakDistance',1);

[Hip_Tangential_Acceleration_L_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_hip_L,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Acceleration_L_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_hip_L*-1,Fs,'MinPeakDistance',0.3);

[Hip_Tangential_Acceleration_R_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_hip_R,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Acceleration_R_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_hip_R*-1,Fs,'MinPeakDistance',0.3);

[Hip_Tangential_Acceleration_R_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_hip_R,Fs,'MinPeakDistance',0.3);  
[Hip_Tangential_Acceleration_R_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_hip_R*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Acceleration_L_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_knee_L,Fs,'MinPeakDistance',1); 
[Knee_Tangential_Acceleration_L_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_knee_L*-1,Fs,'MinPeakDistance',1);

[Knee_Tangential_Acceleration_L_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_knee_L,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Acceleration_L_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_knee_L*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Acceleration_R_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_knee_R,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Acceleration_R_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_knee_R*-1,Fs,'MinPeakDistance',0.3);

[Knee_Tangential_Acceleration_R_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_knee_R,Fs,'MinPeakDistance',0.3);  
[Knee_Tangential_Acceleration_R_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_knee_R*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Acceleration_L_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_ankle_L,Fs,'MinPeakDistance',1); 
[Ankle_Tangential_Acceleration_L_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_ankle_L*-1,Fs,'MinPeakDistance',1);

[Ankle_Tangential_Acceleration_L_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_ankle_L,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Acceleration_L_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_ankle_L*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Acceleration_R_Max_val19, idx500]=findpeaks(Tangenital_Acceleration_Back_ankle_R,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Acceleration_R_Max_val20, idx501]=findpeaks(Tangenital_Acceleration_Back_ankle_R*-1,Fs,'MinPeakDistance',0.3);

[Ankle_Tangential_Acceleration_R_Max_val21, idx500]=findpeaks(Tangenital_Acceleration_Front_ankle_R,Fs,'MinPeakDistance',0.3);  
[Ankle_Tangential_Acceleration_R_Max_val22, idx501]=findpeaks(Tangenital_Acceleration_Front_ankle_R*-1,Fs,'MinPeakDistance',0.3);
end

Hip_Tangential_Acceleration_L_Max_val20=Hip_Tangential_Acceleration_L_Max_val20*-1;
Hip_Tangential_Acceleration_L_Max_val22=Hip_Tangential_Acceleration_L_Max_val22*-1;

Hip_Tangential_Acceleration_R_Max_val20=Hip_Tangential_Acceleration_R_Max_val20*-1;
Hip_Tangential_Acceleration_R_Max_val22=Hip_Tangential_Acceleration_R_Max_val22*-1;

Hip_Tangential_Acceleration_L_Max_val=Hip_Tangential_Acceleration_L_Max_val19;
Hip_Tangential_Acceleration_L_Min_val=Hip_Tangential_Acceleration_R_Max_val20;
Hip_Tangential_Acceleration_R_Max_val=Hip_Tangential_Acceleration_R_Max_val21;
Hip_Tangential_Acceleration_R_Min_val=Hip_Tangential_Acceleration_R_Max_val22;

Knee_Tangential_Acceleration_L_Max_val20=Knee_Tangential_Acceleration_L_Max_val20*-1;
Knee_Tangential_Acceleration_L_Max_val22=Knee_Tangential_Acceleration_L_Max_val22*-1;

Knee_Tangential_Acceleration_R_Max_val20=Knee_Tangential_Acceleration_R_Max_val20*-1;
Knee_Tangential_Acceleration_R_Max_val22=Knee_Tangential_Acceleration_R_Max_val22*-1;

Knee_Tangential_Acceleration_L_Max_val=Knee_Tangential_Acceleration_L_Max_val19;
Knee_Tangential_Acceleration_L_Min_val=Knee_Tangential_Acceleration_L_Max_val20;
Knee_Tangential_Acceleration_R_Max_val=Knee_Tangential_Acceleration_R_Max_val21;
Knee_Tangential_Acceleration_R_Min_val=Knee_Tangential_Acceleration_R_Max_val22;

Ankle_Tangential_Acceleration_L_Max_val20=Ankle_Tangential_Acceleration_L_Max_val20*-1;
Ankle_Tangential_Acceleration_L_Max_val22=Ankle_Tangential_Acceleration_L_Max_val22*-1;

Ankle_Tangential_Acceleration_R_Max_val20=Ankle_Tangential_Acceleration_R_Max_val20*-1;
Ankle_Tangential_Acceleration_R_Max_val22=Ankle_Tangential_Acceleration_R_Max_val22*-1;

Ankle_Tangential_Acceleration_L_Max_val=Ankle_Tangential_Acceleration_L_Max_val19;
Ankle_Tangential_Acceleration_L_Min_val=Ankle_Tangential_Acceleration_L_Max_val20;
Ankle_Tangential_Acceleration_R_Max_val=Ankle_Tangential_Acceleration_R_Max_val21;
Ankle_Tangential_Acceleration_R_Min_val=Ankle_Tangential_Acceleration_R_Max_val22;


%% Plot graphs

Sagital=get(handles.Sagital,'Value');
Frontal=get(handles.Frontal,'Value');

if Sagital==0
elseif Sagital==1

% Left Hip %
Y_max1= max(Hip_Angle_L_Max_val+5);
Y_Min=min(Hip_Angle_L_Min_val);

axesHandle1= findobj(gcf,'Tag','axes1');
plot(axesHandle1,Hip_Angle_L(1:5000)); 

for i=1:size(idx1)
     line(axesHandle1,[idx1(i),idx1(i)],[Hip_Angle_L_Max_val(i)-5,Hip_Angle_L_Max_val(i)],'color','r','LineStyle','--')
 line(axesHandle1,[idx1(i)-100,idx1(i)],[Hip_Angle_L_Max_val(i),Hip_Angle_L_Max_val(i)],'color','r','LineStyle','--')
end

for i=1:size(idx11)
 line(axesHandle1,[idx11(i) idx11(i)],[Hip_Angle_L_Min_val(i)-5,Hip_Angle_L_Min_val(i)],'color','g','LineStyle','--')
 line(axesHandle1,[idx11(i)-100,idx11(i)],[Hip_Angle_L_Min_val(i),Hip_Angle_L_Min_val(i)],'color','g','LineStyle','--')
end

line(axesHandle1,[idx3 idx3],[0,Y_max1],'color','k','LineStyle','-')
line(axesHandle1,[idx33 idx33],[0,Y_max1],'color','m','LineStyle','-')
X_length=5000;

set(handles.axes1,'XColor', 'w');
set(handles.axes1,'YColor', 'w');

axis(axesHandle1,[0,X_length,(Y_Min-10),(Y_max1+5)])


% Right Hip %

Y_max2= max(Hip_Angle_R_Max_val+5);
Y_min2=min(Hip_Angle_R_Min_val);

axesHandle2= findobj(gcf,'Tag','axes5');
plot(axesHandle2,Hip_Angle_R(1:5000));

for i=1:size(idx2)
line(axesHandle2,[idx2(i) idx2(i)],[Hip_Angle_R_Max_val(i)-5,Hip_Angle_R_Max_val(i)],'color','r','LineStyle','--')
line(axesHandle2,[idx2(i)-100,idx2(i)],[Hip_Angle_R_Max_val(i),Hip_Angle_R_Max_val(i)],'color','r','LineStyle','--')
end

for i=1:size(idx22)
line(axesHandle2,[idx22(i) idx22(i)],[Hip_Angle_R_Min_val(i)-5,Hip_Angle_R_Min_val(i)],'color','g','LineStyle','--')
line(axesHandle2,[idx22(i)-100,idx22(i)],[Hip_Angle_R_Min_val(i),Hip_Angle_R_Min_val(i)],'color','g','LineStyle','--')
end

line(axesHandle2,[idx4 idx4],[0,Y_max2],'color','k','LineStyle','-')
line(axesHandle2,[idx44 idx44],[0,Y_max2],'color','m','LineStyle','-')

set(handles.axes5,'XColor', 'w');
set(handles.axes5,'YColor', 'w');
axis(axesHandle2,[0,X_length,(Y_min2-10),(Y_max2+5)])


% Left Knee %

axesHandle3= findobj(gcf,'Tag','axes2');

Y_max3= max(Knee_Angle_L_Max_val+5);
Y_min3=min(Knee_Angle_L_Min_val);

plot(axesHandle3,Knee_Angle_L(1:5000));

for i=1:size(idx3)
line(axesHandle3,[idx3(i) idx3(i)],[Knee_Angle_L_Max_val(i)-5,Knee_Angle_L_Max_val(i)],'color','r','LineStyle','--')
line(axesHandle3,[idx3(i)-100,idx3(i)],[Knee_Angle_L_Max_val(i),Knee_Angle_L_Max_val(i)],'color','r','LineStyle','--')
end
for i=1:size(idx33)
line(axesHandle3,[idx33(i) idx33(i)],[Knee_Angle_L_Min_val(i)-5,Knee_Angle_L_Min_val(i)],'color','g','LineStyle','--')
line(axesHandle3,[idx33(i)-100,idx33(i)],[Knee_Angle_L_Min_val(i),Knee_Angle_L_Min_val(i)],'color','g','LineStyle','--')
end

set(handles.axes2,'XColor', 'w');
set(handles.axes2,'YColor', 'w');
axis(axesHandle3,[0,X_length,(Y_min3-10),(Y_max3+5)])


% Right Knee %

axesHandle4= findobj(gcf,'Tag','axes6');
Y_max4= max(Knee_Angle_R_Max_val+5);
Y_min4=min(Knee_Angle_R_Min_val);

plot(axesHandle4,Knee_Angle_R(1:5000));

for i=1:size(idx4)
line(axesHandle4,[idx4(i) idx4(i)],[Knee_Angle_R_Max_val(i)-5,Knee_Angle_R_Max_val(i)],'color','r','LineStyle','--')
line(axesHandle4,[idx4(i)-100,idx4(i)],[Knee_Angle_R_Max_val(i),Knee_Angle_R_Max_val(i)],'color','r','LineStyle','--')
end

for i=1:size(idx44)
line(axesHandle4,[idx44(i) idx44(i)],[Knee_Angle_R_Min_val(i)-5,Knee_Angle_R_Min_val(i)],'color','g','LineStyle','--')
line(axesHandle4,[idx44(i)-100,idx44(i)],[Knee_Angle_R_Min_val(i),Knee_Angle_R_Min_val(i)],'color','g','LineStyle','--')
end

set(handles.axes6,'XColor', 'w');
set(handles.axes6,'YColor', 'w');

axis(axesHandle4,[0,X_length,(Y_min4-10),(Y_max4+5)])

% Left ankle %

axesHandle5= findobj(gcf,'Tag','axes3');
Y_max5= max(Ankle_Angle_L_Max_val+5);
Y_min5=min(Ankle_Angle_L_Min_val);


plot(axesHandle5,Ankle_Angle_L(1:5000));

for i=1:size(idx5)
line(axesHandle5,[idx5(i) idx5(i)],[Ankle_Angle_L_Max_val(i)-5,Ankle_Angle_L_Max_val(i)],'color','r','LineStyle','--')
line(axesHandle5,[idx5(i)-100,idx5(i)],[Ankle_Angle_L_Max_val(i),Ankle_Angle_L_Max_val(i)],'color','r','LineStyle','--')
end
for i=1:size(idx55)
line(axesHandle5,[idx55(i) idx55(i)],[Ankle_Angle_L_Min_val(i)-5,Ankle_Angle_L_Min_val(i)],'color','g','LineStyle','--')
line(axesHandle5,[idx55(i)-100,idx55(i)],[Ankle_Angle_L_Min_val(i),Ankle_Angle_L_Min_val(i)],'color','g','LineStyle','--')
end
line(axesHandle5,[idx3 idx3],[0,Y_max5],'color','k','LineStyle','-')
line(axesHandle5,[idx33 idx33],[0,Y_max5],'color','m','LineStyle','-')

set(handles.axes3,'XColor', 'w');
set(handles.axes3,'YColor', 'w');
axis(axesHandle5,[0,X_length,(Y_min5-10),(Y_max5+5)])


%Right Ankle %

axesHandle6= findobj(gcf,'Tag','axes7');
Y_max6= max(Ankle_Angle_R_Max_val+5);
Y_min6=min(Ankle_Angle_R_Min_val);

plot(axesHandle6,Ankle_Angle_R(1:5000));

for i=1:size(idx6)
line(axesHandle6,[idx6(i) idx6(i)],[Ankle_Angle_R_Max_val(i)-5,Ankle_Angle_R_Max_val(i)],'color','r','LineStyle','--')
line(axesHandle6,[idx6(i)-100,idx6(i)],[Ankle_Angle_R_Max_val(i),Ankle_Angle_R_Max_val(i)],'color','r','LineStyle','--')
end
for i=1:size(idx66)
line(axesHandle6,[idx66(i) idx66(i)],[Ankle_Angle_R_Min_val(i)-5,Ankle_Angle_R_Min_val(i)],'color','g','LineStyle','--')
line(axesHandle6,[idx66(i)-100,idx66(i)],[Ankle_Angle_R_Min_val(i),Ankle_Angle_R_Min_val(i)],'color','g','LineStyle','--')
end
line(axesHandle6,[idx4 idx4],[0,Y_max6],'color','k','LineStyle','-')
line(axesHandle6,[idx44 idx44],[0,Y_max6],'color','m','LineStyle','-')
set(handles.axes7,'XColor', 'w');
set(handles.axes7,'YColor', 'w');

axis(axesHandle6,[0,X_length,(Y_min6-10),(Y_max6+5)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set metric values %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Hip_Angle_L_Min_val=mean(Hip_Angle_L_Min_val);
Hip_Angle_R_Min_val=mean(Hip_Angle_R_Min_val);
Hip_Angle_L_Max_val=mean(Hip_Angle_L_Max_val);
Hip_Angle_R_Max_val=mean(Hip_Angle_R_Max_val);

set(handles.Left_Hip_Flex,'String','');
set(handles.Left_Hip_Flex,'String',Hip_Angle_L_Min_val);          
set(handles.Right_Hip_Flex,'String','');
set(handles.Right_Hip_Flex,'String',Hip_Angle_R_Min_val);
set(handles.Left_Hip_Ext,'String','');
set(handles.Left_Hip_Ext,'String',Hip_Angle_L_Max_val);          
set(handles.Right_Hip_Ext,'String','');
set(handles.Right_Hip_Ext,'String',Hip_Angle_R_Max_val);


Knee_Angle_L_Min_val=mean(Knee_Angle_L_Min_val);
Knee_Angle_L_Max_val=mean(Knee_Angle_L_Max_val);
Knee_Angle_R_Min_val=mean(Knee_Angle_R_Min_val);
Knee_Angle_R_Max_val=mean(Knee_Angle_R_Max_val);

set(handles.Left_Knee_Flex,'String','');
set(handles.Left_Knee_Flex,'String',Knee_Angle_L_Min_val);
set(handles.Left_Knee_Ext,'String','');
set(handles.Left_Knee_Ext,'String',Knee_Angle_L_Max_val);
set(handles.Right_Knee_Flex,'String','');
set(handles.Right_Knee_Flex,'String',Knee_Angle_R_Min_val);
set(handles.Right_Knee_Ext,'String','');
set(handles.Right_Knee_Ext,'String',Knee_Angle_R_Max_val);

Ankle_Angle_L_Min_val=mean(Ankle_Angle_L_Min_val);
Ankle_Angle_L_Max_val=mean(Ankle_Angle_L_Max_val);
Ankle_Angle_R_Min_val=mean(Ankle_Angle_R_Min_val);
Ankle_Angle_R_Max_val=mean(Ankle_Angle_R_Max_val);

set(handles.Left_Ankle_Flex,'String','');
set(handles.Left_Ankle_Flex,'String',Ankle_Angle_L_Min_val);
set(handles.Left_Ankle_Ext,'String','');
set(handles.Left_Ankle_Ext,'String',Ankle_Angle_L_Max_val);
set(handles.Right_Ankle_Flex,'String','');
set(handles.Right_Ankle_Flex,'String',Ankle_Angle_R_Min_val);
set(handles.Right_Ankle_Ext,'String','');
set(handles.Right_Ankle_Ext,'String',Ankle_Angle_R_Max_val);

Hip_Angle_L_Knee_ext=mean(Hip_Angle_L_Knee_ext);
Hip_Angle_L_Knee_Flex=mean(Hip_Angle_L_Knee_Flex);
Hip_Angle_R_Knee_Flex=mean(Hip_Angle_R_Knee_Flex);
Hip_Angle_R_Knee_ext=mean(Hip_Angle_R_Knee_ext);

set(handles.Left_Hip_Ext_Knee,'String','');
set(handles.Left_Hip_Ext_Knee,'String',Hip_Angle_L_Knee_ext);
set(handles.Left_Hip_Flex_Knee,'String','');
set(handles.Left_Hip_Flex_Knee,'String', Hip_Angle_L_Knee_Flex);
set(handles.Right_Hip_Knee_Flex,'String','');
set(handles.Right_Hip_Knee_Flex,'String', Hip_Angle_R_Knee_Flex);
set(handles.Right_Hip_Ext_Knee,'String','');
set(handles.Right_Hip_Ext_Knee,'String', Hip_Angle_R_Knee_ext);

Ankle_Angle_L_Knee_Flex=mean(Ankle_Angle_L_Knee_Flex);
Ankle_Angle_L_Knee_ext=mean(Ankle_Angle_L_Knee_ext);
Ankle_Angle_R_Knee_Flex=mean(Ankle_Angle_R_Knee_Flex);
Ankle_Angle_R_Knee_ext=mean(Ankle_Angle_R_Knee_ext);

set(handles.Left_Ankle_Flex_Knee,'String','');
set(handles.Left_Ankle_Flex_Knee,'String', Ankle_Angle_L_Knee_Flex);
set(handles.Left_Ankle_Ext_Knee,'String','');
set(handles.Left_Ankle_Ext_Knee,'String',  Ankle_Angle_L_Knee_ext);
set(handles.Right_Ankle_Flex_Knee,'String','');
set(handles.Right_Ankle_Flex_Knee,'String',   Ankle_Angle_R_Knee_Flex);
set(handles.Right_Ankle_Ext_Knee,'String','');
set(handles.Right_Ankle_Ext_Knee,'String', Ankle_Angle_R_Knee_ext);

Hip_RoM_R=Hip_Angle_R_Max_val-Hip_Angle_R_Min_val;
Hip_RoM_L=Hip_Angle_L_Max_val-Hip_Angle_L_Min_val;
Knee_RoM_R=Knee_Angle_R_Max_val-Knee_Angle_R_Min_val;
Knee_RoM_L=Knee_Angle_L_Max_val-Knee_Angle_L_Min_val;
Ankle_RoM_R=Ankle_Angle_R_Max_val-Ankle_Angle_R_Min_val;
Ankle_RoM_L=Ankle_Angle_L_Max_val-Ankle_Angle_L_Min_val;


set(handles.Rom_Right_Hip,'String','');
set(handles.Rom_Right_Hip,'String', Hip_Angle_R_Max_val-Hip_Angle_R_Min_val);

set(handles.Rom_Left_Hip,'String','');
set(handles.Rom_Left_Hip,'String', Hip_Angle_L_Max_val-Hip_Angle_L_Min_val);

set(handles.Rom_Right_Knee,'String','');
set(handles.Rom_Right_Knee,'String', Knee_Angle_R_Max_val-Knee_Angle_R_Min_val);

set(handles.Rom_Left_Knee,'String','');
set(handles.Rom_Left_Knee,'String', Knee_Angle_L_Max_val-Knee_Angle_L_Min_val);

set(handles.Rom_Right_Ankle,'String','');
set(handles.Rom_Right_Ankle,'String', Ankle_Angle_R_Max_val-Ankle_Angle_R_Min_val);

set(handles.Rom_Left_Ankle,'String','');
set(handles.Rom_Left_Ankle,'String', Ankle_Angle_L_Max_val-Ankle_Angle_L_Min_val);



datacursormode on
end

if Frontal ==0
elseif Frontal==1
    axes(handles.axes1)
cla reset
axes(handles.axes2)
cla reset
    axes(handles.axes3)
cla reset     
axes(handles.axes5)
cla reset
    axes(handles.axes6)
cla reset
axes(handles.axes7)
 cla reset
 


    
set(handles.Left_Hip_Flex,'String',''); 
set(handles.Right_Hip_Flex,'String','');
set(handles.Left_Hip_Ext,'String','');         
set(handles.Right_Hip_Ext,'String','');
set(handles.Left_Knee_Flex,'String','');
set(handles.Left_Knee_Ext,'String','');
set(handles.Right_Knee_Flex,'String','');
set(handles.Right_Knee_Ext,'String','');
set(handles.Left_Ankle_Flex,'String','');
set(handles.Left_Ankle_Ext,'String','');
set(handles.Right_Ankle_Flex,'String','');
set(handles.Right_Ankle_Ext,'String','');
set(handles.Left_Hip_Ext_Knee,'String','');
set(handles.Left_Hip_Flex_Knee,'String','');
set(handles.Right_Hip_Knee_Flex,'String','');
set(handles.Right_Hip_Ext_Knee,'String','');
set(handles.Left_Ankle_Flex_Knee,'String','');
set(handles.Left_Ankle_Ext_Knee,'String','');
set(handles.Right_Ankle_Flex_Knee,'String','');
set(handles.Right_Ankle_Ext_Knee,'String','');
set(handles.Rom_Right_Hip,'String','');
set(handles.Rom_Left_Hip,'String','');
set(handles.Rom_Right_Knee,'String','');
set(handles.Rom_Left_Knee,'String','');
set(handles.Rom_Right_Ankle,'String','');
set(handles.Rom_Left_Ankle,'String','');

datacursormode on
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles) 
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global r t y i q w e  OutputFile file Torso_Length Sternum_Height Pelvis_Height Left_Arm_Length Right_Arm_Length Left_Upper_Arm_Length...
 Left_Lower_Arm_Length left_Upper_Leg_Length Left_Shank_Length Left_Foot_Length Right_Upper_Arm_Length...
  Right_Lower_Arm_Length Right_Upper_Leg_Length Right_Shank_Length Right_Foot_Length fn d Angle_Ankle_L_plot Angle_Ankle_R_plot Angle_Hip_L_plot Angle_Hip_R_plot...
  Angle_Knee_L_plot Angle_Knee_R_plot Ankle_Angle_R Ankle_Angle_L Knee_Angle_R Knee_Angle_L Hip_Angle_R Hip_Angle_L Hip_Angle_L_Max_val Hip_Angle_R_Max_val Hip_Angle_L_Min_val Hip_Angle_R_Min_val idx1 idx11 idx2 idx22 Knee_Angle_L_Max_val idx3 Knee_Angle_L_Min_val idx33...
  Knee_Angle_R_Max_val idx4 Knee_Angle_R_Min_val idx44 Ankle_Angle_L_Max_val idx5 Ankle_Angle_L_Min_val idx55 Ankle_Angle_R_Max_val idx6 Ankle_Angle_R_Min_val idx66...
  Hip_Angle_L_Knee_Flex Hip_Angle_L_Knee_ext Hip_Angle_R_Knee_Flex Hip_Angle_R_Knee_ext Ankle_Angle_L_Knee_Flex Ankle_Angle_L_Knee_ext Ankle_Angle_R_Knee_Flex Ankle_Angle_R_Knee_ext...
  Tangenital_Front_hip_L Tangenital_Back_hip_L Tangenital_Front_hip_R Tangenital_Back_hip_R...
 Tangenital_Front_knee_L Tangenital_Back_knee_L Tangenital_Front_knee_R Tangenital_Back_knee_R...
 Tangenital_Front_ankle_R Tangenital_Back_ankle_R Tangenital_Back_ankle_L Tangenital_Front_ankle_L Tangenital_Vel_Back_hip_L Tangenital_Vel_Front_hip_L...
 Tangenital_Vel_Front_hip_negative_up_L Tangenital_Vel_Front_hip_negative_down_L Tangenital_Vel_Back_hip_positive_up_L Tangenital_Vel_Back_hip_positive_down_L...
  Tangenital_Vel_Back_hip_positive_up_R Tangenital_Vel_Back_hip_positive_down_R Tangenital_Vel_Front_hip_negative_up_R Tangenital_Vel_Front_hip_negative_down_R...
 Tangenital_Vel_Front_knee_negative_up_L Tangenital_Vel_Front_knee_negative_down_L Tangenital_Vel_Back_knee_positive_up_L Tangenital_Vel_Back_knee_positive_down_L...
 Tangenital_Vel_Back_knee_positive_up_R Tangenital_Vel_Back_knee_positive_down_R Tangenital_Vel_Front_knee_negative_up_R Tangenital_Vel_Front_knee_negative_down_R...
 Tangenital_Vel_Front_ankle_negative_up_L Tangenital_Vel_Front_ankle_negative_down_L Tangenital_Vel_Back_ankle_positive_up_L Tangenital_Vel_Back_ankle_positive_down_L...
 Tangenital_Vel_Back_ankle_positive_up_R Tangenital_Vel_Back_ankle_positive_down_R Tangenital_Vel_Front_ankle_negative_up_R Tangenital_Vel_Front_ankle_negative_down_R...
 Tangenital_Acceleration_Front_hip_negative_up_L Tangenital_Acceleration_Front_hip_negative_down_L Tangenital_Acceleration_Back_hip_positive_up_L Tangenital_Acceleration_Back_hip_positive_down_L... 
Tangenital_Acceleration_Back_hip_positive_up_R Tangenital_Acceleration_Back_hip_positive_down_R Tangenital_Acceleration_Front_hip_negative_up_R Tangenital_Acceleration_Front_hip_negative_down_R...
Tangenital_Acceleration_Front_knee_negative_up_L Tangenital_Acceleration_Front_knee_negative_down_L Tangenital_Acceleration_Back_knee_positive_up_L Tangenital_Acceleration_Back_knee_positive_down_L...
Tangenital_Acceleration_Back_knee_positive_up_R Tangenital_Acceleration_Back_knee_positive_down_R Tangenital_Acceleration_Front_knee_negative_up_R Tangenital_Acceleration_Front_knee_negative_down_R...
Tangenital_Acceleration_Front_ankle_negative_up_L Tangenital_Acceleration_Front_ankle_negative_down_L Tangenital_Acceleration_Back_ankle_positive_up_L Tangenital_Acceleration_Back_ankle_positive_down_L...
Tangenital_Acceleration_Back_ankle_positive_up_R Tangenital_Acceleration_Back_ankle_positive_down_R Tangenital_Acceleration_Front_ankle_negative_up_R Tangenital_Acceleration_Front_ankle_negative_down_R%#ok<*NUSED>

i=[];
q=[];
w=[];
e=[];
r =[];
t =[];
y=[];
close Cycling_Graphs

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Metrics %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Left_Hip_Flex_Callback(hObject, eventdata, handles) 
% hObject    handle to Left_Hip_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Left_Hip_Flex as text
%        str2double(get(hObject,'String')) returns contents of Left_Hip_Flex as a double


% --- Executes during object creation, after setting all properties.
function Left_Hip_Flex_CreateFcn(hObject, eventdata, handles) %#ok<*INUSD>
% hObject    handle to Left_Hip_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Right_Hip_Flex_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Hip_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Hip_Flex as text
%        str2double(get(hObject,'String')) returns contents of Right_Hip_Flex as a double


% --- Executes during object creation, after setting all properties.
function Right_Hip_Flex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Hip_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Left_Knee_Flex_Callback(hObject, eventdata, handles)
% hObject    handle to Left_Knee_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Left_Knee_Flex as text
%        str2double(get(hObject,'String')) returns contents of Left_Knee_Flex as a double


% --- Executes during object creation, after setting all properties.
function Left_Knee_Flex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Left_Knee_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Left_Hip_Ext_Callback(hObject, eventdata, handles)
% hObject    handle to Left_Hip_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Left_Hip_Ext as text
%        str2double(get(hObject,'String')) returns contents of Left_Hip_Ext as a double


% --- Executes during object creation, after setting all properties.
function Left_Hip_Ext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Left_Hip_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Right_Hip_Ext_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Hip_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Hip_Ext as text
%        str2double(get(hObject,'String')) returns contents of Right_Hip_Ext as a double


% --- Executes during object creation, after setting all properties.
function Right_Hip_Ext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Hip_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Left_Knee_Ext_Callback(hObject, eventdata, handles)
% hObject    handle to Left_Knee_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Left_Knee_Ext as text
%        str2double(get(hObject,'String')) returns contents of Left_Knee_Ext as a double


% --- Executes during object creation, after setting all properties.
function Left_Knee_Ext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Left_Knee_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Right_Knee_Flex_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Knee_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Knee_Flex as text
%        str2double(get(hObject,'String')) returns contents of Right_Knee_Flex as a double


% --- Executes during object creation, after setting all properties.
function Right_Knee_Flex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Knee_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Right_Knee_Ext_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Knee_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Knee_Ext as text
%        str2double(get(hObject,'String')) returns contents of Right_Knee_Ext as a double


% --- Executes during object creation, after setting all properties.
function Right_Knee_Ext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Knee_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Left_Ankle_Flex_Callback(hObject, eventdata, handles)
% hObject    handle to Left_Ankle_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Left_Ankle_Flex as text
%        str2double(get(hObject,'String')) returns contents of Left_Ankle_Flex as a double


% --- Executes during object creation, after setting all properties.
function Left_Ankle_Flex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Left_Ankle_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Left_Ankle_Ext_Callback(hObject, eventdata, handles)
% hObject    handle to Left_Ankle_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Left_Ankle_Ext as text
%        str2double(get(hObject,'String')) returns contents of Left_Ankle_Ext as a double


% --- Executes during object creation, after setting all properties.
function Left_Ankle_Ext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Left_Ankle_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Right_Ankle_Flex_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Ankle_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Ankle_Flex as text
%        str2double(get(hObject,'String')) returns contents of Right_Ankle_Flex as a double


% --- Executes during object creation, after setting all properties.
function Right_Ankle_Flex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Ankle_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Right_Ankle_Ext_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Ankle_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Ankle_Ext as text
%        str2double(get(hObject,'String')) returns contents of Right_Ankle_Ext as a double


% --- Executes during object creation, after setting all properties.
function Right_Ankle_Ext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Ankle_Ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Left_Hip_Flex_Knee_Callback(hObject, eventdata, handles)
% hObject    handle to Left_Hip_Flex_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Left_Hip_Flex_Knee as text
%        str2double(get(hObject,'String')) returns contents of Left_Hip_Flex_Knee as a double


% --- Executes during object creation, after setting all properties.
function Left_Hip_Flex_Knee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Left_Hip_Flex_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Right_Hip_Knee_Flex_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Hip_Knee_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Hip_Knee_Flex as text
%        str2double(get(hObject,'String')) returns contents of Right_Hip_Knee_Flex as a double


% --- Executes during object creation, after setting all properties.
function Right_Hip_Knee_Flex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Hip_Knee_Flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Left_Hip_Ext_Knee_Callback(hObject, eventdata, handles)
% hObject    handle to Left_Hip_Ext_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Left_Hip_Ext_Knee as text
%        str2double(get(hObject,'String')) returns contents of Left_Hip_Ext_Knee as a double


% --- Executes during object creation, after setting all properties.
function Left_Hip_Ext_Knee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Left_Hip_Ext_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Right_Hip_Ext_Knee_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Hip_Ext_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Hip_Ext_Knee as text
%        str2double(get(hObject,'String')) returns contents of Right_Hip_Ext_Knee as a double


% --- Executes during object creation, after setting all properties.
function Right_Hip_Ext_Knee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Hip_Ext_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Left_Ankle_Flex_Knee_Callback(hObject, eventdata, handles)
% hObject    handle to Left_Ankle_Flex_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Left_Ankle_Flex_Knee as text
%        str2double(get(hObject,'String')) returns contents of Left_Ankle_Flex_Knee as a double


% --- Executes during object creation, after setting all properties.
function Left_Ankle_Flex_Knee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Left_Ankle_Flex_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Left_Ankle_Ext_Knee_Callback(hObject, eventdata, handles)
% hObject    handle to Left_Ankle_Ext_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Left_Ankle_Ext_Knee as text
%        str2double(get(hObject,'String')) returns contents of Left_Ankle_Ext_Knee as a double


% --- Executes during object creation, after setting all properties.
function Left_Ankle_Ext_Knee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Left_Ankle_Ext_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Right_Ankle_Flex_Knee_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Ankle_Flex_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Ankle_Flex_Knee as text
%        str2double(get(hObject,'String')) returns contents of Right_Ankle_Flex_Knee as a double


% --- Executes during object creation, after setting all properties.
function Right_Ankle_Flex_Knee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Ankle_Flex_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Right_Ankle_Ext_Knee_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Ankle_Ext_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Ankle_Ext_Knee as text
%        str2double(get(hObject,'String')) returns contents of Right_Ankle_Ext_Knee as a double


% --- Executes during object creation, after setting all properties.
function Right_Ankle_Ext_Knee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Ankle_Ext_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Sagital.
function Sagital_Callback(hObject, eventdata, handles)
% hObject    handle to Sagital (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Sagital


% --- Executes on button press in Frontal.
function Frontal_Callback(hObject, eventdata, handles)
% hObject    handle to Frontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Frontal



function Rom_Right_Hip_Callback(hObject, eventdata, handles)
% hObject    handle to Rom_Right_Hip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rom_Right_Hip as text
%        str2double(get(hObject,'String')) returns contents of Rom_Right_Hip as a double


% --- Executes during object creation, after setting all properties.
function Rom_Right_Hip_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rom_Right_Hip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rom_Right_Knee_Callback(hObject, eventdata, handles)
% hObject    handle to Rom_Right_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rom_Right_Knee as text
%        str2double(get(hObject,'String')) returns contents of Rom_Right_Knee as a double


% --- Executes during object creation, after setting all properties.
function Rom_Right_Knee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rom_Right_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rom_Right_Ankle_Callback(hObject, eventdata, handles)
% hObject    handle to Rom_Right_Ankle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rom_Right_Ankle as text
%        str2double(get(hObject,'String')) returns contents of Rom_Right_Ankle as a double


% --- Executes during object creation, after setting all properties.
function Rom_Right_Ankle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rom_Right_Ankle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rom_Left_Hip_Callback(hObject, eventdata, handles)
% hObject    handle to Rom_Left_Hip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rom_Left_Hip as text
%        str2double(get(hObject,'String')) returns contents of Rom_Left_Hip as a double


% --- Executes during object creation, after setting all properties.
function Rom_Left_Hip_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rom_Left_Hip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rom_Left_Knee_Callback(hObject, eventdata, handles)
% hObject    handle to Rom_Left_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rom_Left_Knee as text
%        str2double(get(hObject,'String')) returns contents of Rom_Left_Knee as a double


% --- Executes during object creation, after setting all properties.
function Rom_Left_Knee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rom_Left_Knee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rom_Left_Ankle_Callback(hObject, eventdata, handles)
% hObject    handle to Rom_Left_Ankle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rom_Left_Ankle as text
%        str2double(get(hObject,'String')) returns contents of Rom_Left_Ankle as a double


% --- Executes during object creation, after setting all properties.
function Rom_Left_Ankle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rom_Left_Ankle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

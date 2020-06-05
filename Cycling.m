function varargout = Cycling(varargin)
% CYCLING MATLAB code for Cycling.fig
%      CYCLING, by itself, creates a new CYCLING or raises the existing
%      singleton*.
%
%      H = CYCLING returns the handle to a new CYCLING or the handle to
%      the existing singleton*.
%
%      CYCLING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CYCLING.M with the given input arguments.
%
%      CYCLING('Property','Value',...) creates a new CYCLING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Cycling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Cycling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Cycling

% Last Modified by GUIDE v2.5 11-Apr-2017 14:00:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Cycling_OpeningFcn, ...
                   'gui_OutputFcn',  @Cycling_OutputFcn, ...
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


% --- Executes just before Cycling is made visible.
function Cycling_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Cycling (see VARARGIN)

% Choose default command line output for Cycling
handles.output = hObject;



% UIWAIT makes Cycling wait for user response (see UIRESUME)
% uiwait(handles.figure1);
Bicycle=imread('C:\Users\sm21438\Documents\Cardiff Met\Biomechanics\Sport Science Support\Bicycle.jpg');
Person=imread('C:\Users\sm21438\Documents\Cardiff Met\Biomechanics\Sport Science Support\Person.jpg');
axes(handles.axes1);
imshow(Bicycle);

axes(handles.axes2);
imshow(Person);
% Update handles structure
guidata(hObject, handles);


% Load static Trial %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in Load_static.
function Load_static_Callback(hObject, eventdata, handles)
% hObject    handle to Load_static (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fn file d
    [file,path] = uigetfile({'*.tsv;*.c3d;*.mat;*.wii', '.tsv, .c3d, .mat and .wii files'}, 'Pick a .tsv, .c3d, .mat, or .wii file');
    fn = [path file];
    
if ~ischar(fn) %Check if input is given as string - BB 20120413 (does not work if file ending is given)
    disp([10, 'Static*',10]);
   
    msgbox('File Loaded');
    return
     
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extract static Trial Parameters %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in Extract_parameters.
function Extract_parameters_Callback(hObject, eventdata, handles)
% hObject    handle to Extract_parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global fn Torso_Length Sternum_Height Pelvis_Height Left_Arm_Length Right_Arm_Length Left_Upper_Arm_Length...
Left_Lower_Arm_Length left_Upper_Leg_Length Left_Shank_Length Left_Foot_Length Right_Upper_Arm_Length...
 Right_Lower_Arm_Length Right_Upper_Leg_Length Right_Shank_Length Right_Foot_Length d Left_GT_Length Right_GT_Length Height Weight...
  Saddle_height Seat_Tube_length Ground_Saddle_Height  Crank_Lengths HandleBar_Height  Top_Tube_Length Handlebar_Extension Saddle_handlebar_length Saddle_set_back...
  Saddle_Angle data 


d=[];
ITF = btkEmulateC3Dserver(); %#ok<*NASGU>
H = btkReadAcquisition(fn);
 % getsmetadata %
d.Metadata=btkGetMetaData(H);  
%marker names and values %
d.markerName=btkGetMarkers(H);
% Firstframe %
d.firstframe=btkGetFirstFrame(H); 
% lastframe %
d.lastframe=btkGetLastFrame(H);
d.exception=[];
% marker data %
d.data=btkGetMarkersValues(H);
d.anglesnames= btkGetAngles(H);
d.angles=btkGetAnglesValues(H);

% Find if markers are present in Static %

% Head %
d.EXISTS.FHD_L=any(strcmp('FHD_L',fieldnames(d.markerName)));
if d.EXISTS.FHD_L ==0
elseif d.EXISTS.FHD_L ~=0
d.mean.FHD_L=mean(d.markerName.FHD_L);
end

d.EXISTS.FHD_R=any(strcmp('FHD_R',fieldnames(d.markerName)));
if d.EXISTS.FHD_R ==0
elseif d.EXISTS.FHD_R ~=0
d.mean.FHD_R=mean(d.markerName.FHD_R);
end

d.EXISTS.BHD_L=any(strcmp('BHD_L',fieldnames(d.markerName)));
if d.EXISTS.BHD_L ==0
elseif d.EXISTS.BHD_L ~=0 
d.mean.BHD_L=mean(d.markerName.BHD_L);
end

d.EXISTS.BHD_R=any(strcmp('BHD_R',fieldnames(d.markerName)));
if d.EXISTS.BHD_R ==0
elseif d.EXISTS.BHD_R ~=0
d.mean.BHD_R=mean(d.markerName.BHD_R);
end

% Torso %
d.EXISTS.C7=any(strcmp('C7',fieldnames(d.markerName)));
if d.EXISTS.C7 ==0
elseif d.EXISTS.C7~=0
d.mean.C7=mean(d.markerName.C7);
end


d.EXISTS.STRN=any(strcmp('STRN',fieldnames(d.markerName)));
if d.EXISTS.STRN ==1
elseif d.EXISTS.STRN ~=1
d.mean.STRN=mean(d.markerName.STRN);
end

d.EXISTS.XIP_PROC=any(strcmp('XIP_PROC',fieldnames(d.markerName)));
if d.EXISTS.XIP_PROC ==0
elseif d.EXISTS.XIP_PROC ~=0
d.mean.XIP_PROC=mean(d.markerName.XIP_PROC);
end

d.EXISTS.ACROM_L=any(strcmp('ACROM_L',fieldnames(d.markerName)));
if d.EXISTS.ACROM_L ==0
elseif d.EXISTS.ACROM_L ~=0
d.mean.ACROM_L=mean(d.markerName.ACROM_L);
end

d.EXISTS.ACROM_R=any(strcmp('ACROM_R',fieldnames(d.markerName)));
if d.EXISTS.ACROM_R ==0
elseif d.EXISTS.ACROM_R ~=0
d.mean.ACROM_R=mean(d.markerName.ACROM_R);
end

d.EXISTS.T10=any(strcmp('T10',fieldnames(d.markerName)));
if d.EXISTS.T10 ==0
elseif d.EXISTS.T10 ~=0
d.mean.T10=mean(d.markerName.T10);
end

% Upper limbs %
d.EXISTS.MED_ELB_L=any(strcmp('MED_ELB_L',fieldnames(d.markerName)));
if d.EXISTS.MED_ELB_L ==0
elseif d.EXISTS.MED_ELB_L ~=0
d.mean.MED_ELB_L=mean(d.markerName.MED_ELB_L);
end

d.EXISTS.LAT_ELB_L=any(strcmp('LAT_ELB_L',fieldnames(d.markerName)));
if d.EXISTS.LAT_ELB_L ==0
elseif d.EXISTS.LAT_ELB_L ~=0
d.mean.LAT_ELB_L=mean(d.markerName.LAT_ELB_L);
end

d.EXISTS.WRA_L=any(strcmp('WRA_L',fieldnames(d.markerName)));
if d.EXISTS.WRA_L ==0
elseif d.EXISTS.WRA_L ~=0
d.mean.WRA_L=mean(d.markerName.WRA_L);
end

d.EXISTS.WRB_L=any(strcmp('WRB_L',fieldnames(d.markerName)));
if d.EXISTS.WRB_L ==0
elseif d.EXISTS.WRB_L ~=0
d.mean.WRB_L=mean(d.markerName.WRB_L);
end

d.EXISTS.FIN_L=any(strcmp('FIN_L',fieldnames(d.markerName)));
if d.EXISTS.FIN_L ==0 
elseif d.EXISTS.FIN_L ~=0
d.mean.FIN_L=mean(d.markerName.FIN_L);
end

d.EXISTS.MED_ELB_R=any(strcmp('MED_ELB_R',fieldnames(d.markerName)));
if d.EXISTS.MED_ELB_R ==0
elseif d.EXISTS.MED_ELB_R ~=0
d.mean.MED_ELB_R=mean(d.markerName.MED_ELB_R);
end

d.EXISTS.LAT_ELB_R=any(strcmp('LAT_ELB_R',fieldnames(d.markerName)));
if d.EXISTS.LAT_ELB_R ==0
elseif d.EXISTS.LAT_ELB_R ~=0
d.mean.LAT_ELB_R=mean(d.markerName.LAT_ELB_R);
end

d.EXISTS.WRA_R=any(strcmp('WRA_R',fieldnames(d.markerName)));
if d.EXISTS.WRA_R ==0
elseif d.EXISTS.WRA_R ~=0
d.mean.WRA_R=mean(d.markerName.WRA_R);
end

d.EXISTS.WRB_R=any(strcmp('WRB_R',fieldnames(d.markerName)));
if d.EXISTS.WRB_R ==0
elseif d.EXISTS.WRB_R ~= 0
d.mean.WRB_R=mean(d.markerName.WRB_R);
end

d.EXISTS.FIN_R=any(strcmp('FIN_R',fieldnames(d.markerName)));
if d.EXISTS.FIN_R ==0
elseif d.EXISTS.FIN_R ~=0
d.mean.FIN_R=mean(d.markerName.FIN_R);
end

% Pelvis %
d.EXISTS.ASIS_L=any(strcmp('ASIS_L',fieldnames(d.markerName)));
if d.EXISTS.ASIS_L ==0
elseif d.EXISTS.ASIS_L ~=0
d.mean.ASIS_L=mean(d.markerName.ASIS_L);
end

d.EXISTS.ASIS_R=any(strcmp('ASIS_R',fieldnames(d.markerName)));
if d.EXISTS.ASIS_R ==0
elseif d.EXISTS.ASIS_R ~=0
d.mean.ASIS_R=mean(d.markerName.ASIS_R);
end

d.EXISTS.IL_CREST_L=any(strcmp('ILCREST_L',fieldnames(d.markerName)));
if d.EXISTS.IL_CREST_L ==0
elseif d.EXISTS.IL_CREST_L ~=0
d.mean.IL_CREST_L=mean(d.markerName.ILCREST_L);
end

d.EXISTS.IL_CREST_R=any(strcmp('ILCREST_R',fieldnames(d.markerName)));
if d.EXISTS.IL_CREST_R ==0
elseif d.EXISTS.IL_CREST_R~=0
d.mean.IL_CREST_R=mean(d.markerName.ILCREST_R);
end

d.EXISTS.PSIS_L=any(strcmp('PSIS_L',fieldnames(d.markerName)));
if d.EXISTS.PSIS_L ==0
elseif d.EXISTS.PSIS_L~=0
d.mean.PSIS_L=mean(d.markerName.PSIS_L);
end

d.EXISTS.PSIS_R=any(strcmp('PSIS_R',fieldnames(d.markerName)));
if d.EXISTS.PSIS_R ==0
elseif d.EXISTS.PSIS_R ~=0
d.mean.PSIS_R=mean(d.markerName.PSIS_R);
end

d.EXISTS.PSIS_R=any(strcmp('PSIS_R',fieldnames(d.markerName)));
if d.EXISTS.PSIS_R ==0
elseif d.EXISTS.PSIS_R ~=0
d.mean.PSIS_R=mean(d.markerName.PSIS_R);
end

d.EXISTS.PSIS_R=any(strcmp('PSIS_R',fieldnames(d.markerName)));
if d.EXISTS.PSIS_R ==0
elseif d.EXISTS.PSIS_R ~=0
d.mean.PSIS_R=mean(d.markerName.PSIS_R);
end

% Lower Limbs %
d.EXISTS.GT_L=any(strcmp('GT_L',fieldnames(d.markerName)));
if d.EXISTS.GT_L ==0
elseif d.EXISTS.GT_L ~=0
d.mean.GT_L=mean(d.markerName.GT_L);
end

d.EXISTS.KNEE_LAT_L=any(strcmp('KNEE_LAT_L',fieldnames(d.markerName)));
if d.EXISTS.KNEE_LAT_L ==0
elseif d.EXISTS.KNEE_LAT_L ~=0
d.mean.KNEE_LAT_L=mean(d.markerName.KNEE_LAT_L);
end

d.EXISTS.MAL_MED_L=any(strcmp('MAL_MED_L',fieldnames(d.markerName)));
if d.EXISTS.MAL_MED_L ==0
elseif d.EXISTS.MAL_MED_L ~=0
d.mean.MAL_MED_L=mean(d.markerName.MAL_MED_L);
end

d.EXISTS.MAL_LAT_L=any(strcmp('MAL_LAT_L',fieldnames(d.markerName)));
if d.EXISTS.MAL_LAT_L ==0
elseif d.EXISTS.MAL_LAT_L~=0
d.mean.MAL_LAT_L=mean(d.markerName.MAL_LAT_L);
end

d.EXISTS.GT_R=any(strcmp('GT_R',fieldnames(d.markerName)));
if d.EXISTS.GT_R ==0
elseif d.EXISTS.GT_R ~=0
d.mean.GT_R=mean(d.markerName.GT_R);
end

d.EXISTS.KNEE_MED_R=any(strcmp('KNEE_MED_R',fieldnames(d.markerName)));
if d.EXISTS.KNEE_MED_R ==0
elseif d.EXISTS.KNEE_MED_R ~=0
d.mean.KNEE_MED_R=mean(d.markerName.KNEE_MED_R);
end

d.EXISTS.KNEE_LAT_R=any(strcmp('KNEE_LAT_R',fieldnames(d.markerName)));
if d.EXISTS.KNEE_LAT_R ==0
elseif d.EXISTS.KNEE_LAT_R ~=0
d.mean.KNEE_LAT_R=mean(d.markerName.KNEE_LAT_R);
end

d.EXISTS.MAL_MED_R=any(strcmp('MAL_MED_R',fieldnames(d.markerName)));
if d.EXISTS.MAL_MED_R ==0
elseif d.EXISTS.MAL_MED_R~=0
d.mean.MAL_MED_R=mean(d.markerName.MAL_MED_R);
end

d.EXISTS.MAL_LAT_R=any(strcmp('MAL_LAT_R',fieldnames(d.markerName)));
if d.EXISTS.MAL_LAT_R  ==0
elseif d.EXISTS.MAL_LAT_R~=0 
d.mean.MAL_LAT_R=mean(d.markerName.MAL_LAT_R);
end

% Feet %
d.EXISTS.TOE_L=any(strcmp('TOE_L',fieldnames(d.markerName)));
if d.EXISTS.TOE_L ==0
elseif d.EXISTS.TOE_L ~=0
d.mean.TOE_L=mean(d.markerName.TOE_L);
end

d.EXISTS.MTP5_L=any(strcmp('MTP5_L',fieldnames(d.markerName)));
if d.EXISTS.MTP5_L ==0
elseif d.EXISTS.MTP5_L~=0
d.mean.MTP5_L=mean(d.markerName.MTP5_L);
end

d.EXISTS.MTP1_L=any(strcmp('MTP1_L',fieldnames(d.markerName)));
if d.EXISTS.MTP1_L ==0
elseif d.EXISTS.MTP1_L ~=0
d.mean.MTP1_L=mean(d.markerName.MTP1_L);
end

d.EXISTS.HEEL_L=any(strcmp('HEEL_L',fieldnames(d.markerName)));
if d.EXISTS.HEEL_L ==0
elseif d.EXISTS.HEEL_L ~=0
d.mean.HEEL_L=mean(d.markerName.HEEL_L);
end

d.EXISTS.TOE_R=any(strcmp('TOE_R',fieldnames(d.markerName)));
if d.EXISTS.TOE_R ==0
elseif d.EXISTS.TOE_R ~=0
d.mean.TOE_R=mean(d.markerName.TOE_R);
end

d.EXISTS.MTP5_R=any(strcmp('MTP5_R',fieldnames(d.markerName)));
if d.EXISTS.MTP5_R ==0
elseif d.EXISTS.MTP5_R ~=0
d.mean.MTP5_R=mean(d.markerName.MTP5_R);
end

d.EXISTS.MTP1_R=any(strcmp('MTP1_R',fieldnames(d.markerName)));
if d.EXISTS.MTP1_R ==0
elseif d.EXISTS.MTP1_R ~=0
d.mean.MTP1_R=mean(d.markerName.MTP1_R);
end
 
d.EXISTS.HEEL_R=any(strcmp('HEEL_R',fieldnames(d.markerName)));
if d.EXISTS.HEEL_R ==0
elseif d.EXISTS.HEEL_R ~=0
d.mean.HEEL_R=mean(d.markerName.HEEL_R);
end

% Bike Parameters %
d.EXISTS.BAR_R=any(strcmp('BAR_R',fieldnames(d.markerName)));
if d.EXISTS.BAR_R ==0
elseif d.EXISTS.BAR_R ~=0
d.mean.BAR_R=mean(d.markerName.BAR_R);

end

d.EXISTS.BAR_C=any(strcmp('BAR_C',fieldnames(d.markerName)));
if d.EXISTS.BAR_C ==0
elseif d.EXISTS.BAR_C ~=0
d.mean.BAR_C=mean(d.markerName.BAR_C);
end

d.EXISTS.BAR_TUB_R=any(strcmp('BAR_TUB_R',fieldnames(d.markerName)));
if d.EXISTS.BAR_TUB_R ==0
elseif d.EXISTS.BAR_TUB_R ~=0
d.mean.BAR_TUB_R=mean(d.markerName.BAR_TUB_R);
end

d.EXISTS.SAD_ANT=any(strcmp('SAD_ANT',fieldnames(d.markerName)));
if d.EXISTS.SAD_ANT ==0
elseif d.EXISTS.SAD_ANT ~=0
d.mean.SAD_ANT=mean(d.markerName.SAD_ANT);
end

d.EXISTS.SAD_POST=any(strcmp('SAD_POST',fieldnames(d.markerName)));
if d.EXISTS.SAD_POST ==0
elseif d.EXISTS.SAD_POST ~=0
d.mean.SAD_POST=mean(d.markerName.SAD_POST);
end

d.EXISTS.SAD_TUB_R=any(strcmp('SAD_TUB_R',fieldnames(d.markerName)));
if d.EXISTS.SAD_TUB_R ==0
elseif d.EXISTS.SAD_TUB_R ~=0
d.mean.SAD_TUB_R=mean(d.markerName.SAD_TUB_R);
end

d.EXISTS.CRANK_R=any(strcmp('CRANK_R',fieldnames(d.markerName)));
if d.EXISTS.CRANK_R ==0
elseif d.EXISTS.CRANK_R ~=0
d.mean.CRANK_R=mean(d.markerName.CRANK_R);
end

d.EXISTS.PED_ANT_R=any(strcmp('PED_ANT_R',fieldnames(d.markerName)));
if d.EXISTS.PED_ANT_R ==0
elseif d.EXISTS.PED_ANT_R ~=0
d.mean.PED_ANT_R=mean(d.markerName.PED_ANT_R);
end

d.EXISTS.PED_POST_R=any(strcmp('PED_POST_R',fieldnames(d.markerName)));
if d.EXISTS.PED_POST_R ==0
elseif d.EXISTS.PED_POST_R ~=0
d.mean.PED_POST_R=mean(d.markerName.PED_POST_R);
end


% Calculations to assess limb lengths and bike size %

% Anthropometrics%
if (d.EXISTS.ACROM_L==0 && d.EXISTS.IL_CREST_L==0)
elseif (d.EXISTS.ACROM_L~=0 && d.EXISTS.IL_CREST_L~=0)
 d.anthropometric.Torso_Length=mean(d.markerName.ACROM_L(:,3)-d.markerName.ILCREST_L(:,3));
 d.anthropometric.Torso_Length=abs(d.anthropometric.Torso_Length);
Torso_Length= d.anthropometric.Torso_Length;
end

if (d.EXISTS.STRN==0)
elseif (d.EXISTS.STRN~=0) 
 d.anthropometric.Sternum_Height=mean(d.markerName.STRN(:,3));
  d.anthropometric.Sternum_Height=abs(d.anthropometric.Sternum_Height);
Sternum_Height=d.anthropometric.Sternum_Height;
end

if (d.EXISTS.ASIS_L==0)
elseif (d.EXISTS.ASIS_L~=0)
d.anthropometric.Pelvis_Height=mean(d.markerName.ASIS_L(:,3));
d.anthropometric.Pelvis_Height=abs(d.anthropometric.Pelvis_Height);
Pelvis_Height=d.anthropometric.Pelvis_Height;
end

% Left Anthropometrics%
if (d.EXISTS.ACROM_L==0 && d.EXISTS.LAT_ELB_L==0 && d.EXISTS.WRB_L==0)
elseif (d.EXISTS.ACROM_L~=0 && d.EXISTS.LAT_ELB_L~=0 && d.EXISTS.WRB_L~=0)
d.anthropometric.Left_Arm_Length=(d.mean.ACROM_L-d.mean.LAT_ELB_L)+(d.mean.LAT_ELB_L-d.mean.WRB_L);
d.anthropometric.Left_Arm_Length= d.anthropometric.Left_Arm_Length.* d.anthropometric.Left_Arm_Length;
d.anthropometric.Left_Arm_Length=sum( d.anthropometric.Left_Arm_Length);
d.anthropometric.Left_Arm_Length=sqrt (d.anthropometric.Left_Arm_Length);
Left_Arm_Length=d.anthropometric.Left_Arm_Length;   
end

if (d.EXISTS.ACROM_L==0 && d.EXISTS.LAT_ELB_L==0)
elseif (d.EXISTS.ACROM_L~=0 && d.EXISTS.LAT_ELB_L~=0)
d.anthropometric.Left_Upper_Arm_Length=d.mean.ACROM_L-d.mean.LAT_ELB_L;
d.anthropometric.Left_Upper_Arm_Length= d.anthropometric.Left_Upper_Arm_Length.* d.anthropometric.Left_Upper_Arm_Length;
d.anthropometric.Left_Upper_Arm_Length=sum( d.anthropometric.Left_Upper_Arm_Length);
d.anthropometric.Left_Upper_Arm_Length=sqrt (d.anthropometric.Left_Upper_Arm_Length);
Left_Upper_Arm_Length=d.anthropometric.Left_Upper_Arm_Length;
end
     
if (d.EXISTS.LAT_ELB_L==0 && d.EXISTS.WRB_L==0)
elseif (d.EXISTS.LAT_ELB_L~=0 && d.EXISTS.WRB_L~=0)
d.anthropometric.Left_Lower_Arm_Length=d.mean.LAT_ELB_L-d.mean.WRB_L; 
d.anthropometric.Left_Lower_Arm_Length= d.anthropometric.Left_Lower_Arm_Length.* d.anthropometric.Left_Lower_Arm_Length;
d.anthropometric.Left_Lower_Arm_Length=sum( d.anthropometric.Left_Lower_Arm_Length);
d.anthropometric.Left_Lower_Arm_Length=sqrt (d.anthropometric.Left_Lower_Arm_Length);
Left_Lower_Arm_Length=abs(d.anthropometric.Left_Lower_Arm_Length);
end

if (d.EXISTS.GT_L==0 && d.EXISTS.MTP5_L==0)
elseif (d.EXISTS.GT_L~=0 && d.EXISTS.MTP5_L~=0)
d.anthropometric.Left_GT_Length=mean(d.markerName.GT_L(:,3)-d.markerName.MTP5_L(:,3));
d.anthropometric.Left_GT_Length=abs(d.anthropometric.Left_GT_Length);
Left_GT_Length= d.anthropometric.Left_GT_Length;
end

if (d.EXISTS.ASIS_L==0 && d.EXISTS.KNEE_LAT_L==0)
elseif (d.EXISTS.ASIS_L~=0 && d.EXISTS.KNEE_LAT_L~=0)
d.anthropometric.left_Upper_Leg_Length=mean(d.markerName.ASIS_L(:,3)-d.markerName.KNEE_LAT_L(:,3));
d.anthropometric.left_Upper_Leg_Length=abs(d.anthropometric.left_Upper_Leg_Length);
left_Upper_Leg_Length=d.anthropometric.left_Upper_Leg_Length;
end


if (d.EXISTS.KNEE_LAT_L==0 && d.EXISTS.MAL_LAT_L==0)
elseif (d.EXISTS.KNEE_LAT_L~=0 && d.EXISTS.MAL_LAT_L~=0)
d.anthropometric.Left_Shank_Length=mean(d.markerName.KNEE_LAT_L(:,3)-d.markerName.MAL_LAT_L(:,3));
d.anthropometric.Left_Shank_Length=abs(d.anthropometric.Left_Shank_Length);
Left_Shank_Length= d.anthropometric.Left_Shank_Length;
end

if (d.EXISTS.TOE_L==0 && d.EXISTS.HEEL_L==0)
elseif (d.EXISTS.TOE_L~=0 && d.EXISTS.HEEL_L~=0)
d.anthropometric.Left_Foot_Length=d.mean.TOE_L-d.mean.HEEL_L;
d.anthropometric.Left_Foot_Length= d.anthropometric.Left_Foot_Length.* d.anthropometric.Left_Foot_Length;
d.anthropometric.Left_Foot_Length=sum( d.anthropometric.Left_Foot_Length);
d.anthropometric.Left_Foot_Length=sqrt (d.anthropometric.Left_Foot_Length);
Left_Foot_Length=d.anthropometric.Left_Foot_Length;
end

% Right Anthropometrics%
if (d.EXISTS.ACROM_R==0 && d.EXISTS.LAT_ELB_R==0 && d.EXISTS.WRB_R==0)
elseif (d.EXISTS.ACROM_R~=0 && d.EXISTS.LAT_ELB_R~=0 && d.EXISTS.WRB_R~=0)
d.anthropometric.Right_Arm_Length=(d.mean.ACROM_R-d.mean.LAT_ELB_R)+(d.mean.LAT_ELB_R-d.mean.WRB_R);
d.anthropometric.Right_Arm_Length= d.anthropometric.Right_Arm_Length.* d.anthropometric.Right_Arm_Length;
d.anthropometric.Right_Arm_Length=sum( d.anthropometric.Right_Arm_Length);
d.anthropometric.Right_Arm_Length=sqrt (d.anthropometric.Right_Arm_Length);
Right_Arm_Length= d.anthropometric.Right_Arm_Length;
end

if (d.EXISTS.ACROM_R==0 && d.EXISTS.LAT_ELB_R==0)
elseif (d.EXISTS.ACROM_R~=0 && d.EXISTS.LAT_ELB_R~=0)
d.anthropometric.Right_Upper_Arm_Length=d.mean.ACROM_R-d.mean.LAT_ELB_R;
d.anthropometric.Right_Upper_Arm_Length= d.anthropometric.Right_Upper_Arm_Length.* d.anthropometric.Right_Upper_Arm_Length;
d.anthropometric.Right_Upper_Arm_Length=sum( d.anthropometric.Right_Upper_Arm_Length);
d.anthropometric.Right_Upper_Arm_Length=sqrt (d.anthropometric.Right_Upper_Arm_Length);
Right_Upper_Arm_Length=d.anthropometric.Right_Upper_Arm_Length;
end

if (d.EXISTS.LAT_ELB_R==0 && d.EXISTS.WRB_R==0)
elseif (d.EXISTS.LAT_ELB_R~=0 && d.EXISTS.WRB_R~=0)
d.anthropometric.Right_Lower_Arm_Length=d.mean.LAT_ELB_R-d.mean.WRB_R;
d.anthropometric.Right_Lower_Arm_Length= d.anthropometric.Right_Lower_Arm_Length.* d.anthropometric.Right_Lower_Arm_Length;
d.anthropometric.Right_Lower_Arm_Length=sum( d.anthropometric.Right_Lower_Arm_Length);
d.anthropometric.Right_Lower_Arm_Length=sqrt (d.anthropometric.Right_Lower_Arm_Length);
Right_Lower_Arm_Length=d.anthropometric.Right_Lower_Arm_Length;
end

if (d.EXISTS.GT_R==0 && d.EXISTS.MTP5_R==0)
elseif (d.EXISTS.GT_R~=0 && d.EXISTS.MTP5_R~=0)
d.anthropometric.Right_GT_Length=mean(d.markerName.GT_R(:,3)-d.markerName.MTP5_R(:,3));
d.anthropometric.Right_GT_Length=abs(d.anthropometric.Right_GT_Length);
Right_GT_Length= d.anthropometric.Right_GT_Length;
end

if (d.EXISTS.ASIS_R==0 && d.EXISTS.KNEE_LAT_R==0)
elseif (d.EXISTS.ASIS_R~=0 && d.EXISTS.KNEE_LAT_R~=0)
d.anthropometric.Right_Upper_Leg_Length=mean(d.markerName.ASIS_R(:,3)-d.markerName.KNEE_LAT_R(:,3));
d.anthropometric.Right_Upper_Leg_Length=abs(d.anthropometric.Right_Upper_Leg_Length);
Right_Upper_Leg_Length=d.anthropometric.Right_Upper_Leg_Length;
end

if (d.EXISTS.KNEE_LAT_R==0 && d.EXISTS.MAL_LAT_R==0)
elseif (d.EXISTS.KNEE_LAT_R~=0 && d.EXISTS.MAL_LAT_R~=0)
d.anthropometric.Right_Shank_Length=mean(d.markerName.KNEE_LAT_R(:,3)-d.markerName.MAL_LAT_R(:,3));
d.anthropometric.Right_Shank_Length=abs(d.anthropometric.Right_Shank_Length);
Right_Shank_Length=d.anthropometric.Right_Shank_Length;
end

if (d.EXISTS.TOE_R==0 && d.EXISTS.HEEL_R==0)
elseif (d.EXISTS.TOE_R~=0 && d.EXISTS.HEEL_R~=0)
d.anthropometric.Right_Foot_Length=d.mean.TOE_R-d.mean.HEEL_R;
d.anthropometric.Right_Foot_Length= d.anthropometric.Right_Foot_Length.* d.anthropometric.Right_Foot_Length;
d.anthropometric.Right_Foot_Length=sum( d.anthropometric.Right_Foot_Length);
d.anthropometric.Right_Foot_Length=sqrt (d.anthropometric.Right_Foot_Length);
Right_Foot_Length=d.anthropometric.Right_Foot_Length;
end


% Extract bike parameters
if (d.EXISTS.SAD_ANT==0 && d.EXISTS.CRANK_R==0 && d.EXISTS.SAD_POST==0)
elseif (d.EXISTS.SAD_ANT~=0 && d.EXISTS.CRANK_R~=0 && d.EXISTS.SAD_POST~=0)
Saddle_set_back=sum(d.mean.CRANK_R-d.mean.SAD_ANT);
Saddle_set_back=abs(Saddle_set_back);
Saddle_set_back=sqrt(Saddle_set_back);
end

if (d.EXISTS.SAD_ANT==0 && d.EXISTS.BAR_C==0)
elseif (d.EXISTS.SAD_ANT~=0 && d.EXISTS.BAR_C~=0)
d.anthropometric.Saddle_handlebar_length=d.mean.SAD_ANT-d.mean.BAR_C;
d.anthropometric.Saddle_handlebar_length=d.anthropometric.Saddle_handlebar_length(:,2);
d.anthropometric.Saddle_handlebar_length=abs(d.anthropometric.Saddle_handlebar_length);
Saddle_handlebar_length=d.anthropometric.Saddle_handlebar_length;
end

if (d.EXISTS.BAR_C==0 && d.EXISTS.BAR_R==0)
elseif (d.EXISTS.BAR_C~=0 && d.EXISTS.BAR_R~=0)
d.anthropometric.Handlebar_Extension=d.mean.BAR_C-d.mean.BAR_R;
d.anthropometric.Handlebar_Extension=d.anthropometric.Handlebar_Extension(:,1);
d.anthropometric.Handlebar_Extension=abs(d.anthropometric.Handlebar_Extension);
Handlebar_Extension=d.anthropometric.Handlebar_Extension;
end

if (d.EXISTS.BAR_TUB_R==0 && d.EXISTS.SAD_TUB_R==0)
elseif (d.EXISTS.BAR_TUB_R~=0 && d.EXISTS.SAD_TUB_R~=0)
d.anthropometric.Top_Tube_Length=d.mean.BAR_TUB_R-d.mean.SAD_TUB_R;
d.anthropometric.Top_Tube_Length=d.anthropometric.Top_Tube_Length(:,2);
d.anthropometric.Top_Tube_Length=abs(d.anthropometric.Top_Tube_Length);
Top_Tube_Length=d.anthropometric.Top_Tube_Length;
end

if d.EXISTS.BAR_C==0
elseif d.EXISTS.BAR_C~=0
d.anthropometric.HandleBar_Height=d.mean.BAR_C;
d.anthropometric.HandleBar_Height=d.anthropometric.HandleBar_Height(:,3);
HandleBar_Height=d.anthropometric.HandleBar_Height;
end

if (d.EXISTS.CRANK_R==0 && d.EXISTS.PED_ANT_R==0 && d.EXISTS.PED_POST_R==0)
elseif (d.EXISTS.CRANK_R~=0 && d.EXISTS.PED_ANT_R~=0 && d.EXISTS.PED_POST_R~=0)
d.anthropometric.mid_pedal=0.5*(d.mean.PED_POST_R-d.mean.PED_ANT_R);
d.anthropometric.mid_pedal=abs(d.anthropometric.mid_pedal);
d.anthropometric.mid_pedal= d.anthropometric.mid_pedal.\10;
d.anthropometric.mid_pedal=(d.mean.PED_ANT_R-d.anthropometric.mid_pedal);     
d.anthropometric.Crank_Length=(d.mean.CRANK_R -  d.anthropometric.mid_pedal);
d.anthropometric.Crank_Length= d.anthropometric.Crank_Length.* d.anthropometric.Crank_Length;
d.anthropometric.Crank_Length=sum( d.anthropometric.Crank_Length);
d.anthropometric.Crank_Length=sqrt (d.anthropometric.Crank_Length);
Crank_Lengths=d.anthropometric.Crank_Length;
end

if d.EXISTS.SAD_POST==0
elseif d.EXISTS.SAD_POST~=0
d.anthropometric.Ground_Saddle_Height=d.mean.SAD_POST;
d.anthropometric.Ground_Saddle_Height=d.anthropometric.Ground_Saddle_Height(:,3);
Ground_Saddle_Height=d.anthropometric.Ground_Saddle_Height;
end

if (d.EXISTS.CRANK_R==0 && d.EXISTS.SAD_TUB_R==0)
elseif (d.EXISTS.CRANK_R~=0 && d.EXISTS.SAD_TUB_R~=0)
d.anthropometric.Seat_Tube_length=d.mean.SAD_TUB_R-d.mean.CRANK_R;
d.anthropometric.Seat_Tube_length=d.anthropometric.Seat_Tube_length (:,3);
d.anthropometric.Seat_Tube_length=abs(d.anthropometric.Seat_Tube_length);
Seat_Tube_length=d.anthropometric.Seat_Tube_length;
end

if (d.EXISTS.CRANK_R==0 && d.EXISTS.SAD_POST==0)
elseif (d.EXISTS.CRANK_R~=0 && d.EXISTS.SAD_POST~=0)
d.anthropometric.Saddle_height=(d.mean.CRANK_R-d.mean.SAD_POST);
d.anthropometric.Saddle_height=d.anthropometric.Saddle_height.*d.anthropometric.Saddle_height;
d.anthropometric.Saddle_height=sum(d.anthropometric.Saddle_height);
d.anthropometric.Saddle_height=sqrt(d.anthropometric.Saddle_height);
Saddle_height=d.anthropometric.Saddle_height;
end

if (d.EXISTS.SAD_TUB_R==0 && d.EXISTS.SAD_POST==0 && d.EXISTS.SAD_ANT==0)
elseif (d.EXISTS.SAD_TUB_R~=0 && d.EXISTS.SAD_POST~=0 && d.EXISTS.SAD_ANT~=0)
Saddle_Vector= [ d.markerName.SAD_POST d.markerName.SAD_ANT d.markerName.SAD_POST d.markerName.SAD_TUB_R];
data=Saddle_Vector;
end


% Saddle Angle %

% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0]; %#ok<*NBRAK>
data(:,[1 2 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Saddle(i,:)=alpha(i,:);
end
d.angles.Saddle=abs(d.angles.Saddle);
data=[];

% Filter saddle angle %
for i=1:size(d.angles.Saddle)
Saddle_Angle(i,1)=180-d.angles.Saddle(i,:);
end
wn = 6/250;
[b, a] = butter(4,wn, 'low');
Saddle_Angle=filtfilt(b,a,Saddle_Angle);
Saddle_Angle=mean(Saddle_Angle);
Saddle_Angle=90-Saddle_Angle;



% Set value in GUI
set(handles.Saddle,'String','');
set(handles.Saddle,'String',Saddle_Angle);  
set(handles.Torso_length,'String','');
set(handles.Torso_length,'String',Torso_Length);           
set(handles.Sternum_height,'String','');
set(handles.Sternum_height,'String',Sternum_Height);        
set(handles.Pelvis_Height,'String','');
set(handles.Pelvis_Height,'String',Pelvis_Height);  

% Set left body length %
set(handles.Shank_length,'String','');
set(handles.Shank_length,'String', Left_Shank_Length);            
set(handles.foot_length,'String','');
set(handles.foot_length,'String',Left_Foot_Length);                
set(handles.upper_leg_length,'String','');
set(handles.upper_leg_length,'String',left_Upper_Leg_Length); 
set(handles.Upper_arm_length,'String','');
set(handles.Upper_arm_length,'String', Left_Upper_Arm_Length);
set(handles.Arm_length,'String','');
set(handles.Arm_length,'String',Left_Arm_Length);  
set(handles.Lower_arm_length,'String','');
set(handles.Lower_arm_length,'String',Left_Lower_Arm_Length);

% Set Right body lengths
set(handles.Right_shank_length,'String','');
set(handles.Right_shank_length,'String', Right_Shank_Length); 
set(handles.Right_foot_length,'String','');
set(handles.Right_foot_length,'String',Right_Foot_Length);   
set(handles.Right_upper_leg_length,'String','');
set(handles.Right_upper_leg_length,'String',Right_Upper_Leg_Length); 
set(handles.Right_upper_arm_length,'String','');
set(handles.Right_upper_arm_length,'String', Right_Upper_Arm_Length);     
set(handles.Right_Arm_Length,'String','');
set(handles.Right_Arm_Length,'String',Right_Arm_Length);
set(handles.Right_lower_arm_length,'String','');
set(handles.Right_lower_arm_length,'String',Right_Lower_Arm_Length);           
set(handles.Right_lower_arm_length,'String','');
set(handles.Right_lower_arm_length,'String',Right_Lower_Arm_Length);
set(handles.GT_height, 'String', '');
set(handles.GT_height, 'String', Left_GT_Length);
set(handles.Right_GT_height, 'String', '');
set(handles.Right_GT_height, 'String', Right_GT_Length);
             
% Bike parameters %%
set(handles.seat_tube_length, 'String','');
set(handles.seat_tube_length,'String',Seat_Tube_length);
set(handles.Ground_saddle_height, 'String','');
set(handles.Ground_saddle_height, 'String',Ground_Saddle_Height);
set(handles.Saddle_height, 'String','');
set(handles.Saddle_height, 'String', Saddle_height);
set(handles.saddle_handlebar, 'String','');
set(handles.saddle_handlebar, 'String',Saddle_handlebar_length);
set(handles.Saddle_setback, 'String','');
set(handles.Saddle_setback, 'String',Saddle_set_back);
set(handles.Handlebar_extension, 'String','');
set(handles.Handlebar_extension, 'String',Handlebar_Extension  );
set(handles.Top_tube, 'String','');
set(handles.Top_tube, 'String',Top_Tube_Length );
set(handles.Ground_handlebar, 'String','');
set(handles.Ground_handlebar, 'String',HandleBar_Height );
set(handles.Crank_Length, 'String','');
set(handles.Crank_Length, 'String',Crank_Lengths);     
             
msgbox('Parameters Extracted - Now enter height and weight');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parameter Handles %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Outputs from this function are returned to the command line.
function varargout = Cycling_OutputFcn(hObject, eventdata, handles)  %#ok<*INUSL>
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in About.
function About_Callback(hObject, eventdata, handles) %#ok<*INUSD,*DEFNU>
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Michael J. Long, Cardiff Metropolitan University 2017');

% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton3.
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
function seat_tube_length_Callback(hObject, eventdata, handles)
% hObject    handle to seat_tube_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seat_tube_length as text
%        str2double(get(hObject,'String')) returns contents of seat_tube_length as a double

% --- Executes during object creation, after setting all properties.
function seat_tube_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seat_tube_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Ground_saddle_height_Callback(hObject, eventdata, handles)
% hObject    handle to Ground_saddle_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ground_saddle_height as text
%        str2double(get(hObject,'String')) returns contents of Ground_saddle_height as a double
% --- Executes during object creation, after setting all properties.
function Ground_saddle_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ground_saddle_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Saddle_height_Callback(hObject, eventdata, handles)
% hObject    handle to Saddle_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Saddle_height as text
%        str2double(get(hObject,'String')) returns contents of Saddle_height as a double

% --- Executes during object creation, after setting all properties.
function Saddle_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Saddle_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function saddle_handlebar_Callback(hObject, eventdata, handles)
% hObject    handle to saddle_handlebar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of saddle_handlebar as text
%        str2double(get(hObject,'String')) returns contents of saddle_handlebar as a double

% --- Executes during object creation, after setting all properties.
function saddle_handlebar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to saddle_handlebar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Saddle_setback_Callback(hObject, eventdata, handles)
% hObject    handle to Saddle_setback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Saddle_setback as text
%        str2double(get(hObject,'String')) returns contents of Saddle_setback as a double

% --- Executes during object creation, after setting all properties.
function Saddle_setback_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Saddle_setback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Handlebar_extension_Callback(hObject, eventdata, handles)
% hObject    handle to Handlebar_extension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Handlebar_extension as text
%        str2double(get(hObject,'String')) returns contents of Handlebar_extension as a double

% --- Executes during object creation, after setting all properties.
function Handlebar_extension_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Handlebar_extension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Top_tube_Callback(hObject, eventdata, handles)
% hObject    handle to Top_tube (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Top_tube as text
%        str2double(get(hObject,'String')) returns contents of Top_tube as a double

% --- Executes during object creation, after setting all properties.
function Top_tube_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Top_tube (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Ground_handlebar_Callback(hObject, eventdata, handles)
% hObject    handle to Ground_handlebar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ground_handlebar as text
%        str2double(get(hObject,'String')) returns contents of Ground_handlebar as a double

% --- Executes during object creation, after setting all properties.
function Ground_handlebar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ground_handlebar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Crank_Length_Callback(hObject, eventdata, handles)
% hObject    handle to Crank_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Crank_Length as text
%        str2double(get(hObject,'String')) returns contents of Crank_Length as a double

% --- Executes during object creation, after setting all properties.
function Crank_Length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Crank_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Bike_Info_1.
function Bike_Info_1_Callback(hObject, eventdata, handles)
% hObject    handle to Bike_Info_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Straight line distance from the well of the seat to the center of the crank'});

% --- Executes on button press in Bike_Info_3.
function Bike_Info_9_Callback(hObject, eventdata, handles)
% hObject    handle to Bike_Info_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance between crank arm center and seat tube junction'});

% --- Executes on button press in Bike_Info_3.
function Bike_Info_8_Callback(hObject, eventdata, handles)
% hObject    handle to Bike_Info_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance between ground and seat well'});

% --- Executes on button press in Bike_Info_3.
function Bike_Info_7_Callback(hObject, eventdata, handles)
% hObject    handle to Bike_Info_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Length from the middle of the crank to the end of crank arm'});

% --- Executes on button press in Bike_Info_3.
function Bike_Info_6_Callback(hObject, eventdata, handles)
% hObject    handle to Bike_Info_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance between ground and handlebar'});

% --- Executes on button press in Bike_Info_3.
function Bike_Info_5_Callback(hObject, eventdata, handles)
% hObject    handle to Bike_Info_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance between seat tube junction and handlebar junction'});

% --- Executes on button press in Bike_Info_3.
function Bike_Info_4_Callback(hObject, eventdata, handles)
% hObject    handle to Bike_Info_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Handlebar distance from center of steering tube to handlebar clamp'});

% --- Executes on button press in Bike_Info_3.
function Bike_Info_3_Callback(hObject, eventdata, handles)
% hObject    handle to Bike_Info_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance between nose of saddle to center of handlebars'});

% --- Executes on button press in Bike_Info_2.
function Bike_Info_2_Callback(hObject, eventdata, handles)
% hObject    handle to Bike_Info_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Perpendicular distance from nose of saddle to middel of crank'});
function Height_Callback(hObject, eventdata, handles)
% hObject    handle to Height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height as text
%        str2double(get(hObject,'String')) returns contents of Height as a double

% --- Executes during object creation, after setting all properties.
function Height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Weight_Callback(hObject, eventdata, handles)
% hObject    handle to Weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Weight as text
%        str2double(get(hObject,'String')) returns contents of Weight as a double

% --- Executes during object creation, after setting all properties.
function Weight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Torso_length_Callback(hObject, eventdata, handles)
% hObject    handle to Torso_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Torso_length as text
%        str2double(get(hObject,'String')) returns contents of Torso_length as a double

% --- Executes during object creation, after setting all properties.
function Torso_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Torso_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Sternum_height_Callback(hObject, eventdata, handles)
% hObject    handle to Sternum_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sternum_height as text
%        str2double(get(hObject,'String')) returns contents of Sternum_height as a double

% --- Executes during object creation, after setting all properties.
function Sternum_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sternum_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Pelvis_Height_Callback(hObject, eventdata, handles)
% hObject    handle to Pelvis_Height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pelvis_Height as text
%        str2double(get(hObject,'String')) returns contents of Pelvis_Height as a double

% --- Executes during object creation, after setting all properties.
function Pelvis_Height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pelvis_Height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Shank_length_Callback(hObject, eventdata, handles)
% hObject    handle to Shank_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Shank_length as text
%        str2double(get(hObject,'String')) returns contents of Shank_length as a double

% --- Executes during object creation, after setting all properties.
function Shank_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Shank_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function foot_length_Callback(hObject, eventdata, handles)
% hObject    handle to foot_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of foot_length as text
%        str2double(get(hObject,'String')) returns contents of foot_length as a double

% --- Executes during object creation, after setting all properties.
function foot_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to foot_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function GT_height_Callback(hObject, eventdata, handles)
% hObject    handle to GT_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GT_height as text
%        str2double(get(hObject,'String')) returns contents of GT_height as a double

% --- Executes during object creation, after setting all properties.
function GT_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GT_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function upper_leg_length_Callback(hObject, eventdata, handles)
% hObject    handle to upper_leg_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of upper_leg_length as text
%        str2double(get(hObject,'String')) returns contents of upper_leg_length as a double

% --- Executes during object creation, after setting all properties.
function upper_leg_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to upper_leg_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Upper_arm_length_Callback(hObject, eventdata, handles)
% hObject    handle to Upper_arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Upper_arm_length as text
%        str2double(get(hObject,'String')) returns contents of Upper_arm_length as a double

% --- Executes during object creation, after setting all properties.
function Upper_arm_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Upper_arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Arm_length_Callback(hObject, eventdata, handles)
% hObject    handle to Arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Arm_length as text
%        str2double(get(hObject,'String')) returns contents of Arm_length as a double

% --- Executes during object creation, after setting all properties.
function Arm_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lower_arm_length_Callback(hObject, eventdata, handles)
% hObject    handle to Lower_arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lower_arm_length as text
%        str2double(get(hObject,'String')) returns contents of Lower_arm_length as a double

% --- Executes during object creation, after setting all properties.
function Lower_arm_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lower_arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Person_Info_1.
function Person_Info_1_Callback(hObject, eventdata, handles)
% hObject    handle to Person_Info_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance from the Acromion Processs to the ASIS'});

% --- Executes on button press in Person_Info_2.
function Person_Info_2_Callback(hObject, eventdata, handles)
% hObject    handle to Person_Info_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance from the Acromion Processs to the Wrist'});

% --- Executes on button press in Person_Info_3.
function Person_Info_3_Callback(hObject, eventdata, handles)
% hObject    handle to Person_Info_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance from the Acromion Processs to the Lateral Epicondyle of the Elbow'});

% --- Executes on button press in Person_Info_4.
function Person_Info_4_Callback(hObject, eventdata, handles)
% hObject    handle to Person_Info_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance from the the Lateral Epicondyle of the Elbow to the Wrist'});

% --- Executes on button press in Person_Info_5.
function Person_Info_5_Callback(hObject, eventdata, handles)
% hObject    handle to Person_Info_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance from the ASIS to the Lateral Epicondyle of the Knee'});

% --- Executes on button press in Person_Info_6.
function Person_Info_6_Callback(hObject, eventdata, handles)
% hObject    handle to Person_Info_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance from the Greater Trochanter to the 5th Metatarsal Head'});

% --- Executes on button press in Person_Info_7.
function Person_Info_7_Callback(hObject, eventdata, handles)
% hObject    handle to Person_Info_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance from the Heel to the 1st Metatarsal Head'});

% --- Executes on button press in Person_Info_8.
function Person_Info_8_Callback(hObject, eventdata, handles)
% hObject    handle to Person_Info_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance from the Lateral Epicondyle of the Knee to the Lateral Malleolus'});

% --- Executes on button press in Person_Info_9.
function Person_Info_9_Callback(hObject, eventdata, handles)
% hObject    handle to Person_Info_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance from the 5th Metatarsal to the ASIS'});

% --- Executes on button press in Person_Info_10.
function Person_Info_10_Callback(hObject, eventdata, handles)
% hObject    handle to Person_Info_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Distance from the 5th Metatarsal to the Sternum'});

function Right_Arm_Length_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Arm_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_Arm_Length as text
%        str2double(get(hObject,'String')) returns contents of Right_Arm_Length as a double

% --- Executes during object creation, after setting all properties.
function Right_Arm_Length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_Arm_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Right_upper_arm_length_Callback(hObject, eventdata, handles)
% hObject    handle to Right_upper_arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_upper_arm_length as text
%        str2double(get(hObject,'String')) returns contents of Right_upper_arm_length as a double

% --- Executes during object creation, after setting all properties.
function Right_upper_arm_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_upper_arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Right_lower_arm_length_Callback(hObject, eventdata, handles)
% hObject    handle to Right_lower_arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_lower_arm_length as text
%        str2double(get(hObject,'String')) returns contents of Right_lower_arm_length as a double

% --- Executes during object creation, after setting all properties.
function Right_lower_arm_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_lower_arm_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Right_upper_leg_length_Callback(hObject, eventdata, handles)
% hObject    handle to Right_upper_leg_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_upper_leg_length as text
%        str2double(get(hObject,'String')) returns contents of Right_upper_leg_length as a double

% --- Executes during object creation, after setting all properties.
function Right_upper_leg_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_upper_leg_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Right_GT_height_Callback(hObject, eventdata, handles)
% hObject    handle to Right_GT_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_GT_height as text
%        str2double(get(hObject,'String')) returns contents of Right_GT_height as a double

% --- Executes during object creation, after setting all properties.
function Right_GT_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_GT_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Right_shank_length_Callback(hObject, eventdata, handles)
% hObject    handle to Right_shank_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_shank_length as text
%        str2double(get(hObject,'String')) returns contents of Right_shank_length as a double

% --- Executes during object creation, after setting all properties.
function Right_shank_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_shank_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Right_foot_length_Callback(hObject, eventdata, handles)
% hObject    handle to Right_foot_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Right_foot_length as text
%        str2double(get(hObject,'String')) returns contents of Right_foot_length as a double

% --- Executes during object creation, after setting all properties.
function Right_foot_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Right_foot_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Wheel_diameter_Callback(hObject, eventdata, handles)
% hObject    handle to Wheel_diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wheel_diameter as text
%        str2double(get(hObject,'String')) returns contents of Wheel_diameter as a double

% --- Executes during object creation, after setting all properties.
function Wheel_diameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wheel_diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Saddle_Callback(hObject, eventdata, handles)
% hObject    handle to Saddle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Saddle as text
%        str2double(get(hObject,'String')) returns contents of Saddle as a double

% --- Executes during object creation, after setting all properties.
function Saddle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Saddle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Inseam_Callback(hObject, eventdata, handles)
% hObject    handle to Inseam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Inseam as text
%        str2double(get(hObject,'String')) returns contents of Inseam as a double

% --- Executes during object creation, after setting all properties.
function Inseam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Inseam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Export Static Parameters %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
% --- Executes on button press in Export_Static.
function Export_Static_Callback(hObject, eventdata, handles)
% hObject    handle to Export_Static (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OutputFile file Torso_Length Sternum_Height Pelvis_Height Left_Arm_Length Right_Arm_Length Left_Upper_Arm_Length...
Left_Lower_Arm_Length left_Upper_Leg_Length Left_Shank_Length Left_Foot_Length Right_Upper_Arm_Length...
 Right_Lower_Arm_Length Right_Upper_Leg_Length Right_Shank_Length Right_Foot_Length fn1 d Right_GT_Length Left_GT_Length Height Weight...
Cadence Wheel_Diameter Pi Wheel_Circumference Revolutions_10_secs Revolutions_1_minute Meters_per_minute Hour Meters_per_hour Meter_mile_conversion MPH Power_Output_W...
Power_Kg  Saddle_height Seat_Tube_length Ground_Saddle_Height  Crank_Lengths HandleBar_Height  Top_Tube_Length Handlebar_Extension Saddle_handlebar_length Saddle_set_back...
Saddle_Angle Inseam Inseam_ideal

% Open save location %
folder_name = uigetdir;
OutputFile = [folder_name,'\Cycling_',file,'.xlsx'];

Height=get(handles.Height, 'String');
Weight=get(handles.Weight, 'String');
Inseam=get(handles.Inseam, 'String');

Weight=str2double(Weight);
Height=str2double(Height);
Inseam=str2double(Inseam);
Inseam_ideal=Inseam.*0.883;

% Parameters being saved into the static file %
TEXT1={'Left' 'Right'};
TEXT2={'Trial' file; 'Height' Height; 'Weight' Weight; 'Torso Length' Torso_Length; 'Sternum Height' Sternum_Height; 'Pelvis Height' Pelvis_Height}; 
TEXT3={'Arm Length' Left_Arm_Length; 'Upper Arm Length' Left_Upper_Arm_Length;...
       'Lower Arm Length' Left_Lower_Arm_Length; 'Left GT Height' Left_GT_Length; 'Inseam Hiehgt' Inseam; 'Upper Leg Length' left_Upper_Leg_Length;...
       'Shank Length' Left_Shank_Length; 'Foot Length' Left_Foot_Length};
TEXT4={'' Right_Arm_Length; '' Right_Upper_Arm_Length; '' Right_Lower_Arm_Length; '' Right_GT_Length; '' Inseam; '' Right_Upper_Leg_Length;...
       '' Right_Shank_Length; '' Right_Foot_Length};

TEXT10={'Saddle height' Saddle_height; 'Ideal saddle height' Inseam_ideal; 'Saddle Set Back' Saddle_set_back;'Seat Tube Length' Seat_Tube_length;'Saddle-Handlebar Length' Saddle_handlebar_length; 'Ground-Saddle Height' Ground_Saddle_Height;...
        'Handlebar Extension' Handlebar_Extension; 'Top Tube Length'  Top_Tube_Length; 'Ground-Handlebar Height' HandleBar_Height; 'Crank arm length' Crank_Lengths; 'Saddle Angle' Saddle_Angle};

[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT1,'Sheet1','B7');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT2,'Sheet1','A1'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT4,'Sheet1','B8');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT3,'Sheet1','A8');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT10,'Sheet1','G2');    
msgbox('Export Successful');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Load dynamic trial %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in Load_Dynamic.
function Load_Dynamic_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Dynamic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all %#ok<CLALL>
clc
global fn1 file1 d
[file1,path] = uigetfile({'*.tsv;*.c3d;*.mat;*.wii', '.tsv, .c3d, .mat and .wii files'}, 'Pick a .tsv, .c3d, .mat, or .wii file');
fn1 = [path file1];   
if ~ischar(fn1) %Check if input is given as string - BB 20120413 (does not work if file ending is given)
disp([10, 'Static*',10]);
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Obtain power output %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in Power_Output.
function Power_Output_Callback(hObject, eventdata, handles)
% hObject    handle to Power_Output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OutputFile file1 Height Weight...
Cadence Wheel_Diameter Pi Wheel_Circumference Revolutions_10_secs Revolutions_1_minute Meters_per_minute Hour Meters_per_hour Meter_mile_conversion MPH Power_Output_W...
Power_Kg d fn1 Total_Revolutions Total_Revolutions_Cadence Power_Kg_60 Power_Kg_50 Power_Kg_40 Power_Kg_30 Power_Kg_20 Power_Kg_10 Power_Kg_5 Power_Output_W_5 Power_Output_W_10 Power_Output_W_20...
Power_Output_W_30 Power_Output_W_40 Power_Output_W_50 Power_Output_W_60  i q w e r t y
i=[];
q=[];
w=[];
e=[];

r=[]; 
t =[];
y= [];

d=[];
ITF = btkEmulateC3Dserver();
H = btkReadAcquisition(fn1);
% getsmetadata %
d.Metadata=btkGetMetaData(H);  
% marker names and values %
d.markerName=btkGetMarkers(H);
% Firstframe %
d.firstframe=btkGetFirstFrame(H); 
% lastframe %
d.lastframe=btkGetLastFrame(H);
d.exception=[];
% marker data %
d.data=btkGetMarkersValues(H);
d.anglesnames= btkGetAngles(H);
d.angles=btkGetAnglesValues(H);

% Check to see if markers are present %

% Torso %

d.EXISTS.ACROM_L=any(strcmp('ACROM_L',fieldnames(d.markerName)));
if d.EXISTS.ACROM_L ==0
elseif d.EXISTS.ACROM_L ~=0
d.mean.ACROM_L=mean(d.markerName.ACROM_L);
end

d.EXISTS.ACROM_R=any(strcmp('ACROM_R',fieldnames(d.markerName)));
if d.EXISTS.ACROM_R ==0
elseif d.EXISTS.ACROM_R ~=0
d.mean.ACROM_R=mean(d.markerName.ACROM_R);
end

d.EXISTS.C7=any(strcmp('C7',fieldnames(d.markerName)));
if d.EXISTS.C7 ==0
elseif d.EXISTS.C7~=0
d.mean.C7=mean(d.markerName.C7);
end

d.EXISTS.T10=any(strcmp('T10',fieldnames(d.markerName)));
if d.EXISTS.T10 ==0
elseif d.EXISTS.T10 ~=0
d.mean.T10=mean(d.markerName.T10);
end

% Upper limbs%
d.EXISTS.MED_ELB_L=any(strcmp('MED_ELB_L',fieldnames(d.markerName)));
if d.EXISTS.MED_ELB_L ==0
elseif d.EXISTS.MED_ELB_L ~=0
d.mean.MED_ELB_L=mean(d.markerName.MED_ELB_L);
end

d.EXISTS.LAT_ELB_L=any(strcmp('LAT_ELB_L',fieldnames(d.markerName)));
if d.EXISTS.LAT_ELB_L ==0
elseif d.EXISTS.LAT_ELB_L ~=0
d.mean.LAT_ELB_L=mean(d.markerName.LAT_ELB_L);
end

d.EXISTS.WRA_L=any(strcmp('WRA_L',fieldnames(d.markerName)));
if d.EXISTS.WRA_L ==0
elseif d.EXISTS.WRA_L ~=0
d.mean.WRA_L=mean(d.markerName.WRA_L);
end

d.EXISTS.WRB_L=any(strcmp('WRB_L',fieldnames(d.markerName)));
if d.EXISTS.WRB_L ==0
elseif d.EXISTS.WRB_L ~=0
d.mean.WRB_L=mean(d.markerName.WRB_L);
end

d.EXISTS.FIN_L=any(strcmp('FIN_L',fieldnames(d.markerName)));
if d.EXISTS.FIN_L ==0 
elseif d.EXISTS.FIN_L ~=0
d.mean.FIN_L=mean(d.markerName.FIN_L);
end

d.EXISTS.MED_ELB_R=any(strcmp('MED_ELB_R',fieldnames(d.markerName)));
if d.EXISTS.MED_ELB_R ==0
elseif d.EXISTS.MED_ELB_R ~=0
d.mean.MED_ELB_R=mean(d.markerName.MED_ELB_R);
end

d.EXISTS.LAT_ELB_R=any(strcmp('LAT_ELB_R',fieldnames(d.markerName)));
if d.EXISTS.LAT_ELB_R ==0
elseif d.EXISTS.LAT_ELB_R ~=0
d.mean.LAT_ELB_R=mean(d.markerName.LAT_ELB_R);
end

d.EXISTS.WRA_R=any(strcmp('WRA_R',fieldnames(d.markerName)));
if d.EXISTS.WRA_R ==0
elseif d.EXISTS.WRA_R ~=0
d.mean.WRA_R=mean(d.markerName.WRA_R);
end

d.EXISTS.WRB_R=any(strcmp('WRB_R',fieldnames(d.markerName)));
if d.EXISTS.WRB_R ==0
elseif d.EXISTS.WRB_R ~= 0
d.mean.WRB_R=mean(d.markerName.WRB_R);
end

d.EXISTS.FIN_R=any(strcmp('FIN_R',fieldnames(d.markerName)));
if d.EXISTS.FIN_R ==0
elseif d.EXISTS.FIN_R ~=0
d.mean.FIN_R=mean(d.markerName.FIN_R);
end

% Pelvis%

d.EXISTS.IL_CREST_L=any(strcmp('ILCREST_L',fieldnames(d.markerName)));
if d.EXISTS.IL_CREST_L ==0
elseif d.EXISTS.IL_CREST_L ~=0
d.mean.IL_CREST_L=mean(d.markerName.ILCREST_L);
end

d.EXISTS.IL_CREST_R=any(strcmp('ILCREST_R',fieldnames(d.markerName)));
if d.EXISTS.IL_CREST_R ==0
elseif d.EXISTS.IL_CREST_R~=0
d.mean.IL_CREST_R=mean(d.markerName.ILCREST_R);
end

d.EXISTS.PSIS_L=any(strcmp('PSIS_L',fieldnames(d.markerName)));
if d.EXISTS.PSIS_L ==0
elseif d.EXISTS.PSIS_L~=0
d.mean.PSIS_L=mean(d.markerName.PSIS_L);
end

d.EXISTS.PSIS_R=any(strcmp('PSIS_R',fieldnames(d.markerName)));
if d.EXISTS.PSIS_R ==0
elseif d.EXISTS.PSIS_R ~=0
d.mean.PSIS_R=mean(d.markerName.PSIS_R);
end

% Lower Limbs%
d.EXISTS.GT_L=any(strcmp('GT_L',fieldnames(d.markerName)));
if d.EXISTS.GT_L ==0
elseif d.EXISTS.GT_L ~=0
d.mean.GT_L=mean(d.markerName.GT_L);
end

d.EXISTS.KNEE_LAT_L=any(strcmp('KNEE_LAT_L',fieldnames(d.markerName)));
if d.EXISTS.KNEE_LAT_L ==0
elseif d.EXISTS.KNEE_LAT_L ~=0
d.mean.KNEE_LAT_L=mean(d.markerName.KNEE_LAT_L);
end

d.EXISTS.MAL_LAT_L=any(strcmp('MAL_LAT_L',fieldnames(d.markerName)));
if d.EXISTS.MAL_LAT_L ==0
elseif d.EXISTS.MAL_LAT_L~=0
d.mean.MAL_LAT_L=mean(d.markerName.MAL_LAT_L);
end

d.EXISTS.GT_R=any(strcmp('GT_R',fieldnames(d.markerName)));
if d.EXISTS.GT_R ==0
elseif d.EXISTS.GT_R ~=0
d.mean.GT_R=mean(d.markerName.GT_R);
end

d.EXISTS.KNEE_LAT_R=any(strcmp('KNEE_LAT_R',fieldnames(d.markerName)));
if d.EXISTS.KNEE_LAT_R ==0
elseif d.EXISTS.KNEE_LAT_R ~=0
d.mean.KNEE_LAT_R=mean(d.markerName.KNEE_LAT_R);
end

d.EXISTS.MAL_LAT_R=any(strcmp('MAL_LAT_R',fieldnames(d.markerName)));
if d.EXISTS.MAL_LAT_R  ==0
elseif d.EXISTS.MAL_LAT_R~=0 
d.mean.MAL_LAT_R=mean(d.markerName.MAL_LAT_R);
end

% Feet%

d.EXISTS.TOE_L=any(strcmp('TOE_L',fieldnames(d.markerName)));
if d.EXISTS.TOE_L ==0
elseif d.EXISTS.TOE_L ~=0
d.mean.TOE_L=mean(d.markerName.TOE_L);
end

d.EXISTS.MTP5_L=any(strcmp('MTP5_L',fieldnames(d.markerName)));
if d.EXISTS.MTP5_L ==0
elseif d.EXISTS.MTP5_L~=0
d.mean.MTP5_L=mean(d.markerName.MTP5_L);
end

d.EXISTS.HEEL_L=any(strcmp('HEEL_L',fieldnames(d.markerName)));
if d.EXISTS.HEEL_L ==0
elseif d.EXISTS.HEEL_L ~=0
d.mean.HEEL_L=mean(d.markerName.HEEL_L);
end

d.EXISTS.TOE_R=any(strcmp('TOE_R',fieldnames(d.markerName)));
if d.EXISTS.TOE_R ==0
elseif d.EXISTS.TOE_R ~=0
d.mean.TOE_R=mean(d.markerName.TOE_R);
end

d.EXISTS.MTP5_R=any(strcmp('MTP5_R',fieldnames(d.markerName)));
if d.EXISTS.MTP5_R ==0
elseif d.EXISTS.MTP5_R ~=0
d.mean.MTP5_R=mean(d.markerName.MTP5_R);  
end
 
d.EXISTS.HEEL_R=any(strcmp('HEEL_R',fieldnames(d.markerName)));
if d.EXISTS.HEEL_R ==0
elseif d.EXISTS.HEEL_R ~=0
d.mean.HEEL_R=mean(d.markerName.HEEL_R);
end



%Bike Parameters

d.EXISTS.BAR_TUB_R=any(strcmp('BAR_TUB_R',fieldnames(d.markerName)));
if d.EXISTS.BAR_TUB_R ==0
elseif d.EXISTS.BAR_TUB_R ~=0
d.mean.BAR_TUB_R=mean(d.markerName.BAR_TUB_R);
end

d.EXISTS.BAR_TUB_L=any(strcmp('BAR_TUB_L',fieldnames(d.markerName)));
if d.EXISTS.BAR_TUB_L ==0
elseif d.EXISTS.BAR_TUB_L ~=0
d.mean.BAR_TUB_L=mean(d.markerName.BAR_TUB_L);
end

d.EXISTS.SAD_POST=any(strcmp('SAD_POST',fieldnames(d.markerName)));
if d.EXISTS.SAD_POST ==0
elseif d.EXISTS.SAD_POST ~=0
d.mean.SAD_POST=mean(d.markerName.SAD_POST); 
end

d.EXISTS.SAD_TUB_R=any(strcmp('SAD_TUB_R',fieldnames(d.markerName)));
if d.EXISTS.SAD_TUB_R ==0
elseif d.EXISTS.SAD_TUB_R ~=0
d.mean.SAD_TUB_R=mean(d.markerName.SAD_TUB_R);
end

d.EXISTS.SAD_TUB_L=any(strcmp('SAD_TUB_L',fieldnames(d.markerName)));
if d.EXISTS.SAD_TUB_L ==0
elseif d.EXISTS.SAD_TUB_L ~=0
d.mean.SAD_TUB_L=mean(d.markerName.SAD_TUB_L);
end

d.EXISTS.CRANK_R=any(strcmp('CRANK_R',fieldnames(d.markerName)));
if d.EXISTS.CRANK_R ==0
elseif d.EXISTS.CRANK_R ~=0
d.mean.CRANK_R=mean(d.markerName.CRANK_R);
end

d.EXISTS.CRANK_L=any(strcmp('CRANK_L',fieldnames(d.markerName)));
if d.EXISTS.CRANK_L ==0
elseif d.EXISTS.CRANK_L ~=0
d.mean.CRANK_L=mean(d.markerName.CRANK_L);
end


Wheel_Diameter=get(handles.Wheel_diameter,'String');
Wheel_Diameter=str2double(Wheel_Diameter);
Height=get(handles.Height, 'String');
Weight=get(handles.Weight, 'String');

Weight=str2double(Weight);
Height=str2double(Height);

% Find wheel revolutions total in 1 minute
format short
Fs=500;
Pi=3.1415;

%Find cadence total in 1 minute %
Revolution1=d.markerName.MTP5_L(:,3);
[Maxima1,MaxIdx1] = findpeaks(Revolution1,Fs,'MinPeakDistance',.5); % finds vertical peaks of MTP5 

[Total_Revolutions_Cadence, revolutions_]=size(Maxima1);
Total_Revolutions_Cadence=num2cell(Total_Revolutions_Cadence);
Cadence=cell2mat(Total_Revolutions_Cadence);

d.markerName.BW(:,3)=d.markerName.BW(:,3)*-1;
Revolution=d.markerName.BW(:,3);

if Cadence>=100
[Maxima,MaxIdx] = findpeaks(Revolution,Fs,'MinPeakDistance',0.003);
elseif Cadence<100
[Maxima,MaxIdx] = findpeaks(Revolution,Fs,'MinPeakDistance',0.03);
end
[Total_Revolutions, revolutions_]=size(Maxima);

% Power output 1 minute %
Wheel_Circumference = Pi*Wheel_Diameter;
Revolutions_10_secs=Total_Revolutions;
Revolutions_10_secs=Revolutions_10_secs/6;
Total_Revolutions=num2cell(Total_Revolutions);
Revolutions_1_minute=cell2mat(Total_Revolutions);%*12;
Meters_per_minute=Wheel_Circumference*Revolutions_1_minute;
Hour=60;

Meters_per_minute=num2cell(Meters_per_minute);
Meters_per_hour=cell2mat(Meters_per_minute)*60;

Meter_mile_conversion=0.00062137;
MPH=Meters_per_hour*0.00062137;
Power_Output_W=0.0115*(MPH)^3-0.0137*(MPH)^2+8.9788*(MPH);
Power_Kg=Power_Output_W/Weight;
Power_Output_W=round(Power_Output_W,2);
Power_Kg=round(Power_Kg,2);
Power_Output_W=num2str(Power_Output_W);
Power_Kg=num2str(Power_Kg);

% Power output 5 seconds %
if Cadence>=100
[Maxima_5,MaxIdx_5] = findpeaks(Revolution(1:2500,1),Fs,'MinPeakDistance',0.003);
elseif Cadence<100
[Maxima_5,MaxIdx_5] = findpeaks(Revolution(1:2500,1),Fs,'MinPeakDistance',0.03);
end        
    
[Total_Revolutions_5, revolutions_5]=size(Maxima_5);
Total_Revolutions_5=num2cell(Total_Revolutions_5);
Revolutions_1_minute_5=cell2mat(Total_Revolutions_5)*12;
Meters_per_minute_5=Wheel_Circumference*Revolutions_1_minute_5;
Meters_per_minute_5=num2cell(Meters_per_minute_5);
Meters_per_hour_5=cell2mat(Meters_per_minute_5)*60;

MPH_5=Meters_per_hour_5*0.00062137;
Power_Output_W_5=0.0115*(MPH_5)^3-0.0137*(MPH_5)^2+8.9788*(MPH_5);
Power_Kg_5=Power_Output_W_5/Weight;
Power_Output_W_5=round(Power_Output_W_5,2);
Power_Kg_5=round(Power_Kg_5,2);
Power_Output_W_5=num2str(Power_Output_W_5);
Power_Kg_5=num2str(Power_Kg_5);

% Power output 10 seconds %
if Cadence>=100
[Maxima_10,MaxIdx_10] = findpeaks(Revolution(1:5000,1),Fs,'MinPeakDistance',0.003);
elseif Cadence<100
[Maxima_10,MaxIdx_10] = findpeaks(Revolution(1:5000,1),Fs,'MinPeakDistance',0.03);
end

[Total_Revolutions_10, revolutions_10]=size(Maxima_10);
Total_Revolutions_10=num2cell(Total_Revolutions_10);
Revolutions_1_minute_10=cell2mat(Total_Revolutions_10)*6;
Meters_per_minute_10=Wheel_Circumference*Revolutions_1_minute_10;
Meters_per_minute_10=num2cell(Meters_per_minute_10);
Meters_per_hour_10=cell2mat(Meters_per_minute_10)*60;

MPH_10=Meters_per_hour_10*0.00062137;
Power_Output_W_10=0.0115*(MPH_10)^3-0.0137*(MPH_10)^2+8.9788*(MPH_10);
Power_Kg_10=Power_Output_W_10/Weight;
Power_Output_W_10=round(Power_Output_W_10,2);
Power_Kg_10=round(Power_Kg_10,2);
Power_Output_W_10=num2str(Power_Output_W_10);
Power_Kg_10=num2str(Power_Kg_10);

% Power output 20 seconds %
if Cadence>=100
[Maxima_20,MaxIdx_20] = findpeaks(Revolution(5001:10000,1),Fs,'MinPeakDistance',0.003);
elseif Cadence<100
[Maxima_20,MaxIdx_20] = findpeaks(Revolution(5001:10000,1),Fs,'MinPeakDistance',0.03);
end

[Total_Revolutions_20, revolutions_20]=size(Maxima_20);
Total_Revolutions_20=num2cell(Total_Revolutions_20);
Revolutions_1_minute_20=cell2mat(Total_Revolutions_20)*6;
Meters_per_minute_20=Wheel_Circumference*Revolutions_1_minute_20;
Meters_per_minute_20=num2cell(Meters_per_minute_20);
Meters_per_hour_20=cell2mat(Meters_per_minute_20)*60;

MPH_20=Meters_per_hour_20*0.00062137;
Power_Output_W_20=0.0115*(MPH_20)^3-0.0137*(MPH_20)^2+8.9788*(MPH_20);
Power_Kg_20=Power_Output_W_20/Weight;
Power_Output_W_20=round(Power_Output_W_20,2);
Power_Kg_20=round(Power_Kg_20,2);
Power_Output_W_20=num2str(Power_Output_W_20);
Power_Kg_20=num2str(Power_Kg_20);

% Power output 30 seconds %
if Cadence>=100
[Maxima_30,MaxIdx_30] = findpeaks(Revolution(10001:15000,1),Fs,'MinPeakDistance',0.003);
elseif Cadence<100
[Maxima_30,MaxIdx_30] = findpeaks(Revolution(10001:15000,1),Fs,'MinPeakDistance',0.03);
end

[Total_Revolutions_30, revolutions_30]=size(Maxima_30);
Total_Revolutions_30=num2cell(Total_Revolutions_30);
Revolutions_1_minute_30=cell2mat(Total_Revolutions_30)*6;
Meters_per_minute_30=Wheel_Circumference*Revolutions_1_minute_30;
Meters_per_minute_30=num2cell(Meters_per_minute_30);
Meters_per_hour_30=cell2mat(Meters_per_minute_30)*60;

MPH_30=Meters_per_hour_30*0.00062137;
Power_Output_W_30=0.0115*(MPH_30)^3-0.0137*(MPH_30)^2+8.9788*(MPH_30);
Power_Kg_30=Power_Output_W_30/Weight;
Power_Output_W_30=round(Power_Output_W_30,2);
Power_Kg_30=round(Power_Kg_30,2);
Power_Output_W_30=num2str(Power_Output_W_30);
Power_Kg_30=num2str(Power_Kg_30);


% Power output 40 seconds %
if Cadence>=100
[Maxima_40,MaxIdx_40] = findpeaks(Revolution(15001:20000,1),Fs,'MinPeakDistance',0.003);
elseif Cadence<100
[Maxima_40,MaxIdx_40] = findpeaks(Revolution(15001:20000,1),Fs,'MinPeakDistance',0.03);
end

[Total_Revolutions_40, revolutions_40]=size(Maxima_40);
Total_Revolutions_40=num2cell(Total_Revolutions_40);
Revolutions_1_minute_40=cell2mat(Total_Revolutions_40)*6;
Meters_per_minute_40=Wheel_Circumference*Revolutions_1_minute_40;
Meters_per_minute_40=num2cell(Meters_per_minute_40);
Meters_per_hour_40=cell2mat(Meters_per_minute_40)*60;

MPH_40=Meters_per_hour_40*0.00062137;
Power_Output_W_40=0.0115*(MPH_40)^3-0.0137*(MPH_40)^2+8.9788*(MPH_40);
Power_Kg_40=Power_Output_W_40/Weight;
Power_Output_W_40=round(Power_Output_W_40,2);
Power_Kg_40=round(Power_Kg_40,2);
Power_Output_W_40=num2str(Power_Output_W_40);
Power_Kg_40=num2str(Power_Kg_40);


% Power output 50 seconds %
if Cadence>=100 
[Maxima_50,MaxIdx_50] = findpeaks(Revolution(20001:25000,1),Fs,'MinPeakDistance',0.003);
elseif Cadence<100
[Maxima_50,MaxIdx_50] = findpeaks(Revolution(20001:25000,1),Fs,'MinPeakDistance',0.03);
end
    
[Total_Revolutions_50, revolutions_50]=size(Maxima_50);
Total_Revolutions_50=num2cell(Total_Revolutions_50);
Revolutions_1_minute_50=cell2mat(Total_Revolutions_50)*6;
Meters_per_minute_50=Wheel_Circumference*Revolutions_1_minute_50;
Meters_per_minute_50=num2cell(Meters_per_minute_50);
Meters_per_hour_50=cell2mat(Meters_per_minute_50)*60;

MPH_50=Meters_per_hour_50*0.00062137;
Power_Output_W_50=0.0115*(MPH_50)^3-0.0137*(MPH_50)^2+8.9788*(MPH_50);
Power_Kg_50=Power_Output_W_50/Weight;
Power_Output_W_50=round(Power_Output_W_50,2);
Power_Kg_50=round(Power_Kg_50,2);
Power_Output_W_50=num2str(Power_Output_W_50);
Power_Kg_50=num2str(Power_Kg_50);

% Power output 60 seconds %
if Cadence>=100
[Maxima_60,MaxIdx_60] = findpeaks(Revolution(25001:30000,1),Fs,'MinPeakDistance',0.003);
elseif Cadence<100
[Maxima_60,MaxIdx_60] = findpeaks(Revolution(25001:30000,1),Fs,'MinPeakDistance',0.03);
end

[Total_Revolutions_60, revolutions_60]=size(Maxima_60);
Total_Revolutions_60=num2cell(Total_Revolutions_60);
Revolutions_1_minute_60=cell2mat(Total_Revolutions_60)*6;
Meters_per_minute_60=Wheel_Circumference*Revolutions_1_minute_60;
Meters_per_minute_60=num2cell(Meters_per_minute_60);
Meters_per_hour_60=cell2mat(Meters_per_minute_60)*60;

MPH_60=Meters_per_hour_60*0.00062137;
Power_Output_W_60=0.0115*(MPH_60)^3-0.0137*(MPH_60)^2+8.9788*(MPH_60);
Power_Kg_60=Power_Output_W_60/Weight;
Power_Output_W_60=round(Power_Output_W_60,2);
Power_Kg_60=round(Power_Kg_60,2);
Power_Output_W_60=num2str(Power_Output_W_60);
Power_Kg_60=num2str(Power_Kg_60);

msgbox(['Power(W)Total= ',Power_Output_W,'               ','Power.kg=      ' Power_Kg]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Obtain Angles %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in View_angles.
function View_angles_Callback(hObject, eventdata, handles)
% hObject    handle to View_angles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OutputFile file fn d Hip_Vector_L Hip_Vector_R Knee_Vector_L Ankle_Vector_R Knee_Vector_R Ankle_Vector_L  data Ankle_Angle_R Ankle_Angle_L Knee_Angle_R Knee_Angle_L Hip_Angle_R Hip_Angle_L...
Hip_Angle_L_Y Hip_Angle_R_Y Knee_Angle_L_Y Knee_Angle_R_Y Ankle_Angle_L_Y Ankle_Angle_R_Y  Back_Bike_R Back_Bike_L Shoulder_Angle_L Shoulder_Angle_R Elbow_Angle_R Elbow_Angle_L...
Shoulder_Angle_L_Y Shoulder_Angle_R_Y Elbow_Angle_L_Y Elbow_Angle_R_Y  Saddle_Setback_L Saddle_Setback_R KOPS_Angle_L KOPS_Angle_R Tangential_Crank_Angle_R Tangential_Crank_Angle_L...
Hip_Angle_velocity_L Hip_Angle_velocity_R Knee_Angle_velocity_L Knee_Angle_velocity_R Ankle_Angle_velocity_L Ankle_Angle_velocity_R Crank_L_angle_velocity Crank_R_angle_velocity...
Hip_Angle_Acceleration_L Hip_Angle_Acceleration_R Knee_Angle_Acceleration_L Knee_Angle_Acceleration_R Ankle_Angle_Acceleration_L Ankle_Angle_Acceleration_R Crank_L_angle_Acceleration Crank_R_angle_Acceleration...
Crank_R_angle Crank_L_angle Downward_Crank_L Upward_Crank_L Upward_Crank_2_L Downward_Crank_R Upward_Crank_R Upward_Crank_2_R i q w e r t y %#ok<*NUSED>
i=[];
q=[];
w=[];
e=[];
r=[]; 
t =[];
y=[];
% Shoulder Left

if (d.EXISTS.ACROM_L==0 && d.EXISTS.IL_CREST_L==0 && d.EXISTS.LAT_ELB_L==0)
elseif (d.EXISTS.ACROM_L~=0 && d.EXISTS.IL_CREST_L~=0 && d.EXISTS.LAT_ELB_L ~=0)
Shoulder_Vector_L= [d.markerName.ACROM_L d.markerName.LAT_ELB_L  d.markerName.ACROM_L d.markerName.ILCREST_L];
data=Shoulder_Vector_L;    
end
d.lastframe= size(d.data);
d.lastframe=d.lastframe(1);
% "assigning" zero to the x-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Shoulder_L(i,:)=alpha(i,:);
end
data=[];

% Shoulder Right

if (d.EXISTS.ACROM_R==0 && d.EXISTS.IL_CREST_R==0 && d.EXISTS.LAT_ELB_R==0)
elseif (d.EXISTS.ACROM_R~=0 && d.EXISTS.IL_CREST_R~=0 && d.EXISTS.LAT_ELB_R ~=0)
Shoulder_Vector_R= [d.markerName.ACROM_R d.markerName.LAT_ELB_R  d.markerName.ACROM_R d.markerName.ILCREST_R];
data=Shoulder_Vector_R;    
end
d.lastframe= size(d.data);
d.lastframe=d.lastframe(1);
% "assigning" zero to the x-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Shoulder_R(i,:)=alpha(i,:);
end
data=[];

% Elbow Left

if (d.EXISTS.LAT_ELB_L==0 && d.EXISTS.ACROM_L==0 && d.EXISTS.WRA_L==0)
elseif (d.EXISTS.LAT_ELB_L~=0 && d.EXISTS.ACROM_L~=0 && d.EXISTS.WRA_L ~=0)
Elbow_Vector_L= [d.markerName.LAT_ELB_L d.markerName.ACROM_L  d.markerName.LAT_ELB_L d.markerName.WRA_L];
data=Elbow_Vector_L;    
end
d.lastframe= size(d.data);
d.lastframe=d.lastframe(1);
% "assigning" zero to the x-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Elbow_L(i,:)=alpha(i,:);
end
data=[];

% Elbow Right

if (d.EXISTS.LAT_ELB_R==0 && d.EXISTS.ACROM_R==0 && d.EXISTS.WRA_R==0)
elseif (d.EXISTS.LAT_ELB_R~=0 && d.EXISTS.ACROM_R~=0 && d.EXISTS.WRA_R ~=0)
Elbow_Vector_R= [d.markerName.LAT_ELB_R d.markerName.ACROM_R  d.markerName.LAT_ELB_R d.markerName.WRA_R];
data=Elbow_Vector_R;    
end
d.lastframe= size(d.data);
d.lastframe=d.lastframe(1);
% "assigning" zero to the x-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Elbow_R(i,:)=alpha(i,:);
end
data=[];

% Hip Left

if (d.EXISTS.ACROM_L==0 && d.EXISTS.GT_L==0 && d.EXISTS.KNEE_LAT_L==0)
elseif (d.EXISTS.ACROM_L~=0 && d.EXISTS.GT_L~=0 && d.EXISTS.KNEE_LAT_L ~=0)
Hip_Vector_L= [d.markerName.GT_L d.markerName.ACROM_L  d.markerName.GT_L d.markerName.KNEE_LAT_L];
data=Hip_Vector_L;
end
d.lastframe= size(d.data);
d.lastframe=d.lastframe(1);
% "assigning" zero to the x-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Hip_L(i,:)=alpha(i,:);
end
data=[];

% Hip Right 

if (d.EXISTS.ACROM_R==0 && d.EXISTS.GT_R==0 && d.EXISTS.KNEE_LAT_R==0)
elseif (d.EXISTS.ACROM_R~=0 && d.EXISTS.GT_R~=0 && d.EXISTS.KNEE_LAT_R ~=0)
Hip_Vector_R= [d.markerName.GT_R d.markerName.ACROM_R  d.markerName.GT_R d.markerName.KNEE_LAT_R];
data=Hip_Vector_R; 
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
  vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
  x=cross(vect1,vect2);
  alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
  y=x(3,1);
  % Determining if alpha b/w 0 and pi or b/w -pi and 0
  if sign(y) == -1;   alphacos = -alphacos; end
  alpha(i,:) = alphacos;
  d.angles.Hip_R(i,:)=alpha(i,:);
end


data=[];


% Knee Left

if (d.EXISTS.GT_L==0 && d.EXISTS.KNEE_LAT_L==0 && d.EXISTS.MAL_LAT_L==0)
elseif (d.EXISTS.GT_L~=0 && d.EXISTS.KNEE_LAT_L~=0 && d.EXISTS.MAL_LAT_L ~=0)
Knee_Vector_L= [d.markerName.KNEE_LAT_L d.markerName.GT_L  d.markerName.KNEE_LAT_L d.markerName.MAL_LAT_L];
data=Knee_Vector_L;
    
end

% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];

data(:,[1 4 7 10])=0;

r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;

% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);

for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Knee_L(i,:)=alpha(i,:);
end
data=[];
  
% Knee Right

if (d.EXISTS.GT_R==0 && d.EXISTS.KNEE_LAT_R==0 && d.EXISTS.MAL_LAT_R==0)
elseif (d.EXISTS.GT_R~=0 && d.EXISTS.KNEE_LAT_R~=0 && d.EXISTS.MAL_LAT_R ~=0)
Knee_Vector_R= [d.markerName.KNEE_LAT_R d.markerName.GT_R  d.markerName.KNEE_LAT_R d.markerName.MAL_LAT_R];
data=Knee_Vector_R;   
end
% "assigning" zero to the z-coordinates
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Knee_R(i,:)=alpha(i,:);
end
data=[];

% Ankle Left

if (d.EXISTS.KNEE_LAT_L==0 && d.EXISTS.MAL_LAT_L==0 && d.EXISTS.MTP5_L==0)
elseif (d.EXISTS.KNEE_LAT_L~=0 && d.EXISTS.MAL_LAT_L~=0 && d.EXISTS.MTP5_L~=0)
Ankle_Vector_L= [ d.markerName.MAL_LAT_L d.markerName.KNEE_LAT_L  d.markerName.MAL_LAT_L d.markerName.MTP5_L];
data=Ankle_Vector_L;   
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Ankle_L(i,:)=alpha(i,:);
end
data=[];

% Ankle Right

if (d.EXISTS.KNEE_LAT_R==0 && d.EXISTS.MAL_LAT_R==0 && d.EXISTS.MTP5_R==0)
elseif (d.EXISTS.KNEE_LAT_R~=0 && d.EXISTS.MAL_LAT_R~=0 && d.EXISTS.MTP5_R~=0)
Ankle_Vector_R= [ d.markerName.MAL_LAT_R d.markerName.KNEE_LAT_R d.markerName.MAL_LAT_R d.markerName.MTP5_R];
data=Ankle_Vector_R;  
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Ankle_R(i,:)=alpha(i,:);
end
data=[];

% Angle Back_Bike_R

if (d.EXISTS.ACROM_R==0 && d.EXISTS.SAD_TUB_R==0 && d.EXISTS.BAR_TUB_R==0)
elseif (d.EXISTS.ACROM_R~=0 && d.EXISTS.SAD_TUB_R~=0 && d.EXISTS.BAR_TUB_R~=0)
Back_Bike_Vector_R= [ d.markerName.SAD_TUB_R d.markerName.ACROM_R d.markerName.SAD_TUB_R d.markerName.BAR_TUB_R];
data=Back_Bike_Vector_R;    
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Back_Bike_R(i,:)=alpha(i,:);
end
data=[];

% Angle Back_Bike_L

if (d.EXISTS.ACROM_L==0 && d.EXISTS.SAD_TUB_L==0 && d.EXISTS.BAR_TUB_L==0)
elseif (d.EXISTS.ACROM_L~=0 && d.EXISTS.SAD_TUB_L~=0 && d.EXISTS.BAR_TUB_L~=0)
Back_Bike_Vector_L= [ d.markerName.SAD_TUB_L d.markerName.ACROM_L d.markerName.SAD_TUB_L d.markerName.BAR_TUB_L];
data=Back_Bike_Vector_L;   
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Back_Bike_L(i,:)=alpha(i,:);
end
data=[];

% Saddle set back Left

if (d.EXISTS.GT_L==0 && d.EXISTS.SAD_TUB_L==0 && d.EXISTS.CRANK_L==0)
elseif (d.EXISTS.GT_L~=0 && d.EXISTS.SAD_TUB_L~=0 && d.EXISTS.CRANK_L~=0)
Saddle_Setback_Vector_L= [ d.markerName.SAD_TUB_L d.markerName.GT_L d.markerName.SAD_TUB_L d.markerName.CRANK_L];
data=Saddle_Setback_Vector_L;    
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Saddle_Setback_L(i,:)=alpha(i,:);
end
data=[];

% Saddle set back Right

if (d.EXISTS.GT_R==0 && d.EXISTS.SAD_TUB_R==0 && d.EXISTS.CRANK_R==0)
elseif (d.EXISTS.GT_R~=0 && d.EXISTS.SAD_TUB_R~=0 && d.EXISTS.CRANK_R~=0)
Saddle_Setback_Vector_R= [ d.markerName.SAD_TUB_R d.markerName.GT_R d.markerName.SAD_TUB_R d.markerName.CRANK_R];
data=Saddle_Setback_Vector_R;    
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Saddle_Setback_R(i,:)=alpha(i,:);
end
data=[];

% KOPS angle left

if (d.EXISTS.KNEE_LAT_L==0 && d.EXISTS.MTP5_L==0)
elseif (d.EXISTS.KNEE_LAT_L~=0 && d.EXISTS.MTP5_L~=0)
Virtual_MTP5_L=d.markerName.MTP5_L;
Virtual_MTP5_L(:,2)=400;
KOPS_Vector_L= [ d.markerName.MTP5_L d.markerName.KNEE_LAT_L d.markerName.MTP5_L Virtual_MTP5_L];
data=KOPS_Vector_L;    
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.KOPS_Vector_L(i,:)=alpha(i,:);
end
data=[];

% KOPS angle Right

if (d.EXISTS.KNEE_LAT_R==0 && d.EXISTS.MTP5_R==0)
elseif (d.EXISTS.KNEE_LAT_R~=0 && d.EXISTS.MTP5_R~=0)
Virtual_MTP5_R=d.markerName.MTP5_R;
Virtual_MTP5_R(:,2)=400;
KOPS_Vector_R= [ d.markerName.MTP5_R d.markerName.KNEE_LAT_R d.markerName.MTP5_R Virtual_MTP5_R];
data=KOPS_Vector_R;    
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.KOPS_Vector_R(i,:)=alpha(i,:);
end

% Crank Angle_R

if (d.EXISTS.CRANK_R==0 && d.EXISTS.MTP5_R==0)
elseif (d.EXISTS.CRANK_R~=0 && d.EXISTS.MTP5_R~=0)
Vert_Max_Crank=d.markerName.CRANK_R;
Vert_Max_Crank(:,3)=700;
Vert_Max_Crank_Vector= [ d.markerName.CRANK_R Vert_Max_Crank d.markerName.CRANK_R d.markerName.MTP5_R];
data=Vert_Max_Crank_Vector;   
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Crank_R_angle(i,:)=alpha(i,:);
end
data=[];

% Crank Angle Left %

if (d.EXISTS.CRANK_L==0 && d.EXISTS.MTP5_L==0)
elseif (d.EXISTS.CRANK_L~=0 && d.EXISTS.MTP5_L~=0)
Vert_Max_Crank_L=d.markerName.CRANK_L;
Vert_Max_Crank_L(:,3)=700;
Vert_Max_Crank_Vector_L= [ d.markerName.CRANK_L Vert_Max_Crank_L d.markerName.CRANK_L d.markerName.MTP5_L];
data=Vert_Max_Crank_Vector_L;   
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[1 4 7 10])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Crank_L_angle(i,:)=alpha(i,:);
end
data=[];

% d.Cuttoff.Hip_L=auto_corr((d.angles.Hip_L),500,1);
% 
% d.Cuttoff.Hip_R=auto_corr((d.angles.Hip_R),500,1);
% 
% d.Cuttoff.Knee_L=auto_corr((d.angles.Knee_L),500,1);
% 
% d.Cuttoff.Knee_R=auto_corr((d.angles.Knee_R),500,1);
% 
% d.Cuttof.Ankle_R=auto_corr((d.angles.Ankle_R),500,1);
% 
% d.Cuttof.Ankle_R=auto_corr((d.angles.Ankle_R),500,1);
       

% Orientate the found angle to the correct measure angle %
for i=1:size(d.angles.Hip_L)
Shoulder_Angle_L(i,1)=180-d.angles.Shoulder_L(i,1);
Shoulder_Angle_R(i,1)=180-d.angles.Shoulder_R(i,1);
Elbow_Angle_L(i,1)=180-d.angles.Elbow_L(i,:);
Elbow_Angle_R(i,1)=180-d.angles.Elbow_R(i,:);
Hip_Angle_L(i,1)=180-d.angles.Hip_L(i,1);
Hip_Angle_R(i,1)=180-d.angles.Hip_R(i,1);
Knee_Angle_L(i,1)=180-d.angles.Knee_L(i,1);
Knee_Angle_R(i,1)=180-d.angles.Knee_R(i,1);
Ankle_Angle_L(i,1)=180-d.angles.Ankle_L(i,1);
Ankle_Angle_R(i,1)=180-d.angles.Ankle_R(i,1);
Back_Bike_L(i,1)=180-d.angles.Back_Bike_L(i,1);
Back_Bike_R(i,1)=180-d.angles.Back_Bike_R(i,1);
Saddle_Setback_L(i,1)=180-d.angles.Saddle_Setback_L(i,:);
Saddle_Setback_R(i,1)=180-d.angles.Saddle_Setback_R(i,:);
KOPS_Angle_L(i,1)=180-d.angles.KOPS_Vector_L(i,1);
KOPS_Angle_R(i,1)=180-d.angles.KOPS_Vector_R(i,1);
Crank_L_angle(i,1)=d.angles.Crank_L_angle(i,1);
Crank_R_angle(i,1)=d.angles.Crank_R_angle(i,1);
end

% Determines the downward and upward angles of the crank %

% Left Crank %
for i=1:size(Crank_L_angle)
if i==size(Crank_L_angle)
elseif i~=size(Crank_L_angle)
if Crank_L_angle (i+1) > Crank_L_angle (i)
Downward_Crank_L(i)=Crank_L_angle(i);
else Upward_Crank_L(i)= Crank_L_angle (i);           
end
end
end
Downward_Crank_L(Downward_Crank_L==0)= NaN;
Downward_Crank_L=Downward_Crank_L';
Upward_Crank_L(Upward_Crank_L==0)= NaN;
Upward_Crank_L=Upward_Crank_L';
for i=1:size(Upward_Crank_L)
Upward_Crank_L(i)=180-Upward_Crank_L(i);
Upward_Crank_2_L(i)=180+Upward_Crank_L(i);
end
Upward_Crank_L=Upward_Crank_2_L;
Upward_Crank_L=Upward_Crank_L';
Downward_Crank_L(isnan(Downward_Crank_L))=0;
Upward_Crank_L(isnan(Upward_Crank_L))=0;
for i=1:size(Downward_Crank_L)
if Downward_Crank_L(i)==0
Downward_Crank_L(i)=Upward_Crank_L(i);
else Downward_Crank_L(i)=Downward_Crank_L(i);
end
end

Tangential_Crank_Angle_L= Downward_Crank_L;
          
% Right Crank %

for i=1:size(Crank_R_angle)
if i==size(Crank_R_angle)
elseif i~=size(Crank_R_angle)
if Crank_R_angle (i+1) > Crank_R_angle (i)
Downward_Crank_R(i)=Crank_R_angle(i);
else Upward_Crank_R(i)= Crank_R_angle (i); %#ok<*SEPEX>              
end
end
end
Downward_Crank_R(Downward_Crank_R==0)= NaN;
Downward_Crank_R=Downward_Crank_R';
Upward_Crank_R(Upward_Crank_R==0)= NaN;
Upward_Crank_R=Upward_Crank_R';
for i=1:size(Upward_Crank_R)
Upward_Crank__R(i)=180-Upward_Crank_R(i); %#ok<*AGROW>
Upward_Crank_2_R(i)=180+Upward_Crank__R(i);
end
Upward_Crank_R=Upward_Crank_2_R;
Upward_Crank_R=Upward_Crank_R';
Downward_Crank_R(isnan(Downward_Crank_R))=0;
Upward_Crank_R(isnan(Upward_Crank_R))=0;
for i=1:size(Downward_Crank_R)
if Downward_Crank_R(i)==0
Downward_Crank_R(i)=Upward_Crank_R(i);
else Downward_Crank_R(i)=Downward_Crank_R(i);
end
end

Tangential_Crank_Angle_R= Downward_Crank_R;

% Get rid of any NaN Rows %
Shoulder_Angle_L=Shoulder_Angle_L(~any(isnan(Shoulder_Angle_L),2),:);
Shoulder_Angle_R=Shoulder_Angle_R(~any(isnan(Shoulder_Angle_R),2),:);
Elbow_Angle_R=Elbow_Angle_R(~any(isnan(Elbow_Angle_R),2),:);
Elbow_Angle_L=Elbow_Angle_L(~any(isnan(Elbow_Angle_L),2),:);
Hip_Angle_L=Hip_Angle_L(~any(isnan(Hip_Angle_L),2),:);
Hip_Angle_R=Hip_Angle_R(~any(isnan(Hip_Angle_R),2),:);
Knee_Angle_L=Knee_Angle_L(~any(isnan(Knee_Angle_L),2),:);
Knee_Angle_R=Knee_Angle_R(~any(isnan(Knee_Angle_R),2),:);
Ankle_Angle_L=Ankle_Angle_L(~any(isnan(Ankle_Angle_L),2),:);
Ankle_Angle_R=Ankle_Angle_R(~any(isnan(Ankle_Angle_R),2),:);
Back_Bike_L=Back_Bike_L(~any(isnan(Back_Bike_L),2),:);
Back_Bike_R=Back_Bike_R(~any(isnan(Back_Bike_R),2),:);
Saddle_Setback_L=Saddle_Setback_L(~any(isnan(Saddle_Setback_L),2),:);
Saddle_Setback_R=Saddle_Setback_R(~any(isnan(Saddle_Setback_R),2),:);
KOPS_Angle_L=KOPS_Angle_L(~any(isnan(KOPS_Angle_L),2),:);
KOPS_Angle_R=KOPS_Angle_R(~any(isnan(KOPS_Angle_R),2),:);
Crank_L_angle=Crank_L_angle(~any(isnan(Crank_L_angle),2),:);
Crank_R_angle=Crank_R_angle(~any(isnan(Crank_R_angle),2),:);

% Filter Waveforms %
wn = 6/250;
[b, a] = butter(4,wn, 'low');
Shoulder_Angle_L=filtfilt(b,a,Shoulder_Angle_L);
Shoulder_Angle_R=filtfilt(b,a,Shoulder_Angle_R);
Elbow_Angle_R=filtfilt(b,a,Elbow_Angle_R);
Elbow_Angle_L=filtfilt(b,a,Elbow_Angle_L);
Hip_Angle_L=filtfilt(b,a,Hip_Angle_L);
Hip_Angle_R=filtfilt(b,a,Hip_Angle_R);
Knee_Angle_L=filtfilt(b,a,Knee_Angle_L);
Knee_Angle_R=filtfilt(b,a,Knee_Angle_R);   
Ankle_Angle_L=filtfilt(b,a,Ankle_Angle_L);
Ankle_Angle_R=filtfilt(b,a,Ankle_Angle_R);   
Back_Bike_L=filtfilt(b,a,Back_Bike_L);
Back_Bike_R=filtfilt(b,a,Back_Bike_R);
Saddle_Setback_L=filtfilt(b,a,Saddle_Setback_L);
Saddle_Setback_R=filtfilt(b,a,Saddle_Setback_R);
KOPS_Angle_L=filtfilt(b,a,KOPS_Angle_L);
KOPS_Angle_R=filtfilt(b,a,KOPS_Angle_R);


         
%Angular velocity %

[Hip_Angle_velocity_L]=gradient(Hip_Angle_L);
[Hip_Angle_velocity_R]=gradient(Hip_Angle_R);
[Knee_Angle_velocity_L]=gradient(Knee_Angle_L);
[Knee_Angle_velocity_R]=gradient(Knee_Angle_R);  
[Ankle_Angle_velocity_L]=gradient(Ankle_Angle_L);
[Ankle_Angle_velocity_R]=gradient(Ankle_Angle_R);
[Crank_L_angle_velocity]=gradient(Crank_L_angle);
[Crank_R_angle_velocity]=gradient(Crank_R_angle);     
 
% Angular Acceleration %       

[Hip_Angle_Acceleration_L]=gradient(Hip_Angle_velocity_L);
[Hip_Angle_Acceleration_R]=gradient(Hip_Angle_velocity_R);
[Knee_Angle_Acceleration_L]=gradient(Knee_Angle_velocity_L);
[Knee_Angle_Acceleration_R]=gradient(Knee_Angle_velocity_R);
[Ankle_Angle_Acceleration_L]=gradient(Ankle_Angle_velocity_L);
[Ankle_Angle_Acceleration_R]=gradient(Ankle_Angle_velocity_R);
[Crank_L_angle_Acceleration]=gradient(Crank_L_angle_velocity);
[Crank_R_angle_Acceleration]=gradient(Crank_R_angle_velocity); 
        
% Change from radians to angles %

Hip_Angle_velocity_L=rad2deg(Hip_Angle_velocity_L);
Hip_Angle_velocity_R=rad2deg(Hip_Angle_velocity_R);
Knee_Angle_velocity_L=rad2deg(Knee_Angle_velocity_L);
Knee_Angle_velocity_R=rad2deg(Knee_Angle_velocity_R);
Ankle_Angle_velocity_L=rad2deg(Ankle_Angle_velocity_L);
Ankle_Angle_velocity_R=rad2deg(Ankle_Angle_velocity_R);
Crank_L_angle_velocity=rad2deg(Crank_L_angle_velocity);
Crank_R_angle_velocity=rad2deg(Crank_R_angle_velocity); 
      
Hip_Angle_Acceleration_L=rad2deg(Hip_Angle_Acceleration_L);
Hip_Angle_Acceleration_R=rad2deg(Hip_Angle_Acceleration_R);
Knee_Angle_Acceleration_L=rad2deg(Knee_Angle_Acceleration_L);
Knee_Angle_Acceleration_R=rad2deg(Knee_Angle_Acceleration_R);
Ankle_Angle_Acceleration_L=rad2deg(Ankle_Angle_Acceleration_L);
Ankle_Angle_Acceleration_R=rad2deg(Ankle_Angle_Acceleration_R);
Crank_L_angle_Acceleration=rad2deg(Crank_L_angle_Acceleration);
Crank_R_angle_Acceleration=rad2deg(Crank_R_angle_Acceleration); 
       
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
% Angles Y %

% Shoulder Left %

if (d.EXISTS.ACROM_L==0 && d.EXISTS.IL_CREST_L==0 && d.EXISTS.LAT_ELB_L==0)
elseif (d.EXISTS.ACROM_L~=0 && d.EXISTS.IL_CREST_L~=0 && d.EXISTS.LAT_ELB_L ~=0)
Shoulder_Vector_L_y= [d.markerName.ACROM_L d.markerName.LAT_ELB_L  d.markerName.ACROM_L d.markerName.ILCREST_L];
data=Shoulder_Vector_L_y;    
end
d.lastframe= size(d.data);
d.lastframe=d.lastframe(1);
% "assigning" zero to the x-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[2 5 8 11])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Shoulder_L_y(i,:)=alpha(i,:);
end
data=[];

% Shoulder Right %

if (d.EXISTS.ACROM_R==0 && d.EXISTS.IL_CREST_R==0 && d.EXISTS.LAT_ELB_R==0)
elseif (d.EXISTS.ACROM_R~=0 && d.EXISTS.IL_CREST_R~=0 && d.EXISTS.LAT_ELB_R ~=0)
Shoulder_Vector_R_y= [d.markerName.ACROM_R d.markerName.LAT_ELB_R  d.markerName.ACROM_R d.markerName.ILCREST_R];
data=Shoulder_Vector_R_y; 
end
d.lastframe= size(d.data);
d.lastframe=d.lastframe(1);
% "assigning" zero to the x-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[2 5 8 11])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Shoulder_R_y(i,:)=alpha(i,:);
end
data=[];

% elbow Left %

if (d.EXISTS.LAT_ELB_L==0 && d.EXISTS.ACROM_L==0 && d.EXISTS.WRA_L==0)
elseif (d.EXISTS.LAT_ELB_L~=0 && d.EXISTS.ACROM_L~=0 && d.EXISTS.WRA_L ~=0)
Elbow_Vector_L_y= [d.markerName.LAT_ELB_L d.markerName.ACROM_L  d.markerName.LAT_ELB_L d.markerName.WRA_L];
data=Elbow_Vector_L_y;
end
d.lastframe= size(d.data);
d.lastframe=d.lastframe(1);
% "assigning" zero to the x-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[2 5 8 11])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Elbow_L_y(i,:)=alpha(i,:);
end
data=[];

% elbow Right %

if (d.EXISTS.LAT_ELB_R==0 && d.EXISTS.ACROM_R==0 && d.EXISTS.WRA_R==0)
elseif (d.EXISTS.LAT_ELB_R~=0 && d.EXISTS.ACROM_R~=0 && d.EXISTS.WRA_R ~=0)
Elbow_Vector_R_y= [d.markerName.LAT_ELB_R d.markerName.ACROM_R  d.markerName.LAT_ELB_R d.markerName.WRA_R];
data=Elbow_Vector_R_y;    
end
d.lastframe= size(d.data);
d.lastframe=d.lastframe(1);
% "assigning" zero to the x-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[2 5 8 11])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Elbow_R_y(i,:)=alpha(i,:);
end
data=[];

% Hip Left %

if (d.EXISTS.ACROM_L==0 && d.EXISTS.GT_L==0 && d.EXISTS.KNEE_LAT_L==0)
elseif (d.EXISTS.ACROM_L~=0 && d.EXISTS.GT_L~=0 && d.EXISTS.KNEE_LAT_L ~=0)
Hip_Vector_L_y= [d.markerName.GT_L d.markerName.ACROM_L  d.markerName.GT_L d.markerName.KNEE_LAT_L];
data=Hip_Vector_L_y;
end
d.lastframe= size(d.data);
d.lastframe=d.lastframe(1);
% "assigning" zero to the y-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[2 5 8 11])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Hip_L_y(i,:)= alpha(i,:);
end
data=[];

% Hip Right %

if (d.EXISTS.ACROM_R==0 && d.EXISTS.GT_R==0 && d.EXISTS.KNEE_LAT_R==0)
elseif (d.EXISTS.ACROM_R~=0 && d.EXISTS.GT_R~=0 && d.EXISTS.KNEE_LAT_R ~=0)
Hip_Vector_R_y= [d.markerName.GT_R d.markerName.ACROM_R  d.markerName.GT_R d.markerName.KNEE_LAT_R];
data=Hip_Vector_R_y;
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[2 5 8 11])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Hip_R_y(i,:)=alpha(i,:);
end
data=[];

% Knee Left %

if (d.EXISTS.GT_L==0 && d.EXISTS.KNEE_LAT_L==0 && d.EXISTS.MAL_LAT_L==0)
elseif (d.EXISTS.GT_L~=0 && d.EXISTS.KNEE_LAT_L~=0 && d.EXISTS.MAL_LAT_L ~=0)
Knee_Vector_L_y= [d.markerName.KNEE_LAT_L d.markerName.GT_L  d.markerName.KNEE_LAT_L d.markerName.MAL_LAT_L];
data=Knee_Vector_L_y;
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[2 5 8 11])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Knee_L_y(i,:)=alpha(i,:);
end
data=[];
  
% Knee Right %

if (d.EXISTS.GT_R==0 && d.EXISTS.KNEE_LAT_R==0 && d.EXISTS.MAL_LAT_R==0)
elseif (d.EXISTS.GT_R~=0 && d.EXISTS.KNEE_LAT_R~=0 && d.EXISTS.MAL_LAT_R ~=0)
Knee_Vector_R_y= [d.markerName.KNEE_LAT_R d.markerName.GT_R  d.markerName.KNEE_LAT_R d.markerName.MAL_LAT_R];
data=Knee_Vector_R_y;
end
% "assigning" zero to the z-coordinates
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[2 5 8 11])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Knee_R_y(i,:)= alpha(i,:) ;
end
data=[];

% Ankle Left %

if (d.EXISTS.KNEE_LAT_L==0 && d.EXISTS.MAL_LAT_L==0 && d.EXISTS.MTP5_L==0)
elseif (d.EXISTS.KNEE_LAT_L~=0 && d.EXISTS.MAL_LAT_L~=0 && d.EXISTS.MTP5_L~=0)
Ankle_Vector_L_y= [ d.markerName.MAL_LAT_L d.markerName.KNEE_LAT_L  d.markerName.MAL_LAT_L d.markerName.MTP5_L];
data=Ankle_Vector_L_y;
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[2 5 8 11])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Ankle_L_y(i,:)= alpha(i,:);
end
data=[];

% Ankle Right

if (d.EXISTS.KNEE_LAT_R==0 && d.EXISTS.MAL_LAT_R==0 && d.EXISTS.MTP5_R==0)
elseif (d.EXISTS.KNEE_LAT_R~=0 && d.EXISTS.MAL_LAT_R~=0 && d.EXISTS.MTP5_R~=0)
Ankle_Vector_R_y= [ d.markerName.MAL_LAT_R d.markerName.KNEE_LAT_R d.markerName.MAL_LAT_R d.markerName.MTP5_R];
data=Ankle_Vector_R_y;
end
% "assigning" zero to the z-coordinates 
tmp=data; data=[]; data(:,[1 2 3 4 5 6 7 8 9 10 11 12])=tmp; 
data(size(data,1),12)=[0];
data(:,[2 5 8 11])=0;
r1=data(:,1:3); r2=data(:,4:6); r3=data(:,7:9); r4=data(:,10:12); 
v1=r2-r1; v2=r4-r3;
% Preassigning alpha to speed up program
alpha=zeros(size(v1,1),1);
for i=1:size(v1,1)
vect1=[v1(i,:)]'; vect2=[v2(i,:)]';
x=cross(vect1,vect2);
alphacos=rad2deg(acos(sum(vect1.*vect2)/(norm(vect1)*norm(vect2))));
y=x(3,1);
% Determining if alpha b/w 0 and pi or b/w -pi and 0
if sign(y) == -1;   alphacos = -alphacos; end
alpha(i,:) = alphacos;
d.angles.Ankle_R_y(i,:)=alpha(i,:);
end
data=[];

% d.Cuttoff.Hip_L=auto_corr((d.angles.Hip_L),500,1);
% 
% d.Cuttoff.Hip_R=auto_corr((d.angles.Hip_R),500,1);
% 
% d.Cuttoff.Knee_L=auto_corr((d.angles.Knee_L),500,1);
% 
% d.Cuttoff.Knee_R=auto_corr((d.angles.Knee_R),500,1);
% 
% d.Cuttof.Ankle_R=auto_corr((d.angles.Ankle_R),500,1);
% 
% d.Cuttof.Ankle_R=auto_corr((d.angles.Ankle_R),500,1);

% Orientate the found angle to the correct measure angle %

for i=1:size(d.angles.Hip_L_y)
Hip_Angle_L_Y(i,1)=180-d.angles.Hip_L_y(i,1);
Hip_Angle_R_Y(i,1)=180-d.angles.Hip_R_y(i,1);
Knee_Angle_L_Y(i,1)=180-d.angles.Knee_L_y(i,1);
Knee_Angle_R_Y(i,1)=180-d.angles.Knee_R_y(i,1);
Ankle_Angle_L_Y(i,1)=180-d.angles.Ankle_L_y(i,1);
Ankle_Angle_R_Y(i,1)=180-d.angles.Ankle_R_y(i,1);

Shoulder_Angle_L_Y(i,1)=180-d.angles.Shoulder_L_y(i,1);
Shoulder_Angle_R_Y(i,1)=180-d.angles.Shoulder_R_y(i,1);
Elbow_Angle_L_Y(i,1)=180-d.angles.Elbow_L_y(i,1);
Elbow_Angle_R_Y(i,1)=180-d.angles.Elbow_R_y(i,1);
end

% Filters the angles %

wn = 6/250;
[b, a] = butter(4,wn, 'low');
Hip_Angle_L_Y=filtfilt(b,a,Hip_Angle_L_Y);
Hip_Angle_R_Y=filtfilt(b,a,Hip_Angle_R_Y);
Knee_Angle_L_Y=filtfilt(b,a,Knee_Angle_L_Y);
Knee_Angle_R_Y=filtfilt(b,a,Knee_Angle_R_Y);
Ankle_Angle_L_Y=filtfilt(b,a,Ankle_Angle_L_Y);
Ankle_Angle_R_Y=filtfilt(b,a,Ankle_Angle_R_Y);
Shoulder_Angle_L_Y=filtfilt(b,a,Shoulder_Angle_L_Y);
Shoulder_Angle_R_Y=filtfilt(b,a,Shoulder_Angle_R_Y);
Elbow_Angle_L_Y=filtfilt(b,a,Elbow_Angle_L_Y);
Elbow_Angle_R_Y=filtfilt(b,a,Elbow_Angle_R_Y);
 Cycling_Graphs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Export dynamic trials %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in Export_Dynamic.
function Export_Dynamic_Callback(hObject, eventdata, handles)
% hObject    handle to Export_Dynamic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OutputFile file1 Height Weight...
Cadence Wheel_Diameter Wheel_Circumference Revolutions_10_secs Revolutions_1_minute Meters_per_hour MPH Power_Output_W...
Power_Kg Hip_Angle_L Hip_Angle_R Knee_Angle_L Knee_Angle_R Ankle_Angle_L Ankle_Angle_R...
Hip_Angle_L_Max_val Hip_Angle_R_Max_val Hip_Angle_L_Min_val Hip_Angle_R_Min_val Knee_Angle_L_Max_val Knee_Angle_L_Min_val...
Knee_Angle_R_Max_val Knee_Angle_R_Min_val Ankle_Angle_L_Max_val Ankle_Angle_L_Min_val Ankle_Angle_R_Max_val Ankle_Angle_R_Min_val...
Hip_Angle_L_Knee_Flex Hip_Angle_L_Knee_ext Hip_Angle_R_Knee_Flex Hip_Angle_R_Knee_ext Ankle_Angle_L_Knee_Flex Ankle_Angle_L_Knee_ext Ankle_Angle_R_Knee_Flex Ankle_Angle_R_Knee_ext...
SUCCESS MESSAGE name Hip_RoM_R Hip_RoM_L Knee_RoM_R Knee_RoM_L Ankle_RoM_R Ankle_RoM_L Back_Bike_L Back_Bike_R Shoulder_Angle_L Shoulder_Angle_R...
Elbow_Angle_R  Elbow_Angle_L Power_Kg_60 Power_Kg_50 Power_Kg_40 Power_Kg_30 Power_Kg_20 Power_Kg_10 Power_Kg_5 Power_Output_W_5 Power_Output_W_10 Power_Output_W_20...
Power_Output_W_30 Power_Output_W_40 Power_Output_W_50 Power_Output_W_60 Hip_Angle_L_Y Hip_Angle_R_Y Knee_Angle_L_Y Knee_Angle_R_Y Ankle_Angle_L_Y Ankle_Angle_R_Y...
Shoulder_Angle_L_Y Shoulder_Angle_R_Y Elbow_Angle_L_Y Elbow_Angle_R_Y d Shoulder_Angle_L_Max_val Shoulder_Angle_L_Min_val Shoulder_Angle_R_Min_val Shoulder_Angle_R_Max_val...
Elbow_Angle_L_Max_val Elbow_Angle_L_Min_val Elbow_Angle_R_Max_val Elbow_Angle_R_Min_val Back_Angle_L_Max_val Back_Angle_L_Min_val Back_Angle_R_Max_val Back_Angle_R_Min_val...
Horizontal_crank_Angle_L  Horizontal_crank_Angle_R Overall_KOPS_Angle_L  Overall_KOPS_Angle_R...
Tangenital_Front_hip_L Tangenital_Back_hip_L Tangenital_Front_hip_R Tangenital_Back_hip_R...
Tangenital_Front_knee_L Tangenital_Back_knee_L Tangenital_Front_knee_R Tangenital_Back_knee_R Tangenital_Front_ankle_L Tangenital_Back_ankle_L Tangenital_Front_ankle_R Tangenital_Back_ankle_R...
Hip_Angle_Acceleration_L_Max_val Hip_Angle_Acceleration_L_Min_val Hip_Angle_Acceleration_R_Max_val Hip_Angle_Acceleration_R_Min_val Knee_Angle_Acceleration_L_Max_val Knee_Angle_Acceleration_L_Min_val...
Knee_Angle_Acceleration_R_Max_val Knee_Angle_Acceleration_R_Min_val Ankle_Angle_Acceleration_L_Max_val Ankle_Angle_Acceleration_L_Min_val Ankle_Angle_Acceleration_R_Max_val ...
Ankle_Angle_Acceleration_R_Min_val Hip_Angle_velocity_L_Max_val Hip_Angle_velocity_L_Min_val Hip_Angle_velocity_R_Max_val Hip_Angle_velocity_R_Min_val Knee_Angle_velocity_L_Max_val ...
Knee_Angle_velocity_L_Min_val Knee_Angle_velocity_R_Max_val Knee_Angle_velocity_R_Min_val Ankle_Angle_velocity_L_Max_val Ankle_Angle_velocity_L_Min_val Ankle_Angle_velocity_R_Max_val Ankle_Angle_velocity_R_Min_val...
Hip_Angle_velocity_L Hip_Angle_velocity_R Knee_Angle_velocity_L Knee_Angle_velocity_R Ankle_Angle_velocity_L Ankle_Angle_velocity_R Hip_Angle_Acceleration_L Hip_Angle_Acceleration_R...
Knee_Angle_Acceleration_L Knee_Angle_Acceleration_R Ankle_Angle_Acceleration_L Ankle_Angle_Acceleration_R Back_L_RoM Back_R_RoM Shoulder_L_RoM Shoulder_R_RoM Elbow_L_RoM Elbow_R_RoM...
Tangenital_Front_hip_L_norm Tangenital_Back_hip_L_norm Tangenital_Front_hip_R_norm Tangenital_Back_hip_R_norm Tangenital_Front_knee_L_norm Tangenital_Back_knee_L_norm...
Tangenital_Front_knee_R_norm Tangenital_Back_knee_R_norm Tangenital_Front_ankle_L_norm Tangenital_Back_ankle_L_norm Tangenital_Front_ankle_R_norm Tangenital_Back_ankle_R_norm...
Hip_Angle_velocity_L_norm Hip_Angle_velocity_R_norm Knee_Angle_velocity_L_norm Knee_Angle_velocity_R_norm Ankle_Angle_velocity_L_norm Ankle_Angle_velocity_R_norm...
Hip_Angle_Acceleration_L_norm Hip_Angle_Acceleration_R_norm Knee_Angle_Acceleration_L_norm Knee_Angle_Acceleration_R_norm Ankle_Angle_Acceleration_L_norm Ankle_Angle_Acceleration_R_norm...
Shoulder_Angle_L_norm Shoulder_Angle_R_norm Elbow_Angle_L_norm Elbow_Angle_R_norm Hip_Angle_L_norm Hip_Angle_R_norm Knee_Angle_L_norm Knee_Angle_R_norm Ankle_Angle_L_norm Ankle_Angle_R_norm Back_Bike_L_norm Back_Bike_R_norm...
Shoulder_Angle_L_Y_norm Shoulder_Angle_R_Y_norm Elbow_Angle_L_Y_norm Elbow_Angle_R_Y_norm Hip_Angle_L_Y_norm Hip_Angle_R_Y_norm Knee_Angle_L_Y_norm Knee_Angle_R_Y_norm Ankle_Angle_L_Y_norm Ankle_Angle_R_Y_norm...
Coordinate_GT_L_Norm Coordinate_GT_R_Norm Coordinate_KNEE_LAT_L_Norm Coordinate_KNEE_LAT_R_Norm Coordinate_MAL_LAT_L_Norm Coordinate_MAL_LAT_R_Norm Coordinate_MTP5_L_Norm Coordinate_MTP5_R_Norm...
Hip_Velocity_L_Range Hip_Velocity_R_Range Knee_Velocity_L_Range Knee_Velocity_R_Range Ankle_Velocity_L_Range Ankle_Velocity_R_Range...
Hip_Acceleration_L_Range Hip_Acceleration_R_Range Knee_Acceleration_L_Range Knee_Acceleration_R_Range Ankle_Acceleration_L_Range Ankle_Acceleration_R_Range...
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
Tangenital_Acceleration_Back_ankle_positive_up_R Tangenital_Acceleration_Back_ankle_positive_down_R Tangenital_Acceleration_Front_ankle_negative_up_R Tangenital_Acceleration_Front_ankle_negative_down_R

% Set export folder %
folder_name = uigetdir;
[ext, name]=fileparts(file1);
OutputFile = [folder_name,'\Cycling_',name,'.xlsx'];


Height=get(handles.Height, 'String');
Weight=get(handles.Weight, 'String');

Weight=str2double(Weight);
Height=str2double(Height);

% look at 10 seconds worth of data into 101 data points %
% Coordinates %
Coordinate_GT_L_Norm=interpft(d.markerName.GT_L(10000:15000,1:3),101);
Coordinate_GT_R_Norm=interpft(d.markerName.GT_R(10000:15000,1:3),101);
Coordinate_KNEE_LAT_L_Norm=interpft(d.markerName.KNEE_LAT_L(10000:15000,1:3),101);
Coordinate_KNEE_LAT_R_Norm=interpft(d.markerName.KNEE_LAT_R(10000:15000,1:3),101);
Coordinate_MAL_LAT_L_Norm=interpft(d.markerName.MAL_LAT_L(10000:15000,1:3),101);
Coordinate_MAL_LAT_R_Norm=interpft(d.markerName.MAL_LAT_R(10000:15000,1:3),101);
Coordinate_MTP5_L_Norm=interpft(d.markerName.MTP5_L(10000:15000,1:3),101);
Coordinate_MTP5_R_Norm=interpft(d.markerName.MTP5_R(10000:15000,1:3),101);

% Angles X % 
Shoulder_Angle_L_norm=interpft(Shoulder_Angle_L(10000:15000,1),101);
Shoulder_Angle_R_norm=interpft(Shoulder_Angle_R(10000:15000,1),101);
Elbow_Angle_L_norm=interpft(Elbow_Angle_L(10000:15000,1),101);
Elbow_Angle_R_norm=interpft(Elbow_Angle_R(10000:15000,1),101);
Hip_Angle_L_norm = interpft(Hip_Angle_L(10000:15000,1),101);
Hip_Angle_R_norm = interpft(Hip_Angle_R(10000:15000,1),101);
Knee_Angle_L_norm =interpft(Knee_Angle_L(10000:15000,1),101);
Knee_Angle_R_norm =interpft(Knee_Angle_R(10000:15000,1),101);
Ankle_Angle_L_norm =interpft(Ankle_Angle_L(10000:15000,1),101);
Ankle_Angle_R_norm=interpft(Ankle_Angle_R(10000:15000,1),101);
Back_Bike_L_norm=interpft(Back_Bike_L(10000:15000,1),101);
Back_Bike_R_norm=interpft(Back_Bike_R(10000:15000,1),101);

% Angles Y %
Shoulder_Angle_L_Y_norm=interpft(Shoulder_Angle_L_Y(10000:15000,1),101);
Shoulder_Angle_R_Y_norm=interpft(Shoulder_Angle_R_Y(10000:15000,1),101);
Elbow_Angle_L_Y_norm=interpft(Elbow_Angle_L_Y(10000:15000,1),101);
Elbow_Angle_R_Y_norm=interpft(Elbow_Angle_R_Y(10000:15000,1),101); 
Hip_Angle_L_Y_norm=interpft(Hip_Angle_L_Y(10000:15000,1),101);
Hip_Angle_R_Y_norm=interpft(Hip_Angle_R_Y(10000:15000,1),101);
Knee_Angle_L_Y_norm=interpft(Knee_Angle_L_Y(10000:15000,1),101);
Knee_Angle_R_Y_norm =interpft(Knee_Angle_R_Y(10000:15000,1),101);
Ankle_Angle_L_Y_norm=interpft(Ankle_Angle_L_Y(10000:15000,1),101);
Ankle_Angle_R_Y_norm=interpft(Ankle_Angle_R_Y(10000:15000,1),101);
  
   
%Tangential angles X%
Tangenital_Front_hip_L_norm=interpft(Tangenital_Front_hip_L(5000:10000,1),101);
Tangenital_Back_hip_L_norm=interpft(Tangenital_Back_hip_L(5000:10000,1),101);
Tangenital_Front_hip_R_norm=interpft(Tangenital_Front_hip_R(5000:10000,1),101);
Tangenital_Back_hip_R_norm=interpft(Tangenital_Back_hip_R(5000:10000,1),101);
Tangenital_Front_knee_L_norm=interpft(Tangenital_Front_knee_L(5000:10000,1),101);
Tangenital_Back_knee_L_norm=interpft(Tangenital_Back_knee_L(5000:10000,1),101);
Tangenital_Front_knee_R_norm=interpft(Tangenital_Front_knee_R(5000:10000,1),101);
Tangenital_Back_knee_R_norm=interpft(Tangenital_Back_knee_R(5000:10000,1),101);
Tangenital_Front_ankle_L_norm=interpft(Tangenital_Front_ankle_L(5000:10000,1),101);
Tangenital_Back_ankle_L_norm=interpft(Tangenital_Back_ankle_L(5000:10000,1),101);
Tangenital_Front_ankle_R_norm=interpft(Tangenital_Front_ankle_R(5000:10000,1),101);
Tangenital_Back_ankle_R_norm=interpft(Tangenital_Back_ankle_R(5000:10000,1),101);
  
% Angular Velocity X % 
Hip_Angle_velocity_L_norm=interpft(Hip_Angle_velocity_L(5000:10000,1),101); 
Hip_Angle_velocity_R_norm=interpft(Hip_Angle_velocity_R(5000:10000,1),101); 
Knee_Angle_velocity_L_norm=interpft(Knee_Angle_velocity_L(5000:10000,1),101);
Knee_Angle_velocity_R_norm=interpft(Knee_Angle_velocity_R(5000:10000,1),101); 
Ankle_Angle_velocity_L_norm=interpft(Ankle_Angle_velocity_L(5000:10000,1),101);  
Ankle_Angle_velocity_R_norm=interpft(Ankle_Angle_velocity_R(5000:10000,1),101); 

% Angular Acceleration X %
Hip_Angle_Acceleration_L_norm=interpft(Hip_Angle_Acceleration_L(5000:10000,1),101); 
Hip_Angle_Acceleration_R_norm=interpft(Hip_Angle_Acceleration_R(5000:10000,1),101); 
Knee_Angle_Acceleration_L_norm=interpft(Knee_Angle_Acceleration_L(5000:10000,1),101);
Knee_Angle_Acceleration_R_norm=interpft(Knee_Angle_Acceleration_R(5000:10000,1),101); 
Ankle_Angle_Acceleration_L_norm=interpft(Ankle_Angle_Acceleration_L(5000:10000,1),101); 
Ankle_Angle_Acceleration_R_norm=interpft(Ankle_Angle_Acceleration_R(5000:10000,1),101); 


% work out back, shoulder and elbow max and min and ROM

Back_Angle_L_Max_val=mean(Back_Angle_L_Max_val);
Back_Angle_L_Min_val=mean(Back_Angle_L_Min_val);
Back_Angle_R_Max_val=mean(Back_Angle_R_Max_val);
Back_Angle_R_Min_val=mean(Back_Angle_R_Min_val);
Shoulder_Angle_L_Max_val=mean(Shoulder_Angle_L_Max_val);
Shoulder_Angle_L_Min_val=mean(Shoulder_Angle_L_Min_val);
Shoulder_Angle_R_Max_val=mean(Shoulder_Angle_R_Max_val);
Shoulder_Angle_R_Min_val=mean(Shoulder_Angle_R_Min_val);
Elbow_Angle_L_Max_val=mean(Elbow_Angle_L_Max_val);
Elbow_Angle_L_Min_val=mean(Elbow_Angle_L_Min_val);
Elbow_Angle_R_Max_val=mean(Elbow_Angle_R_Max_val);
Elbow_Angle_R_Min_val=mean(Elbow_Angle_R_Min_val);

Back_L_RoM=Back_Angle_L_Max_val-Back_Angle_L_Min_val;
Back_R_RoM=Back_Angle_R_Max_val-Back_Angle_R_Min_val;
Shoulder_L_RoM=Shoulder_Angle_L_Max_val-Shoulder_Angle_L_Min_val;
Shoulder_R_RoM=Shoulder_Angle_R_Max_val-Shoulder_Angle_R_Min_val;
Elbow_L_RoM=Elbow_Angle_L_Max_val-Elbow_Angle_L_Min_val;
Elbow_R_RoM=Elbow_Angle_R_Max_val-Elbow_Angle_R_Min_val;


% work out Hip, Knee and Ankle velocity max and min and ROM %

Hip_Angle_velocity_L_Max_val=mean(Hip_Angle_velocity_L_Max_val);
Hip_Angle_velocity_L_Min_val=mean(Hip_Angle_velocity_L_Min_val);
Hip_Angle_velocity_R_Max_val=mean(Hip_Angle_velocity_R_Max_val);
Hip_Angle_velocity_R_Min_val=mean(Hip_Angle_velocity_R_Min_val);
Knee_Angle_velocity_L_Max_val=mean(Knee_Angle_velocity_L_Max_val);
Knee_Angle_velocity_L_Min_val=mean(Knee_Angle_velocity_L_Min_val);
Knee_Angle_velocity_R_Max_val=mean(Knee_Angle_velocity_R_Max_val);
Knee_Angle_velocity_R_Min_val=mean(Knee_Angle_velocity_R_Min_val);
Ankle_Angle_velocity_L_Max_val=mean(Ankle_Angle_velocity_L_Max_val); 
Ankle_Angle_velocity_L_Min_val=mean(Ankle_Angle_velocity_L_Min_val);
Ankle_Angle_velocity_R_Max_val=mean(Ankle_Angle_velocity_R_Max_val);
Ankle_Angle_velocity_R_Min_val=mean(Ankle_Angle_velocity_R_Min_val);

Hip_Velocity_L_Range=Hip_Angle_velocity_L_Max_val-Hip_Angle_velocity_L_Min_val;
Hip_Velocity_R_Range=Hip_Angle_velocity_R_Max_val-Hip_Angle_velocity_R_Min_val;
Knee_Velocity_L_Range=Knee_Angle_velocity_L_Max_val-Knee_Angle_velocity_L_Min_val;
Knee_Velocity_R_Range=Knee_Angle_velocity_R_Max_val-Knee_Angle_velocity_R_Min_val;
Ankle_Velocity_L_Range=Ankle_Angle_velocity_L_Max_val-Ankle_Angle_velocity_L_Min_val;
Ankle_Velocity_R_Range=Ankle_Angle_velocity_R_Max_val-Ankle_Angle_velocity_R_Min_val;

Hip_Tangential_Velocity_L_Max_val=mean(Hip_Tangential_Velocity_L_Max_val); 
Hip_Tangential_Velocity_L_Min_val=mean(Hip_Tangential_Velocity_L_Min_val); 
Hip_Tangential_Velocity_R_Max_val=mean(Hip_Tangential_Velocity_R_Max_val); 
Hip_Tangential_Velocity_R_Min_val=mean(Hip_Tangential_Velocity_R_Min_val);
Knee_Tangential_Velocity_L_Max_val=mean(Knee_Tangential_Velocity_L_Max_val); 
Knee_Tangential_Velocity_L_Min_val=mean(Knee_Tangential_Velocity_L_Min_val);
Knee_Tangential_Velocity_R_Max_val=mean(Knee_Tangential_Velocity_R_Max_val);
Knee_Tangential_Velocity_R_Min_val=mean(Knee_Tangential_Velocity_R_Min_val);
Ankle_Tangential_Velocity_L_Max_val=mean(Ankle_Tangential_Velocity_L_Max_val);
Ankle_Tangential_Velocity_L_Min_val=mean(Ankle_Tangential_Velocity_L_Min_val);
Ankle_Tangential_Velocity_R_Max_val=mean(Ankle_Tangential_Velocity_R_Max_val);
Ankle_Tangential_Velocity_R_Min_val=mean(Ankle_Tangential_Velocity_R_Min_val);

% work out Hip, Knee and Ankle Acceleration max and min and ROM
Hip_Angle_Acceleration_L_Max_val=mean(Hip_Angle_Acceleration_L_Max_val);
Hip_Angle_Acceleration_L_Min_val=mean(Hip_Angle_Acceleration_L_Min_val);
Hip_Angle_Acceleration_R_Max_val=mean(Hip_Angle_Acceleration_R_Max_val); 
Hip_Angle_Acceleration_R_Min_val=mean(Hip_Angle_Acceleration_R_Min_val);
Knee_Angle_Acceleration_L_Max_val=mean(Knee_Angle_Acceleration_L_Max_val);
Knee_Angle_Acceleration_L_Min_val=mean(Knee_Angle_Acceleration_L_Min_val);
Knee_Angle_Acceleration_R_Max_val=mean(Knee_Angle_Acceleration_R_Max_val);
Knee_Angle_Acceleration_R_Min_val=mean(Knee_Angle_Acceleration_R_Min_val);
Ankle_Angle_Acceleration_L_Max_val=mean(Ankle_Angle_Acceleration_L_Max_val); 
Ankle_Angle_Acceleration_L_Min_val=mean(Ankle_Angle_Acceleration_L_Min_val);
Ankle_Angle_Acceleration_R_Max_val=mean(Ankle_Angle_Acceleration_R_Max_val);
Ankle_Angle_Acceleration_R_Min_val=mean(Ankle_Angle_Acceleration_R_Min_val);

Hip_Acceleration_L_Range=Hip_Angle_Acceleration_L_Max_val-Hip_Angle_Acceleration_L_Min_val;
Hip_Acceleration_R_Range=Hip_Angle_Acceleration_R_Max_val-Hip_Angle_Acceleration_R_Min_val;
Knee_Acceleration_L_Range=Knee_Angle_Acceleration_L_Max_val-Knee_Angle_Acceleration_L_Min_val;
Knee_Acceleration_R_Range=Knee_Angle_Acceleration_R_Max_val-Knee_Angle_Acceleration_R_Min_val;
Ankle_Acceleration_L_Range=Ankle_Angle_Acceleration_L_Max_val-Ankle_Angle_Acceleration_L_Min_val;
Ankle_Acceleration_R_Range=Ankle_Angle_Acceleration_R_Max_val-Ankle_Angle_Acceleration_R_Min_val;

Hip_Tangential_Acceleration_L_Max_val=mean(Hip_Tangential_Acceleration_L_Max_val); 
Hip_Tangential_Acceleration_L_Min_val=mean(Hip_Tangential_Acceleration_L_Min_val);
Hip_Tangential_Acceleration_R_Max_val=mean(Hip_Tangential_Acceleration_R_Max_val); 
Hip_Tangential_Acceleration_R_Min_val=mean(Hip_Tangential_Acceleration_R_Min_val);
Knee_Tangential_Acceleration_L_Max_val=mean(Knee_Tangential_Acceleration_L_Max_val);
Knee_Tangential_Acceleration_L_Min_val=mean(Knee_Tangential_Acceleration_L_Min_val); 
Knee_Tangential_Acceleration_R_Max_val=mean(Knee_Tangential_Acceleration_R_Max_val); 
Knee_Tangential_Acceleration_R_Min_val=mean(Knee_Tangential_Acceleration_R_Min_val);
Ankle_Tangential_Acceleration_L_Max_val=mean(Ankle_Tangential_Acceleration_L_Max_val); 
Ankle_Tangential_Acceleration_L_Min_val=mean(Ankle_Tangential_Acceleration_L_Min_val); 
Ankle_Tangential_Acceleration_R_Max_val=mean(Ankle_Tangential_Acceleration_R_Max_val); 
Ankle_Tangential_Acceleration_R_Min_val=mean(Ankle_Tangential_Acceleration_R_Min_val);

Tangenital_Vel_Front_hip_negative_up_L=Tangenital_Vel_Front_hip_negative_up_L*-1;
Tangenital_Vel_Front_hip_negative_down_L=Tangenital_Vel_Front_hip_negative_down_L*-1;
Tangenital_Vel_Front_hip_negative_up_R=Tangenital_Vel_Front_hip_negative_up_R*-1;
Tangenital_Vel_Front_hip_negative_down_R=Tangenital_Vel_Front_hip_negative_down_R*-1;
Tangenital_Vel_Front_knee_negative_up_L=Tangenital_Vel_Front_knee_negative_up_L*-1; 
Tangenital_Vel_Front_knee_negative_down_L=Tangenital_Vel_Front_knee_negative_down_L*-1;
Tangenital_Vel_Front_knee_negative_up_R=Tangenital_Vel_Front_knee_negative_up_R*-1; 
Tangenital_Vel_Front_knee_negative_down_R=Tangenital_Vel_Front_knee_negative_down_R*-1;
Tangenital_Vel_Front_ankle_negative_up_L=Tangenital_Vel_Front_ankle_negative_up_L*-1; 
Tangenital_Vel_Front_ankle_negative_down_L=Tangenital_Vel_Front_ankle_negative_down_L*-1;
Tangenital_Vel_Front_ankle_negative_up_R=Tangenital_Vel_Front_ankle_negative_up_R*-1; 
Tangenital_Vel_Front_ankle_negative_down_R=Tangenital_Vel_Front_ankle_negative_down_R*-1;

% copies template file to that of trial name %
copyfile('C:\Users\sm21438\Documents\Cardiff Met\Biomechanics\Sport Science Support\Cycling_Outputs\Cycling_NEW.xlsx',...
strcat('C:\Users\sm21438\Documents\Cardiff Met\Biomechanics\Sport Science Support\Cycling_Outputs\Cycling_',name,'.xlsx')); 

TEXT1={'File' file1 'Height' Height 'Weight' Weight};
TEXT2={Cadence Wheel_Diameter Wheel_Circumference Revolutions_10_secs Revolutions_1_minute Meters_per_hour MPH Power_Output_W Power_Kg }; 
TEXT3=([Hip_Angle_L_norm, Hip_Angle_R_norm, Knee_Angle_L_norm, Knee_Angle_R_norm, Ankle_Angle_L_norm, Ankle_Angle_R_norm, Back_Bike_L_norm, Back_Bike_R_norm, Shoulder_Angle_L_norm, Shoulder_Angle_R_norm, Elbow_Angle_L_norm, Elbow_Angle_R_norm]);
TEXT4={Hip_Angle_L_Min_val; Hip_Angle_R_Min_val;'';Knee_Angle_L_Min_val;Knee_Angle_R_Min_val;'';Ankle_Angle_L_Min_val; Ankle_Angle_R_Min_val};
TEXT5={Hip_Angle_L_Max_val;Hip_Angle_R_Max_val;'';Knee_Angle_L_Max_val;Knee_Angle_R_Max_val;'';Ankle_Angle_L_Max_val; Ankle_Angle_R_Max_val};
TEXT6={Hip_Angle_L_Knee_Flex; Hip_Angle_R_Knee_Flex;''; Ankle_Angle_L_Knee_Flex; Ankle_Angle_R_Knee_Flex};
TEXT7={Hip_Angle_L_Knee_ext; Hip_Angle_R_Knee_ext;''; Ankle_Angle_L_Knee_ext; Ankle_Angle_R_Knee_ext};
TEXT10={Hip_RoM_L; Hip_RoM_R; '';  ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; Knee_RoM_L; Knee_RoM_R;...
        '';  ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; Ankle_RoM_L; Ankle_RoM_R; '';  ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; '';''; Back_L_RoM;Back_R_RoM;...
        '';  ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; '';'';''; Shoulder_L_RoM; Shoulder_R_RoM;'';  ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; '';Elbow_L_RoM;Elbow_R_RoM};
TEXT11={Power_Output_W_5;Power_Output_W_10;Power_Output_W_20;Power_Output_W_30;Power_Output_W_40;Power_Output_W_50;Power_Output_W_60;Power_Output_W};
TEXT12={Power_Kg_5; Power_Kg_10; Power_Kg_20; Power_Kg_30; Power_Kg_40;Power_Kg_50;Power_Kg_60;Power_Kg};
TEXT13=([Hip_Angle_L_Y_norm, Hip_Angle_R_Y_norm, Knee_Angle_L_Y_norm, Knee_Angle_R_Y_norm, Ankle_Angle_L_Y_norm, Ankle_Angle_R_Y_norm, Shoulder_Angle_L_Y_norm, Shoulder_Angle_R_Y_norm, Elbow_Angle_L_Y_norm, Elbow_Angle_R_Y_norm]);
TEXT14=([Coordinate_GT_L_Norm, Coordinate_KNEE_LAT_L_Norm, Coordinate_MAL_LAT_L_Norm, Coordinate_MTP5_L_Norm]);
TEXT15=([Coordinate_GT_R_Norm, Coordinate_KNEE_LAT_R_Norm, Coordinate_MAL_LAT_R_Norm, Coordinate_MTP5_R_Norm]);
TEXT16={Back_Angle_L_Min_val;Back_Angle_R_Min_val;''; Shoulder_Angle_L_Min_val;Shoulder_Angle_R_Min_val;''; Elbow_Angle_L_Min_val;Elbow_Angle_R_Min_val};   
TEXT17={Back_Angle_L_Max_val;Back_Angle_R_Max_val;''; Shoulder_Angle_L_Max_val;Shoulder_Angle_R_Max_val;''; Elbow_Angle_L_Max_val;Elbow_Angle_R_Max_val}; 
TEXT18={Horizontal_crank_Angle_L; Horizontal_crank_Angle_R};
TEXT19={Overall_KOPS_Angle_L; Overall_KOPS_Angle_R};
TEXT20=([Tangenital_Front_hip_L_norm Tangenital_Front_hip_R_norm Tangenital_Front_knee_L_norm Tangenital_Front_knee_R_norm Tangenital_Front_ankle_L_norm Tangenital_Front_ankle_R_norm]);
TEXT21=([Tangenital_Back_hip_L_norm Tangenital_Back_hip_R_norm Tangenital_Back_knee_L_norm Tangenital_Back_knee_R_norm Tangenital_Back_ankle_L_norm Tangenital_Back_ankle_R_norm]);
TEXT22=([Hip_Angle_velocity_L_norm Hip_Angle_velocity_R_norm Knee_Angle_velocity_L_norm Knee_Angle_velocity_R_norm Ankle_Angle_velocity_L_norm Ankle_Angle_velocity_R_norm]);
TEXT23=([Hip_Angle_Acceleration_L_norm Hip_Angle_Acceleration_R_norm Knee_Angle_Acceleration_L_norm Knee_Angle_Acceleration_R_norm Ankle_Angle_Acceleration_L_norm Ankle_Angle_Acceleration_R_norm]);
TEXT24={Hip_Velocity_L_Range; Hip_Velocity_R_Range; '';  ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; Knee_Velocity_L_Range; Knee_Velocity_R_Range;...
        '';  ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; Ankle_Velocity_L_Range; Ankle_Velocity_R_Range};
TEXT25={Hip_Acceleration_L_Range; Hip_Acceleration_R_Range; '';  ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; Knee_Acceleration_L_Range; Knee_Acceleration_R_Range;...
        '';  ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; Ankle_Acceleration_L_Range; Ankle_Acceleration_R_Range}; 
TEXT26={Hip_Angle_velocity_L_Min_val; Hip_Angle_velocity_R_Min_val;''; Knee_Angle_velocity_L_Min_val; Knee_Angle_velocity_R_Min_val;''; Ankle_Angle_velocity_L_Min_val; Ankle_Angle_velocity_R_Min_val};
TEXT27={Hip_Angle_velocity_L_Max_val; Hip_Angle_velocity_R_Max_val;''; Knee_Angle_velocity_L_Max_val; Knee_Angle_velocity_R_Max_val;''; Ankle_Angle_velocity_L_Max_val; Ankle_Angle_velocity_R_Max_val};
TEXT28={Hip_Angle_Acceleration_L_Min_val; Hip_Angle_Acceleration_R_Min_val;''; Knee_Angle_Acceleration_L_Min_val; Knee_Angle_Acceleration_R_Min_val;''; Ankle_Angle_Acceleration_L_Min_val; Ankle_Angle_Acceleration_R_Min_val};
TEXT29={Hip_Angle_Acceleration_L_Max_val; Hip_Angle_Acceleration_R_Max_val;''; Knee_Angle_Acceleration_L_Max_val; Knee_Angle_Acceleration_R_Max_val;''; Ankle_Angle_Acceleration_L_Max_val; Ankle_Angle_Acceleration_R_Max_val};
   

TEXT30={Tangenital_Vel_Front_hip_negative_up_L, Tangenital_Vel_Front_hip_negative_down_L, Tangenital_Vel_Back_hip_positive_up_L, Tangenital_Vel_Back_hip_positive_down_L;...
        Tangenital_Vel_Front_hip_negative_up_R, Tangenital_Vel_Front_hip_negative_down_R,Tangenital_Vel_Back_hip_positive_up_R, Tangenital_Vel_Back_hip_positive_down_R;...
        Tangenital_Vel_Front_knee_negative_up_L, Tangenital_Vel_Front_knee_negative_down_L, Tangenital_Vel_Back_knee_positive_up_L, Tangenital_Vel_Back_knee_positive_down_L;...
        Tangenital_Vel_Front_knee_negative_up_R, Tangenital_Vel_Front_knee_negative_down_R,Tangenital_Vel_Back_knee_positive_up_R, Tangenital_Vel_Back_knee_positive_down_R;...
        Tangenital_Vel_Front_ankle_negative_up_L, Tangenital_Vel_Front_ankle_negative_down_L, Tangenital_Vel_Back_ankle_positive_up_L, Tangenital_Vel_Back_ankle_positive_down_L;...
        Tangenital_Vel_Front_ankle_negative_up_R, Tangenital_Vel_Front_ankle_negative_down_R,Tangenital_Vel_Back_ankle_positive_up_R, Tangenital_Vel_Back_ankle_positive_down_R};

TEXT31={Tangenital_Acceleration_Front_hip_negative_up_L, Tangenital_Acceleration_Front_hip_negative_down_L, Tangenital_Acceleration_Back_hip_positive_up_L, Tangenital_Acceleration_Back_hip_positive_down_L;...
        Tangenital_Acceleration_Front_hip_negative_up_R, Tangenital_Acceleration_Front_hip_negative_down_R, Tangenital_Acceleration_Back_hip_positive_up_R, Tangenital_Acceleration_Back_hip_positive_down_R;... 
        Tangenital_Acceleration_Front_knee_negative_up_L, Tangenital_Acceleration_Front_knee_negative_down_L, Tangenital_Acceleration_Back_knee_positive_up_L, Tangenital_Acceleration_Back_knee_positive_down_L;...
        Tangenital_Acceleration_Front_knee_negative_up_R, Tangenital_Acceleration_Front_knee_negative_down_R, Tangenital_Acceleration_Back_knee_positive_up_R Tangenital_Acceleration_Back_knee_positive_down_R;... 
        Tangenital_Acceleration_Front_ankle_negative_up_L, Tangenital_Acceleration_Front_ankle_negative_down_L, Tangenital_Acceleration_Back_ankle_positive_up_L, Tangenital_Acceleration_Back_ankle_positive_down_L;...
        Tangenital_Acceleration_Front_ankle_negative_up_R, Tangenital_Acceleration_Front_ankle_negative_down_R, Tangenital_Acceleration_Back_ankle_positive_up_R, Tangenital_Acceleration_Back_ankle_positive_down_R};



[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT1,'Angle (x)','A1'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT2,'Angle (x)','A3'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT3,'Angle (x)','B7');         
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT4,'Angle (x)','Q5');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT5,'Angle (x)','R5');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT16,'Angle (x)','V5');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT17,'Angle (x)','W5');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT6,'Angle (x)','Z5');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT7,'Angle (x)','AA5');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT10,'Angle (x)','X18');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT11,'Power Output','B2');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT12,'Power Output','C2');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT13,'Angle (y) ','B7');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT14,'Angle (x)','B113');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT15,'Angle (x)','B219');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT18,'Angle (x)','AD12');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT19,'Angle (x)','Z12');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT20,'Tangenital (x)','B4');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT21,'Tangenital (x)','J4');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT22,'Angle_Vel (x)','B7');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT23,'Angle_Acc (x)','B7');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT24,'Angle_Vel (x)','R18');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT25,'Angle_Acc (x)','R18');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT26,'Angle_Vel (x)','K5');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT27,'Angle_Vel (x)','L5');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT28,'Angle_Acc (x)','K5');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT29,'Angle_Acc (x)','L5');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT30,'Angle_Vel (x)','R8');
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT31,'Angle_Acc (x)','R8');
     msgbox('Export Successful');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Close Cycling Assessment GUI

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Cycling
clear 
clc
close all
Sport_Biomech_Title

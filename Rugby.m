 
addpath('D:\WRU\WRU_int\03_01_2018\LP_006\Analysis')

    FileList=dir('D:\WRU\WRU_int\03_01_2018\LP_006\Analysis\LP*.c3d');
    NumFiles=size(FileList);
    NumFiles=NumFiles(1,1);
    
 for L=0:(NumFiles-1)
     filename = FileList(L+1).name; 
    [path,file,EXT] = fileparts(filename);
    
     fn=([FileList(L+1).folder,'\',FileList(L+1).name]);

  
  
% [file,path] = uigetfile({'*.tsv;*.c3d;*.mat;*.wii', '.tsv, .c3d, .mat and .wii files'}, 'Pick a .tsv, .c3d, .mat, or .wii file');
%  fn = [path file];   
%  if ~ischar(fn) %Check if input is given as string - BB 20120413 (does not work if file ending is given)
%  disp([10, 'Static*',10]);
%  return
%  end

H=btkReadAcquisition(fn);
 %marker names and values%
d.markerName=btkGetMarkers(H);
d.Angles=btkGetAngles(H);


d.Events=btkGetEvents(H);
%%% Pause to look at events  %%% need to be able to change Events below %%

d.Firstframe=btkGetFirstFrame(H);
d.Lastframe=btkGetLastFrame(H);
d.Metadata=btkGetMetaData(H);


subject=d.Metadata.children.SUBJECTS.children.NAMES.info.values{1,1};  

format short

%%
%%%%%% Find pass time in seconds %%%%%

isfield(d.Events,'Left_Foot_Off')
if ans==1
d.Events.Initial(:,1)=d.Events.General_Release-d.Events.Left_Foot_Off(:,1);
end

isfield(d.Events,'Right_Foot_Off')
if ans==1
d.Events.Initial(:,2)=d.Events.General_Release-d.Events.Right_Foot_Off(:,1);
end

isfield(d.Events,'Left_Foot_Strike')
if ans==1
d.Events.Initial(:,3)= d.Events.General_Release-d.Events.Left_Foot_Strike(:,1);
end

isfield(d.Events,'Right_Foot_Strike')
if ans==1
d.Events.Initial(:,4)=d.Events.General_Release-d.Events.Right_Foot_Strike(:,1);
end

d.Events.Initial( :, ~any(d.Events.Initial,1) ) = [];  %columns


d.Events.Initial=unique(d.Events.Initial);
d.processed.Results.Pass_Time=max(d.Events.Initial);


%%%% NORMALISE EVENTS TO FRAME NUMBERS - 0-101 %%%%

%%%%%%%%%%%%%%%%%%%
isfield(d.Events,'Left_Foot_Off')
if ans==1
[row, column]=size(d.Events.Left_Foot_Off);
if column>1
    elseif column==1
d.processed.Events.Left_Foot_Off= sprintf('%d',round(d.Events.Left_Foot_Off .*250));
d.processed.Events.Left_Foot_Off=cellstr(d.processed.Events.Left_Foot_Off);
end


if column<1
    elseif column>1
d.processed.Events.Left_Foot_Off_A{1}= d.Events.Left_Foot_Off(1).*250;
d.processed.Events.Left_Foot_Off_B{1}= d.Events.Left_Foot_Off(2).*250;
d.processed.Events.Left_Foot_Off_A=sprintf('%d',round(d.processed.Events.Left_Foot_Off_A{1}));
d.processed.Events.Left_Foot_Off_B=sprintf('%d',round(d.processed.Events.Left_Foot_Off_B{1}));

d.processed.Events.Left_Foot_Off_A=cellstr(d.processed.Events.Left_Foot_Off_A);
d.processed.Events.Left_Foot_Off_B=cellstr(d.processed.Events.Left_Foot_Off_B);    
d.processed.Events.Left_Foot_Off=[d.processed.Events.Left_Foot_Off_A ,d.processed.Events.Left_Foot_Off_B];
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
isfield(d.Events,'Left_Foot_Strike')
if ans==1
[row1, column1]=size(d.Events.Left_Foot_Strike);
if column1>1
elseif column1==1
     d.processed.Events.Left_Foot_Strike= sprintf('%d',round(d.Events.Left_Foot_Strike .*250));
 d.processed.Events.Left_Foot_Strike=cellstr( d.processed.Events.Left_Foot_Strike);
end
 
if column1<1
elseif column1>1
    d.processed.Events.Left_Foot_Strike_A{1}= d.Events.Left_Foot_Strike(1).*250;
d.processed.Events.Left_Foot_Strike_B{1}= d.Events.Left_Foot_Strike(2).*250;
d.processed.Events.Left_Foot_Strike_A=sprintf('%d',round(d.processed.Events.Left_Foot_Strike_A{1}));
d.processed.Events.Left_Foot_Strike_B=sprintf('%d',round(d.processed.Events.Left_Foot_Strike_B{1}));

d.processed.Events.Left_Foot_Strike_A=cellstr(d.processed.Events.Left_Foot_Strike_A);
d.processed.Events.Left_Foot_Strike_B=cellstr(d.processed.Events.Left_Foot_Strike_B);
d.processed.Events.Left_Foot_Strike=[d.processed.Events.Left_Foot_Strike_A ,d.processed.Events.Left_Foot_Strike_B];
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
isfield(d.Events,'Right_Foot_Off')
if ans==1
[row2, column2]=size(d.Events.Right_Foot_Off);
if column2>1
elseif column2==1
 d.processed.Events.Right_Foot_Off= sprintf('%d',round(d.Events.Right_Foot_Off .*250));
 d.processed.Events.Right_Foot_Off=cellstr(d.processed.Events.Right_Foot_Off);
 
end
 
if column2<1
elseif column2>1
    d.processed.Events.Right_Foot_Off_A{1}= d.Events.Right_Foot_Off(1).*250;
d.processed.Events.Right_Foot_Off_B{1}= d.Events.Right_Foot_Off(2).*250;
d.processed.Events.Right_Foot_Off_A=sprintf('%d',round(d.processed.Events.Right_Foot_Off_A{1}));
d.processed.Events.Right_Foot_Off_B=sprintf('%d',round(d.processed.Events.Right_Foot_Off_B{1}));

d.processed.Events.Right_Foot_Off_A=cellstr(d.processed.Events.Right_Foot_Off_A);
d.processed.Events.Right_Foot_Off_B=cellstr(d.processed.Events.Right_Foot_Off_B);
d.processed.Events.Right_Foot_Off=[d.processed.Events.Right_Foot_Off_A ,d.processed.Events.Right_Foot_Off_B];
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
isfield(d.Events,'Right_Foot_Strike')
if ans==1
[row3, column3]=size(d.Events.Right_Foot_Strike);
if column3>1
elseif column3==1
     d.processed.Events.Right_Foot_Strike= sprintf('%d',round(d.Events.Right_Foot_Strike.*250));
 d.processed.Events.Right_Foot_Strike=cellstr(d.processed.Events.Right_Foot_Strike);
end
  
if column3<1
elseif column3>1
    d.processed.Events.Right_Foot_Strike_A{1}= d.Events.Right_Foot_Strike(1).*250;
d.processed.Events.Right_Foot_Strike_B{1}= d.Events.Right_Foot_Strike(2).*250;
d.processed.Events.Right_Foot_Strike_A=sprintf('%d',round(d.processed.Events.Right_Foot_Strike_A{1}));
d.processed.Events.Right_Foot_Strike_B=sprintf('%d',round(d.processed.Events.Right_Foot_Strike_B{1}));

d.processed.Events.Right_Foot_Strike_A=cellstr(d.processed.Events.Right_Foot_Strike_A);
d.processed.Events.Right_Foot_Strike_B=cellstr(d.processed.Events.Right_Foot_Strike_B);
d.processed.Events.Right_Foot_Strike=[d.processed.Events.Right_Foot_Strike_A ,d.processed.Events.Right_Foot_Strike_B];  
end
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 d.processed.Events.General_Release=sprintf('%d',round( d.Events.General_Release .*250));   
 d.processed.Events.General_Release=cellstr(d.processed.Events.General_Release);


 
 isfield(d.Events,'Left_Foot_Off')
if ans==1
d.processed.Events.Initial(:,1)= str2double(d.processed.Events.Left_Foot_Off(1))-d.Firstframe;
end

isfield(d.Events,'Right_Foot_Off')
if ans==1
d.processed.Events.Initial(:,2)=str2double(d.processed.Events.Right_Foot_Off(1))-d.Firstframe;
end

isfield(d.Events,'Left_Foot_Strike')
if ans==1
d.processed.Events.Initial(:,3)= str2double(d.processed.Events.Left_Foot_Strike(1))-d.Firstframe;
end

isfield(d.Events,'Right_Foot_Strike')
if ans==1 %#ok<*NOANS>
d.processed.Events.Initial(:,4)=str2double(d.processed.Events.Right_Foot_Strike(1))-d.Firstframe;
end

d.processed.Events.Initial( :, ~any(d.processed.Events.Initial,1) ) = [];  %columns









d.processed.Events.Initial=unique(d.processed.Events.Initial);
%%%%% Processing from first conact - Ball release %%%%%%
d.processed.Events.start=min(d.processed.Events.Initial);
d.processed.Events.trial_length=d.Lastframe-d.Firstframe;
d.processed.Events.End=d.Lastframe-str2double(d.processed.Events.General_Release);
d.processed.Events.End=d.processed.Events.trial_length-d.processed.Events.End;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% FIND ANGLES AT RELEASE%%%%%
d.processed.Pelvis_Rotation=interpft(d.Angles.RPelvisAngles(d.processed.Events.start:d.processed.Events.End,3),101);
d.processed.Results.Pelvis_Rotation_Release=abs(d.processed.Pelvis_Rotation(101));

if d.processed.Results.Pelvis_Rotation_Release>180

    d.processed.Results.Pelvis_Rotation_Release=d.processed.Results.Pelvis_Rotation_Release-180;
    
end

d.processed.Thorax_Rotation=interpft(d.Angles.RThoraxAngles(d.processed.Events.start:d.processed.Events.End,3),101);
d.processed.Results.Thorax_Rotation_Release=abs(d.processed.Thorax_Rotation(101));

if d.processed.Results.Thorax_Rotation_Release>180
 d.processed.Results.Thorax_Rotation_Release=d.processed.Results.Thorax_Rotation_Release-180;
    
end
%d.processed.Right_Ankle_Rotation=interpft(d.Angles.RAnkleAngles(d.processed.Events.start:d.processed.Events.End,3),101);
%d.processed.Results.Right_Ankle_Rotation_Release=abs(d.processed.Right_Ankle_Rotation(101));
   
%d.processed.Left_Ankle_Rotation=interpft(d.Angles.LAnkleAngles(d.processed.Events.start:d.processed.Events.End,3),101);
%d.processed.Results.Left_Ankle_Rotation_Release= abs(d.processed.Left_Ankle_Rotation(101));
  
d.processed.Ball=interpft(d.markerName.BALL_END(d.processed.Events.start:d.processed.Events.End,1),101);

% if d.processed.Ball(101,1)<0
% [A, B]= max(d.processed.Ball(50:end,:));
% %B=max(B);
% d.processed.Results.Ball_Drawback=B+50;
% end
if d.processed.Ball(101,1)>d.processed.Ball(1,1)
[A, B]= min(d.processed.Ball(50:end,:));
%B=min(B);
d.processed.Results.Ball_Drawback=B+50;
end



%%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%%%NORMALISE FOOT SEGMENTS AND CoM %%%
 if d.markerName.LASI(50,1)> d.markerName.RASI(50,1)
for i=1:size (d.markerName.LASI)
    if d.markerName.RASI(i)<0
   d.processed.Pelvis_Mid_1(i,1:3)=(d.markerName.LASI(i,1:3)+(d.markerName.RASI(i,1:3))); 
    d.processed.Pelvis_Mid(i,1:3)=0.5*(d.processed.Pelvis_Mid_1(i,1:3));
    elseif d.markerName.RASI(i)>0
   d.processed.Pelvis_Mid(i,1:3)=(d.markerName.LASI(i,1:3)-0.5*(d.markerName.RASI(i,1:3)));
    end
end
 end

  if d.markerName.LASI(50,1)< d.markerName.RASI(50,1)
for i=1:size (d.markerName.LASI)
if d.markerName.LASI(i)<0
   d.processed.Pelvis_Mid_1(i,1:3)=(d.markerName.RASI(i,1:3)+(d.markerName.LASI(i,1:3))); 
    d.processed.Pelvis_Mid(i,1:3)=0.5*(d.processed.Pelvis_Mid_1(i,1:3));
    elseif d.markerName.LASI(i)>0
   d.processed.Pelvis_Mid(i,1:3)=(d.markerName.RASI(i,1:3)-0.5*(d.markerName.LASI(i,1:3)));
end
end
  end
 
 
%%%% Need LToe Rtoe Mid Pelvis

d.processed.CentreOfMass=interpft(d.processed.Pelvis_Mid(d.processed.Events.start:d.processed.Events.End,1:3),101);    
d.processed.RFOO=interpft(d.markerName.RTOE(d.processed.Events.start:d.processed.Events.End,1:3),101);
d.processed.LFOO=interpft(d.markerName.LTOE(d.processed.Events.start:d.processed.Events.End,1:3),101);

%%% needs to be robust for both run directions %%%%%%

%%%%%% WORK OUT SUM TOTAL % FOOT OVER COM %%%%%%%


    Foot_Alignment=[];  


if d.processed.LFOO(1,1)<d.processed.CentreOfMass(1,1)   
   
for i=1:101
if d.processed.RFOO(i,1)>d.processed.CentreOfMass(i,1)
       d.processed.Foot_Alignment(i,1)=0;
elseif d.processed.RFOO(i,1)<d.processed.CentreOfMass(i,1)
           d.processed.Foot_Alignment(i,1)=1;
end
end

for i=1:101
if d.processed.LFOO(i,1)<d.processed.CentreOfMass(i,1)
       d.processed.Foot_Alignment(i,2)=0;
elseif d.processed.LFOO(i,1)>d.processed.CentreOfMass(i,1)
           d.processed.Foot_Alignment(i,2)=1;
end
end
end

if d.processed.LFOO(1,1)>d.processed.CentreOfMass(1,1)
    
for i=1:101
if d.processed.RFOO(i,1)<d.processed.CentreOfMass(i,1)
       d.processed.Foot_Alignment(i,1)=0;
elseif d.processed.RFOO(i,1)>d.processed.CentreOfMass(i,1)
           d.processed.Foot_Alignment(i,1)=1;
end
end 

for i=1:101
if d.processed.LFOO(i,1)>d.processed.CentreOfMass(i,1)
      d.processed.Foot_Alignment(i,2)=0;
elseif d.processed.LFOO(i,1)<d.processed.CentreOfMass(i,1)
           d.processed.Foot_Alignment(i,2)=1;
end
end

end
  
%%% needs to be robust for both run directions %%%%%%

%%%%%% WORK OUT SUM TOTAL % FOOT SWING FROM COM %%%%%%%                         
Foot_Swing=[];


for i=1:101
    
      d.processed.R_Difference(i,1)=d.processed.RFOO(i,1)-d.processed.CentreOfMass(i,1);
      d.processed.Abs_R_Difference(i,1)=abs(d.processed.R_Difference(i,1));
   if d.processed.Abs_R_Difference(i,1) <300                                %%%% 300 = 30 cm - change accordingly %%%%%%
       d.processed.Foot_Swing(i,1)=0;
   elseif  d.processed.Abs_R_Difference(i,1) >300
           d.processed.Foot_Swing(i,1)=1;
   end
    
end

for i=1:101
 
    
        d.processed.L_Difference(i,1)=d.processed.LFOO(i,1)-d.processed.CentreOfMass(i,1);
     d.processed.Abs_L_Difference(i,1)=abs(d.processed.L_Difference(i,1));
   if d.processed.Abs_L_Difference(i,1) <300
       d.processed.Foot_Swing(i,2)=0;
   elseif  d.processed.Abs_L_Difference(i,1) >300
           d.processed.Foot_Swing(i,2)=1;
   end
     
end


%%%%%% WORK OUT SUM TOTAL % FOOT SWING %%%%%%%

 d.processed.Foot_Alignment_Total=sum(d.processed.Foot_Alignment);
d.processed.Foot_Swing_Total=sum(d.processed.Foot_Swing);
d.processed.Results.Foot_Alignment_Total=sum(d.processed.Foot_Alignment_Total);
d.processed.Results.Foot_Swing_Total=sum(d.processed.Foot_Swing_Total);



%%%% Find CoM Velocity%%%%
d.processed.Ball_Velocity=diff(d.processed.Ball);
d.processed.CoM_Velocity=diff(d.processed.CentreOfMass);
 [q,w]=size(d.processed.CoM_Velocity); 
        wn = 8;
             [b, a] = butter(4,wn/125, 'low');
       d.processed.CoM_Velocity=filtfilt(b,a,d.processed.CoM_Velocity);
d.processed.Results.CoM_Velocity_Change= d.processed.CoM_Velocity(end,2)- d.processed.CoM_Velocity(1,2);
d.processed.Results.CoM_Velocity_Change=d.processed.Results.CoM_Velocity_Change/100;

 [q,w]=size(d.processed.Ball_Velocity); 
        wn = 8;
             [b, a] = butter(4,wn/125, 'low');
      d.processed.Ball_Velocity=filtfilt(b,a,d.processed.Ball_Velocity);
d.processed.Results.Ball_Velocity= d.processed.Ball_Velocity(end,1);
d.processed.Results.Ball_Velocity=d.processed.Results.Ball_Velocity/10;
%%
%%%%%%%%%%%% Creeating the scores %%%%%%%%%


%%%%% Pass Time %%%%%

if d.processed.Results.Pass_Time >= 0.3 && d.processed.Results.Pass_Time < 0.4
    d.processed.Results.Scores.Pass_Time=3;
end

if d.processed.Results.Pass_Time >= 0.4 && d.processed.Results.Pass_Time <0.5   %%%% over 2 trials max 6 +
    d.processed.Results.Scores.Pass_Time=2;
end

if d.processed.Results.Pass_Time >= 0.5 && d.processed.Results.Pass_Time < 0.6
    d.processed.Results.Scores.Pass_Time=1;
end

if d.processed.Results.Pass_Time == 0.6
    d.processed.Results.Scores.Pass_Time=0;
end

if d.processed.Results.Pass_Time >0.6 && d.processed.Results.Pass_Time <= 0.7
    d.processed.Results.Scores.Pass_Time=-1;
end

if d.processed.Results.Pass_Time > 0.7 &&  d.processed.Results.Pass_Time <= 0.8
    d.processed.Results.Scores.Pass_Time=-2;
end

if d.processed.Results.Pass_Time >0.8 && d.processed.Results.Pass_Time <= 0.9
    d.processed.Results.Scores.Pass_Time=-3;
end

if d.processed.Results.Pass_Time >0.9 && d.processed.Results.Pass_Time <= 1.0  %%%% over 2 trials max 10 -
    d.processed.Results.Scores.Pass_Time=-4;
end

if d.processed.Results.Pass_Time >1.0 && d.processed.Results.Pass_Time <= 1.1
    d.processed.Results.Scores.Pass_Time=-5;
end

%%%%% Draw Back %%%%%
% if d.processed.Results.Ball_Drawback >=0 && d.processed.Results.Ball_Drawback <6
%     d.processed.Results.Scores.Ball_Drawback=16;
% end
% 
% if d.processed.Results.Ball_Drawback >=6 && d.processed.Results.Ball_Drawback < 11
%     d.processed.Results.Scores.Ball_Drawback=15;
% end
% 
% 
% if d.processed.Results.Ball_Drawback >= 11 &&d.processed.Results.Ball_Drawback < 16
%     d.processed.Results.Scores.Ball_Drawback=14;
% end
% 
% if d.processed.Results.Ball_Drawback >= 16 && d.processed.Results.Ball_Drawback < 21
%     d.processed.Results.Scores.Ball_Drawback=13;
% end
% 
% if d.processed.Results.Ball_Drawback >= 21 && d.processed.Results.Ball_Drawback < 26
%     d.processed.Results.Scores.Ball_Drawback=-12;
% end

if  d.processed.Results.Ball_Drawback < 31
    d.processed.Results.Scores.Ball_Drawback=-5;
end

if d.processed.Results.Ball_Drawback >= 31 && d.processed.Results.Ball_Drawback < 36
    d.processed.Results.Scores.Ball_Drawback=-4.5;
end

if d.processed.Results.Ball_Drawback >= 36 && d.processed.Results.Ball_Drawback < 41
    d.processed.Results.Scores.Ball_Drawback=-4;
end

if d.processed.Results.Ball_Drawback >= 41 && d.processed.Results.Ball_Drawback < 46
    d.processed.Results.Scores.Ball_Drawback=-3.5;
end

if d.processed.Results.Ball_Drawback >= 46 && d.processed.Results.Ball_Drawback < 51
    d.processed.Results.Scores.Ball_Drawback=-3;
end

if d.processed.Results.Ball_Drawback >= 51 && d.processed.Results.Ball_Drawback < 56
    d.processed.Results.Scores.Ball_Drawback=-2.5;
end

if d.processed.Results.Ball_Drawback >= 56 && d.processed.Results.Ball_Drawback < 61
    d.processed.Results.Scores.Ball_Drawback=-2;
end

if d.processed.Results.Ball_Drawback >= 61 && d.processed.Results.Ball_Drawback < 66
    d.processed.Results.Scores.Ball_Drawback=-1.5;
end

if d.processed.Results.Ball_Drawback >= 66 && d.processed.Results.Ball_Drawback < 71
    d.processed.Results.Scores.Ball_Drawback=-1;
end

if d.processed.Results.Ball_Drawback >= 71 && d.processed.Results.Ball_Drawback < 76
    d.processed.Results.Scores.Ball_Drawback=-0.5;
end

if d.processed.Results.Ball_Drawback >= 76 && d.processed.Results.Ball_Drawback < 81
    d.processed.Results.Scores.Ball_Drawback=1;
end

if d.processed.Results.Ball_Drawback >= 81 && d.processed.Results.Ball_Drawback < 86
    d.processed.Results.Scores.Ball_Drawback=2;
end

if d.processed.Results.Ball_Drawback >= 86 && d.processed.Results.Ball_Drawback < 91
    d.processed.Results.Scores.Ball_Drawback=3;
end

if d.processed.Results.Ball_Drawback >= 91 && d.processed.Results.Ball_Drawback < 96
    d.processed.Results.Scores.Ball_Drawback=4;
end

if d.processed.Results.Ball_Drawback >= 96 && d.processed.Results.Ball_Drawback < 100
    d.processed.Results.Scores.Ball_Drawback=5;
end

%%%%% CoM velocity cahange %%%%%


if d.processed.Results.CoM_Velocity_Change < -1.0
    d.processed.Results.Scores.CoM_Velocity_Change=-5;
end

% if d.processed.Results.CoM_Velocity_Change > -1.0
%     d.processed.Results.Scores.CoM_Velocity_Change=-11;
% end

if d.processed.Results.CoM_Velocity_Change >= -1.0 && d.processed.Results.CoM_Velocity_Change < -0.9
    d.processed.Results.Scores.CoM_Velocity_Change=-4.5;
end

if d.processed.Results.CoM_Velocity_Change >= -0.9 && d.processed.Results.CoM_Velocity_Change < -0.8
    d.processed.Results.Scores.CoM_Velocity_Change=-4;
end

if d.processed.Results.CoM_Velocity_Change >= -0.8 && d.processed.Results.CoM_Velocity_Change < -0.7
    d.processed.Results.Scores.CoM_Velocity_Change=-3.5;
end

if d.processed.Results.CoM_Velocity_Change >= -0.7 && d.processed.Results.CoM_Velocity_Change < -0.6
    d.processed.Results.Scores.CoM_Velocity_Change=-3;
end

if d.processed.Results.CoM_Velocity_Change >= -0.6 && d.processed.Results.CoM_Velocity_Change < -0.5
    d.processed.Results.Scores.CoM_Velocity_Change=-2.5;
end

if d.processed.Results.CoM_Velocity_Change >= -0.5 && d.processed.Results.CoM_Velocity_Change < -0.4
    d.processed.Results.Scores.CoM_Velocity_Change=-2;
end

if d.processed.Results.CoM_Velocity_Change >= -0.4 && d.processed.Results.CoM_Velocity_Change < -0.3
    d.processed.Results.Scores.CoM_Velocity_Change=-1.5;
end

if d.processed.Results.CoM_Velocity_Change >= -0.3 && d.processed.Results.CoM_Velocity_Change < -0.2
    d.processed.Results.Scores.CoM_Velocity_Change=-1;
end

if d.processed.Results.CoM_Velocity_Change >= -0.2 && d.processed.Results.CoM_Velocity_Change < -0.1
    d.processed.Results.Scores.CoM_Velocity_Change=-0.5;
end

 if d.processed.Results.CoM_Velocity_Change > -0.1 && d.processed.Results.CoM_Velocity_Change < 0.1
     d.processed.Results.Scores.CoM_Velocity_Change=0;
 end

if d.processed.Results.CoM_Velocity_Change > 0.1 && d.processed.Results.CoM_Velocity_Change <= 0.2
    d.processed.Results.Scores.CoM_Velocity_Change=0.5;
end

if d.processed.Results.CoM_Velocity_Change > 0.2 && d.processed.Results.CoM_Velocity_Change <= 0.3
    d.processed.Results.Scores.CoM_Velocity_Change=1;
end

if d.processed.Results.CoM_Velocity_Change > 0.3 && d.processed.Results.CoM_Velocity_Change <= 0.4
    d.processed.Results.Scores.CoM_Velocity_Change=1.5;
end

if d.processed.Results.CoM_Velocity_Change > 0.4 && d.processed.Results.CoM_Velocity_Change <= 0.5
    d.processed.Results.Scores.CoM_Velocity_Change=2;
end

if d.processed.Results.CoM_Velocity_Change > 0.5 && d.processed.Results.CoM_Velocity_Change <= 0.6
    d.processed.Results.Scores.CoM_Velocity_Change=2.5;
end

if d.processed.Results.CoM_Velocity_Change > 0.6 && d.processed.Results.CoM_Velocity_Change <= 0.7
    d.processed.Results.Scores.CoM_Velocity_Change=3.0;
end

if d.processed.Results.CoM_Velocity_Change > 0.7 && d.processed.Results.CoM_Velocity_Change <= 0.8
    d.processed.Results.Scores.CoM_Velocity_Change=3.5;
end

if d.processed.Results.CoM_Velocity_Change > 0.8 && d.processed.Results.CoM_Velocity_Change <= 0.9
    d.processed.Results.Scores.CoM_Velocity_Change=4;
end

if d.processed.Results.CoM_Velocity_Change > 0.9 && d.processed.Results.CoM_Velocity_Change <= 1.0
    d.processed.Results.Scores.CoM_Velocity_Change=4.5;
end

if d.processed.Results.CoM_Velocity_Change > 1.0
    d.processed.Results.Scores.CoM_Velocity_Change=5;
end


%%%%%%% Thorax Rotation %%%%%%%%

if d.processed.Results.Thorax_Rotation_Release >= 0 && d.processed.Results.Thorax_Rotation_Release < 10
    d.processed.Results.Scores.Thorax_Rotation_Release=5;
end

if d.processed.Results.Thorax_Rotation_Release >= 10 && d.processed.Results.Thorax_Rotation_Release < 20
    d.processed.Results.Scores.Thorax_Rotation_Release=4;
end

if d.processed.Results.Thorax_Rotation_Release >= 20 && d.processed.Results.Thorax_Rotation_Release < 30
    d.processed.Results.Scores.Thorax_Rotation_Release=3;
end

if d.processed.Results.Thorax_Rotation_Release >= 30 && d.processed.Results.Thorax_Rotation_Release < 36
    d.processed.Results.Scores.Thorax_Rotation_Release=2;
end

if d.processed.Results.Thorax_Rotation_Release >= 36 && d.processed.Results.Thorax_Rotation_Release < 40
    d.processed.Results.Scores.Thorax_Rotation_Release=1;
end

if d.processed.Results.Thorax_Rotation_Release >= 40 && d.processed.Results.Thorax_Rotation_Release < 45
    d.processed.Results.Scores.Thorax_Rotation_Release=0;
end

if d.processed.Results.Thorax_Rotation_Release >= 46 && d.processed.Results.Thorax_Rotation_Release < 50
    d.processed.Results.Scores.Thorax_Rotation_Release=0.5;
end

if d.processed.Results.Thorax_Rotation_Release >= 50 && d.processed.Results.Thorax_Rotation_Release < 60
    d.processed.Results.Scores.Thorax_Rotation_Release=-1;
end

if d.processed.Results.Thorax_Rotation_Release >= 60 && d.processed.Results.Thorax_Rotation_Release < 70
    d.processed.Results.Scores.Thorax_Rotation_Release=-2;
end

if d.processed.Results.Thorax_Rotation_Release >= 70 && d.processed.Results.Thorax_Rotation_Release < 80
    d.processed.Results.Scores.Thorax_Rotation_Release=-3;
end

if d.processed.Results.Thorax_Rotation_Release >= 80 && d.processed.Results.Thorax_Rotation_Release < 90
    d.processed.Results.Scores.Thorax_Rotation_Release=-4;
end

if d.processed.Results.Thorax_Rotation_Release >= 90 && d.processed.Results.Thorax_Rotation_Release < 100
    d.processed.Results.Scores.Thorax_Rotation_Release=-5;
end


%%%%%%% Pelvis Rotation %%%%%%%%


if d.processed.Results.Pelvis_Rotation_Release >= 0 && d.processed.Results.Pelvis_Rotation_Release < 10
    d.processed.Results.Scores.Pelvis_Rotation_Release=5;
end

if d.processed.Results.Pelvis_Rotation_Release >= 10 && d.processed.Results.Pelvis_Rotation_Release < 20
    d.processed.Results.Scores.Pelvis_Rotation_Release=4;
end

if d.processed.Results.Pelvis_Rotation_Release >= 20 && d.processed.Results.Pelvis_Rotation_Release < 30
    d.processed.Results.Scores.Pelvis_Rotation_Release=3;
end

if d.processed.Results.Pelvis_Rotation_Release >= 30 && d.processed.Results.Pelvis_Rotation_Release < 36
    d.processed.Results.Scores.Pelvis_Rotation_Release=2;
end

if d.processed.Results.Pelvis_Rotation_Release >= 36 && d.processed.Results.Pelvis_Rotation_Release < 40
    d.processed.Results.Scores.Pelvis_Rotation_Release=1;
end

if d.processed.Results.Pelvis_Rotation_Release >= 40 && d.processed.Results.Pelvis_Rotation_Release < 45
    d.processed.Results.Scores.Pelvis_Rotation_Release=0;
end

if d.processed.Results.Pelvis_Rotation_Release >= 45 && d.processed.Results.Pelvis_Rotation_Release < 50
    d.processed.Results.Scores.Pelvis_Rotation_Release=0.5;
end

if d.processed.Results.Pelvis_Rotation_Release >= 50 && d.processed.Results.Pelvis_Rotation_Release < 60
    d.processed.Results.Scores.Pelvis_Rotation_Release=-1;
end

if d.processed.Results.Pelvis_Rotation_Release >= 60 && d.processed.Results.Pelvis_Rotation_Release < 70
    d.processed.Results.Scores.Pelvis_Rotation_Release=-2;
end

if d.processed.Results.Pelvis_Rotation_Release >= 70 && d.processed.Results.Pelvis_Rotation_Release < 80
    d.processed.Results.Scores.Pelvis_Rotation_Release=-3;
end

if d.processed.Results.Pelvis_Rotation_Release >= 80 && d.processed.Results.Pelvis_Rotation_Release < 90
    d.processed.Results.Scores.Pelvis_Rotation_Release=-4;
end

if d.processed.Results.Pelvis_Rotation_Release >= 90 && d.processed.Results.Pelvis_Rotation_Release < 100
    d.processed.Results.Scores.Pelvis_Rotation_Release=-5;
end

%%%%% Foot alignment %%%%%%

if d.processed.Results.Foot_Alignment_Total >= 0 && d.processed.Results.Foot_Alignment_Total < 6
    d.processed.Results.Scores.Foot_Alignment_Total=0;
end

if d.processed.Results.Foot_Alignment_Total >= 6 && d.processed.Results.Foot_Alignment_Total < 11
    d.processed.Results.Scores.Foot_Alignment_Total=-0.5;
end

if d.processed.Results.Foot_Alignment_Total >= 11 && d.processed.Results.Foot_Alignment_Total < 21
    d.processed.Results.Scores.Foot_Alignment_Total=-1;
end

if d.processed.Results.Foot_Alignment_Total >= 21 && d.processed.Results.Foot_Alignment_Total < 31
    d.processed.Results.Scores.Foot_Alignment_Total=-1.5;
end

if d.processed.Results.Foot_Alignment_Total >=31 &&  d.processed.Results.Foot_Alignment_Total < 41
    d.processed.Results.Scores.Foot_Alignment_Total=-2;
end

if d.processed.Results.Foot_Alignment_Total >=41 && d.processed.Results.Foot_Alignment_Total <= 51
    d.processed.Results.Scores.Foot_Alignment_Total=-2.5;
end

if d.processed.Results.Foot_Alignment_Total >=51 && d.processed.Results.Foot_Alignment_Total <= 61
    d.processed.Results.Scores.Foot_Alignment_Total=-3;
end

if d.processed.Results.Foot_Alignment_Total >=61 && d.processed.Results.Foot_Alignment_Total <= 71
    d.processed.Results.Scores.Foot_Alignment_Total=-3.5;
end

if d.processed.Results.Foot_Alignment_Total >=71 && d.processed.Results.Foot_Alignment_Total <= 81
    d.processed.Results.Scores.Foot_Alignment_Total=-4;
end

if d.processed.Results.Foot_Alignment_Total >=81 && d.processed.Results.Foot_Alignment_Total <= 91
    d.processed.Results.Scores.Foot_Alignment_Total=-4.5;
end

if d.processed.Results.Foot_Alignment_Total >=91 && d.processed.Results.Foot_Alignment_Total <= 101
    d.processed.Results.Scores.Foot_Alignment_Total=-5;
end


d.processed.Results.Foot_Swing_Total;

if d.processed.Results.Foot_Swing_Total >= 0 && d.processed.Results.Foot_Swing_Total < 6
    d.processed.Results.Scores.Foot_Swing_Total=0;
end

if d.processed.Results.Foot_Swing_Total >= 6 && d.processed.Results.Foot_Swing_Total < 11
    d.processed.Results.Scores.Foot_Swing_Total=-0.5;
end

if d.processed.Results.Foot_Swing_Total >= 11 && d.processed.Results.Foot_Swing_Total < 21
    d.processed.Results.Scores.Foot_Swing_Total=-1;
end

if d.processed.Results.Foot_Swing_Total >= 21 && d.processed.Results.Foot_Swing_Total < 31
    d.processed.Results.Scores.Foot_Swing_Total=-1.5;
end

if d.processed.Results.Foot_Swing_Total >=31 &&  d.processed.Results.Foot_Swing_Total < 41
    d.processed.Results.Scores.Foot_Swing_Total=-2;
end

if d.processed.Results.Foot_Swing_Total >=41 && d.processed.Results.Foot_Swing_Total <= 51
    d.processed.Results.Scores.Foot_Swing_Total=-2.5;
end

if d.processed.Results.Foot_Swing_Total >=51 && d.processed.Results.Foot_Swing_Total <= 61
    d.processed.Results.Scores.Foot_Swing_Total=-3;
end

if d.processed.Results.Foot_Swing_Total >=61 && d.processed.Results.Foot_Swing_Total <= 71
    d.processed.Results.Scores.Foot_Swing_Total=-3.5;
end

if d.processed.Results.Foot_Swing_Total >=71 && d.processed.Results.Foot_Swing_Total <= 81
    d.processed.Results.Scores.Foot_Swing_Total=-4;
end

if d.processed.Results.Foot_Swing_Total >=81 && d.processed.Results.Foot_Swing_Total <= 91
    d.processed.Results.Scores.Foot_Swing_Total=-4.5;
end

if d.processed.Results.Foot_Swing_Total >=91 
    d.processed.Results.Scores.Foot_Swing_Total=-5;
end



%%
%%% SAVE DIRECTORY %%
folder_name ='C:\Users\sm21438\Documents\Cardiff Met\Biomechanics\Sport Science Support\WRU\'; %%%% change to desired file location %%%
%   uigetdir; %%%% change to desired file location %%%
OutputFile = [folder_name,'\WRU_',file,'.xlsx'];

% copies template file to that of trial name %
copyfile('C:\Users\sm21438\Documents\Cardiff Met\Biomechanics\Sport Science Support\WRU\WRU_NEW.xlsx',... %%%% change to desired file location %%%
strcat('C:\Users\sm21438\Documents\Cardiff Met\Biomechanics\Sport Science Support\WRU\WRU_',file,'.xlsx'));  %%%% change to desired file location %%%

TEXT1 = {file};

%%% Data %%
TEXT2 = {d.processed.Results.Pass_Time};
TEXT3 = {d.processed.Results.Ball_Drawback};
TEXT4 = {d.processed.Results.CoM_Velocity_Change};
TEXT5 = {d.processed.Results.Pelvis_Rotation_Release};  
TEXT6 ={d.processed.Results.Thorax_Rotation_Release};
TEXT7 = {d.processed.Results.Foot_Alignment_Total};
TEXT8 = {d.processed.Results.Foot_Swing_Total};


%%% Scores %%%
TEXT9 = {d.processed.Results.Scores.Pass_Time};
TEXT10 = {d.processed.Results.Scores.Ball_Drawback};
TEXT11 = {d.processed.Results.Scores.CoM_Velocity_Change};
TEXT12 = {d.processed.Results.Scores.Pelvis_Rotation_Release};  
TEXT13 ={d.processed.Results.Scores.Thorax_Rotation_Release};
TEXT14 = {d.processed.Results.Scores.Foot_Alignment_Total};
TEXT15 = {d.processed.Results.Scores.Foot_Swing_Total};
TEXT16 = {d.processed.Results.Ball_Velocity};

[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT1,'Analysis 1','B1'); 

[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT2,'Analysis 1','B4'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT3,'Analysis 1','B6'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT4,'Analysis 1','B8'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT5,'Analysis 1','B10'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT6,'Analysis 1','B11'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT7,'Analysis 1','B16'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT8,'Analysis 1','B17'); 


[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT9,'Analysis 1','C4'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT10,'Analysis 1','C6'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT11,'Analysis 1','C8'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT12,'Analysis 1','C10'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT13,'Analysis 1','C11'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT14,'Analysis 1','C16'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT15,'Analysis 1','C17'); 
[SUCCESS,MESSAGE]=xlswrite(OutputFile,TEXT16,'Analysis 1','B19'); 
%%% to do - ball velocity, hand position,
 end

% % Construct a questdlg with three options
% choice = questdlg('Analyse Next Trial?', ...
% 	'Trial box', ...
% 	'Yes','No','No');
% % Handle response
% switch choice
%     case 'Yes'
%         decision = 1;
%     case 'No'
%         decision = 0;
% end
% 
% if decision == 1
%     
%     clear all %#ok<CLALL>
%     WRU
% end
% 
% if decision == 0
% 
%  end





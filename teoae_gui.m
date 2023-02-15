function teoae_gui

global fs playChanList recChanList spacing ydb measurements time_rejection...
    check_level checkfit_monit threshold check_l f1 f2...
    mainFigure del del_input mainguiFigure

load TEDefault
close(mainguiFigure)
scrsize=get(0,'ScreenSize');

mainFigure=figure;
set(mainFigure,'OuterPosition',[0 30 scrsize(3) scrsize(4)-30])
if exist('TempTESettings','file')==2
    load TempTESettings
end

%% General
uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.09 0.9 0.5 0.03],...
    'BackgroundColor',[84 84 84]/256,...
    'ForegroundColor','w',...
    'FontWeight','bold',...
    'Fontsize',11,...
    'String','General:');

uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.1 0.82 0.2 0.03],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','Sampling frequency [Hz]:',...
    'HorizontalAlignment','center');
fs = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.15 0.77 0.1 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_fs);

playChanList = uicontrol(mainFigure,...
    'Style','popupmenu',...
    'Units','normalized',...
    'Position',[0.35 0.7 0.2 0.1],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String',{'Output Channel 1' 'Output Channel 2'},...
    'Value',default_playChanList);
recChanList = uicontrol(mainFigure,...
    'Style','popupmenu',...
    'Units','normalized',...
    'Position',[0.35 0.75 0.2 0.1],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String',{'Input Channel 1' 'Input Channel 2'}',...
    'Value',default_recChanList);

del = uicontrol(mainFigure,...
    'Style','popupmenu',...
    'Units','normalized',...
    'Position',[0.1 0.6 0.2 0.1],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String',{'Automatic delay' 'Input delay [ms]:'},...
    'Value',default_del);
del_input = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.35 0.66 0.2 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'Visible','on',...
    'String',default_del_input);

% %% Patient info
% uicontrol(mainFigure,...
%     'Style','text',...
%     'Units','normalized',...
%     'Position',[0.66 0.9 0.3 0.03],...
%     'BackgroundColor',[84 84 84]/256,...
%     'ForegroundColor','w',...
%     'FontWeight','bold',...
%     'Fontsize',11,...
%     'String','Patient info:');
% 
% uicontrol(mainFigure,...
%     'Style','text',...
%     'Units','normalized',...
%     'Position',[0.72 0.82 0.2 0.03],...
%     'BackgroundColor','w',...
%     'Fontsize',11,...
%     'String','Patient ID:',...
%     'HorizontalAlignment','center');
% PatientID = uicontrol(mainFigure,...
%     'Style','edit',...
%     'Units','normalized',...
%     'Position',[0.72 0.77 0.2 0.04],...
%     'BackgroundColor','w',...
%     'Fontsize',11,...
%     'HorizontalAlignment','center',...
%     'String','Patient_');
% 
% Ear = uicontrol(mainFigure,...
%     'Style','popupmenu',...
%     'Units','normalized',...
%     'Position',[0.72 0.65 0.08 0.1],...
%     'BackgroundColor','w',...
%     'Fontsize',11,...
%     'String',{'Left Ear' 'Right Ear'}',...
%     'Value',1);
% 
% uicontrol(mainFigure,...
%     'Style','text',...
%     'Units','normalized',...
%     'Position',[0.82 0.71 0.05 0.04],...
%     'BackgroundColor','w',...
%     'Fontsize',11,...
%     'String','Age:',...
%     'HorizontalAlignment','center');
% Age = uicontrol(mainFigure,...
%     'Style','edit',...
%     'Units','normalized',...
%     'Position',[0.87 0.71 0.05 0.04],...
%     'BackgroundColor','w',...
%     'Fontsize',11,...
%     'HorizontalAlignment','center');

%% TEOAE
uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.09 0.55 0.5 0.03],...
    'BackgroundColor',[84 84 84]/256,...
    'ForegroundColor','w',...
    'FontWeight','bold',...
    'Fontsize',11,...
    'String','TEOAE parameters:');

uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.1 0.47 0.2 0.03],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','Level of the biggest stimulus [dB SPL]:',...
    'HorizontalAlignment','center');
ydb = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.1 0.43 0.2 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_ydb);

uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.35 0.47 0.2 0.03],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','Number of measurements:',...
    'HorizontalAlignment','center');
measurements = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.35 0.43 0.2 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_measurements);

uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.1 0.37 0.2 0.03],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','Time rejection [ms]',...
    'HorizontalAlignment','center');
time_rejection = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.1 0.33 0.2 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_time_rejection);

uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.35 0.37 0.2 0.03],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','Rejection threshold [dB SPL]',...
    'HorizontalAlignment','center');
threshold = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.35 0.33 0.2 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_threshold);

uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.1 0.27 0.2 0.03],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','Spacing between the stimuli [ms]:',...
    'HorizontalAlignment','center');
spacing = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.1 0.23 0.2 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_spacing);

uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.35 0.27 0.2 0.03],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','Filtering of the response:',...
    'HorizontalAlignment','center');
uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.35 0.23 0.1 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','HPF cutoff [Hz]:',...
    'HorizontalAlignment','center');
f1 = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.45 0.23 0.1 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_f1);
uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.35 0.19 0.1 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','LPF cutoff [Hz]:',...
    'HorizontalAlignment','center');
f2 = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.45 0.19 0.1 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_f2);

%% checkfit

uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.61 0.75 0.3 0.03],...
    'BackgroundColor',[84 84 84]/256,...
    'ForegroundColor','w',...
    'FontWeight','bold',...
    'Fontsize',11,...
    'String','Checkfit parameters:');


uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.67 0.67 0.2 0.03],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','Checkfit impulse level [dB SPL]',...
    'HorizontalAlignment','center');
check_level = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.67 0.63 0.2 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_check_level);

uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.67 0.57 0.2 0.03],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String','Length of the checkfit signal [ms]:',...
    'HorizontalAlignment','center');
check_l = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.67 0.53 0.2 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_check_l);

uicontrol(mainFigure,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.67 0.45 0.2 0.05],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'String',{'Frequency of checkfit monitoring' '(number of 4-click measurements):'},...
    'HorizontalAlignment','center');
checkfit_monit = uicontrol(mainFigure,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.67 0.41 0.2 0.04],...
    'BackgroundColor','w',...
    'Fontsize',11,...
    'HorizontalAlignment','center',...
    'String',default_checkfit_monit);

%% start & load
startbut = uicontrol(mainFigure,...
    'Style','pushbutton',...
    'Units','normalized',...
    'Position',[0.65 0.1 0.25 0.15],... %'BackgroundColor',[50 205 50]/256,...
    'Fontsize',14,...
    'FontWeight','normal',...
    'String','START',...
    'Callback',@startMeasCalb);    
uicontrol(startbut) % give start button focus
% the following three push buttons need call back functions to be defined. 
% these can be used to save and load measurement configuration settings
%
% uicontrol(mainFigure,...
%     'Style','pushbutton',...
%     'Units','normalized',...
%     'Position',[0.1 0.04 0.1 0.05],...
%     'BackgroundColor','w',...
%     'Fontsize',11,...
%     'FontWeight','bold',...
%     'String','Default',...
%     'Callback',@load_default); 
% 
% uicontrol(mainFigure,...
%     'Style','pushbutton',...
%     'Units','normalized',...
%     'Position',[0.22 0.04 0.1 0.05],...
%     'BackgroundColor','w',...
%     'Fontsize',11,...
%     'FontWeight','bold',...
%     'String','Load settings',...
%     'Callback',@teoae_load_settings); 
% 
% uicontrol(mainFigure,...
%     'Style','pushbutton',...
%     'Units','normalized',...
%     'Position',[0.34 0.04 0.1 0.05],...
%     'BackgroundColor','w',...
%     'Fontsize',11,...
%     'FontWeight','bold',...
%     'String','Save settings',...
%     'Callback',@teoae_save_settings); 

end

function startMeasCalb(~,~)
global mainFigure fs playChanList recChanList spacing ydb measurements...
    time_rejection check_level checkfit_monit threshold check_l f1 f2...
    delay del del_input


playChanList=get(playChanList,'Value');
recChanList=get(recChanList,'Value');
spacing=str2double(get(spacing,'String'))/1000;
ydb=str2double(get(ydb,'String'));
measurements=str2double(get(measurements,'String'));
time_rejection=str2double(get(time_rejection,'String'))/1000;
check_level=str2double(get(check_level,'String'));
checkfit_monit=str2double(get(checkfit_monit,'String'));
fs=str2double(get(fs,'String'));
threshold=str2double(get(threshold,'String'));
check_l=str2double(get(check_l,'String'))/1000;
f1=str2double(get(f1,'String'));
f2=str2double(get(f2,'String'));
% PatientID=get(PatientID,'String');
% Age=get(Age,'String');

% if get(Ear,'Value')==1
%     Ear='Left';
% else
%     Ear='Right';
% end

get(del,'Value');
if get(del,'Value')==1
    delay=-1;
else
    delay=str2double(get(del_input,'String'))/1000;
end


close(mainFigure)
checkfit;
teoae_recording;
end
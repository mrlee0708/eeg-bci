%% Visual-Stimulation Test
% 2021-11-09
% Made by Miran Lee

% num_trial = Integer
% base_th = Stimulation interval (sec)

% Clear the all screens and workspaces
sca; % closes all screens
clear all; % clear all variables

Screen('Preference', 'SkipSyncTests', 1);
screens = Screen ('Screens');
screenNumber = max(screens);

% Setting
%Define and use color for screen background
black = [0 0 0];
white = WhiteIndex(screenNumber);
% rect = Screen('Rect', 0) 0 0 4320 1440

%Define text color and position
textcolor = [255 255 255];
%x = rect(3)/2;
%y = rect(4)/2;

% Image setting
imgleftfile='image_stm/left_arrow.jpg';
imgrightfile='image_stm/right_arrow.jpg';
imgstartfile ='image_stm/start.jpg'
imgreadyfile = 'image_stm/ready.jpg'
imgrestfile = 'image_stm/rest.jpg'
% Load image
imaleft=imread(imgleftfile, 'jpg');
imaright=imread(imgrightfile, 'jpg');
imastart=imread(imgstartfile, 'jpg');
imaready=imread(imgreadyfile, 'jpg');
imarest=imread(imgrestfile, 'jpg');

sizeIm = [0 0 1000 1000]

total_trial = 2;
base_th = 0.5; % Stimulation interval (sec)

% Stimulation period random
exp_flag=0;
if (mod(total_trial,2)==0)
    [output] = arrow_randfunction(total_trial);
    exp_flag = 1;
else  
    disp("Please input the even number to 'total_trial'")
    exp_flag = 0;
end
disp("Please input the even number to variable [total_trial]")

% Main code
if(exp_flag==1)
    
    [outwindow, rect] = Screen('Openwindow', screenNumber, [0 0 0]); 
    
    % Start 
    for i=1:total_trial
    
        Screen('PutImage', outwindow, imastart); % put image on screen
        Screen('Flip',outwindow); % now visible on screen
        WaitSecs(1);
        Screen('FillRect',outwindow,black); % Blank screen
        Screen('Flip',outwindow); 
        WaitSecs(5);
        
        % Ready
        Screen('PutImage', outwindow, imaready); % put image on screen
        Screen('Flip',outwindow); % now visible on screen
        WaitSecs(1);
        Screen('FillRect',outwindow,black); % Blank screen
        Screen('Flip',outwindow); 
        WaitSecs(5);
        
        % Visual Simuli
        if(output(1,i)==1)
            imgvisual = imaleft;
        else
            imgvisual = imaright;
        end
        Screen('PutImage', outwindow, imgvisual, [], sizeIm); % put image on screen
        Screen('Flip',outwindow); % now visible on screen
        WaitSecs(base_th);
        
        % Blank screen
        Screen('FillRect',outwindow,black); % Blank screen 
        Screen('Flip',outwindow); 
        WaitSecs(5);
        
        % Rest
        Screen('PutImage', outwindow, imarest); % put image on screen
        Screen('Flip',outwindow); % now visible on screen
        WaitSecs(1);
        Screen('FillRect',outwindow,black); % Blank screen
        Screen('Flip',outwindow); 
        WaitSecs(5);
    end
    
    Screen('CloseAll')
end
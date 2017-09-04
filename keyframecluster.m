srcFiles = dir('C:\Users\SAURADIP\Documents\MATLAB\video frame multimodal\new race fused 10\fused frame\*.jpg');  % the folder in which ur images exists
for i = 2 : (length(srcFiles))
    filename = strcat('C:\Users\SAURADIP\Documents\MATLAB\video frame multimodal\new race fused 10\fused frame\',srcFiles(1).name);
    filename1 = strcat('C:\Users\SAURADIP\Documents\MATLAB\video frame multimodal\new race fused 10\fused frame\',srcFiles(i).name);
    I = imread(filename);
    I1= imread(filename1);
    D=abs(I-I1);
     filename = fullfile('C:\Users\SAURADIP\Documents\MATLAB\video frame multimodal\new race fused 10\frame difference', sprintf('raceframediffskin_%05d.JPG', i));   %Writing the keyframes
imwrite(D, filename);
end
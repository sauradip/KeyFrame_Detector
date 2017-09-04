# KeyFrame_Detector
It helps in Finding Keyframe Number From a Video Stream by Observing a graph 
Steps :

1. First take a video and run fuseofkeyframe.m , Output will be Fused Frame Obtained by Fusing 2 features Magnitude Gradient and Directional Coherence
2. Then Take the Fused frame folder of Step1 and give input to this step and run keyframecluster.m , output will be a Frame Difference Image 
3. Take this frame difference image folder and give input to this step , run standarddeviationvsimagearraygenerator.m file and 3 array of vaues will be generated 1 for max cluster , 1 for min cluster , 1 for avg cluster 
4. Open the terminal in that same code and paste this code 

yaxes=sdmax(:,1)
xaxes=frames(:,1)
plot(xaxes,yaxes)
xlabel('No of frames' )
ylabel('Standard Deviation of Max Cluster')

Change sdmax , sdavg ,sdmin accordingly 

Result : You will get the exact Frame Numbers which are KeyFrame , from the graph , if there is any sharp decline or incline then that point is new frame/keyframe 

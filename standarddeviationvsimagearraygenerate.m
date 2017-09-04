srcFiles = dir('C:\Users\SAURADIP\Documents\MATLAB\video frame multimodal\new race fused 10\frame difference\*.jpg');  % the folder in which ur images exists
sdmax=zeros(length(srcFiles),1);
    sdmin=zeros(length(srcFiles),1);
    sdavg=zeros(length(srcFiles),1);
    frames=zeros(length(srcFiles),1);
    fcount=0;
for i = 2 : (length(srcFiles))
    filename = strcat('C:\Users\SAURADIP\Documents\MATLAB\video frame multimodal\new race fused 10\frame difference\',srcFiles(i).name);
    
    I = imread(filename);
    C=double(I)/double(max(max(I)));
D=double(C);
nrows = size(D,1);
ncols = size(D,2);
ab = reshape(D,nrows*ncols,1);
[idx3,centroid] = kmeans(ab,3);
cluster1=ab(idx3==1);
maxclust1=max(cluster1);
clust1=cluster1./maxclust1; %containing cluster 1 values in 0-1 range%

cluster2=ab(idx3==2);
maxclust2=max(cluster2);
clust2=cluster2./maxclust2; %containing cluster 2 values in 0-1 range%

cluster3=ab(idx3==3);
sdmaxclust3=max(cluster3);
clust3=cluster3./sdmaxclust3; %containing cluster 3 values in 0-1 range%

clusmark=[1;2;3];
cluscentroid=zeros(3,2);
cluscentroid(:,1)=clusmark;
cluscentroid(:,2)=centroid;
[sortcluster,index]=sort(centroid);

% sorted cluster
minclusterindex=index(1,1);
avgclusterindex=index(2,1);
maxclusterindex=index(3,1);

% checking which cluster is min, max , avg from k means cluster
%min cluster with values
minclustersd=ab(idx3==minclusterindex);
sdmaxclust1=max(minclustersd);
sdclust1=minclustersd./sdmaxclust1;
% avg cluster with values
avgclustersd=ab(idx3==avgclusterindex);
sdmaxclust2=max(avgclustersd);
sdclust2=avgclustersd./sdmaxclust2;
% max cluster with values
maxclustersd=ab(idx3==maxclusterindex);
sdmaxclust3=max(maxclustersd);
sdclust3=maxclustersd./sdmaxclust3;


% finding s.d of maxcluster and storing it
% for max we are using standard deviation
if(sdclust3(:,1)>=0)
sdmax(i,1)=std(sdclust3);
end
% finding s.d of avgcluster and storing it
if(sdclust2(:,1)>=0)
%sdavg(i,1)=median(nonzeros(sdclust2));
sdavg(i,1)=std(sdclust2);
end
% finding s.d of mincluster and storing it
% for min we are using median
if(sdclust1(:,1)>=0)
sdmin(i,1)=median(nonzeros(sdclust1));
end
% generating frame count
fcount=fcount+1;
frames(i,1)=fcount;
end
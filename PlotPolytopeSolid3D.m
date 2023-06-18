function PlotPolytopeSolid3D(eyep,V,B,colors,Name,WS)
% Plot a convex polytope with N vertices in 3d
% V is the 4xN-array of coodinates of vertices
% B - the list of faces 
%------------------------------------------------------- 
N=size(V,2);                      % number of vertices 
NF=size(B,1);                     % number of faces
bcp=sum(V,2)/N; bc(1:3)=bcp(1:3); % barycenter
NC=size(colors,1);                % number of colors available
%-------------------------------------------------------
for k=1:NF;
    [F,vf]=FaceVisibility(k,V,B,eyep,bc);
    if vf<=0; nc=mod(k-1,NC)+1;
              PlotFace3D2(F,colors(nc,:)); 
    end;
end; 
% hold on
% plot3(eyep(1),eyep(2),eyep(3),'-ko','LineWidth',1,...
%       'MarkerEdgeColor','k',...
%       'MarkerFaceColor','g','MarkerSize',10);     
% hold on
%ts2='\fontsize{16}\bf\color{black}';
ts3='\fontsize{16}\bf\color{black}';
%-------------- Axes ------------------------------------
ts1='\fontsize{20}\bf\color{red}';
set(gcf,'Color','w')
  set(gca,'XColor','b','YColor','b','ZColor','b',...
        'fontsize',14,'FontWeight','bold');
   title([ts1,Name]);  
   xlabel([ts3,'x']); ylabel([ts3,'y']); zlabel([ts3,'z']);
   axis(WS);
   view(eyep)  
   axis square; 
   grid off
end


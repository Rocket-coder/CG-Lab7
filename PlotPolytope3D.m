function PlotPolytope3D(V,A,points,arrows,Oxyz,cole,colv,r,we,Name,WS)
% Plot a polytope sceleton in 3d with N vertices
% V is the 4xN-array of coodinates of vertices
% A is the NxN-adjacency matrix of the sceleton
% cole - color of edges
% colv - color of vertices
%    r - size of vertices
%   we - thickness of edges
%-----------------------------------------------
N=size(V,2);      % N is the number of vertices of a polytope
subplot(1,1,1) 
set(gcf,'Color','w') 
X=zeros(2,1); Y=zeros(2,1); Z=zeros(2,1);
for x=1:N; 
    X(1,1)=V(1,x); Y(1,1)=V(2,x); Z(1,1)=V(3,x);
    for y=x:N;  
       if A(x,y)==1; 
          X(2,1)=V(1,y); Y(2,1)=V(2,y); Z(2,1)=V(3,y); 
          col=strcat('-',cole,'o');          
          plot3(X,Y,Z,col,'LineWidth',we,...
                'LineWidth',we,'MarkerEdgeColor','k',...  %we=4
              'MarkerFaceColor',colv,'MarkerSize',r);     %r=8
          hold on
       end;
    end;
end;
%------------ Points -----------------------------------
ts2='\fontsize{16}\bf\color{black}';
ts3='\fontsize{16}\bf\color{black}';
%ts4='\fontsize{16}\bf\color{blue}';
if points==1;
   dx = 0.1; dy=0.1; dz=0.1;   
   for k=0:N-1;
       ks=int2str(k);
       text(V(1,k+1)+dx, V(2,k+1)+dy, V(3,k+1)+dz, [ts2,'P_{',ks,'}']);  
       hold on
   end; 
end; 
%-------------- Oxyz ------------------------------------
if arrows==1;
    r=4;                     % length of axes arrows
    O=Oxyz(1:3,1); Ox=r*Oxyz(1:3,2); Oy=r*Oxyz(1:3,3); Oz=r*Oxyz(1:3,4);
    quiver3(O(1),O(2),O(3),Ox(1),Ox(2),Ox(3),0,...
              'k','LineWidth',2,'MarkerEdgeColor','k',...
                'MarkerFaceColor','k','MarkerSize',1);   %Ox
    hold on            
    quiver3(O(1),O(2),O(3),Oy(1),Oy(2),Oy(3),0,...
              'm','LineWidth',2,'MarkerEdgeColor','k',...
               'MarkerFaceColor','m','MarkerSize',1);    %Oy   
     hold on
     quiver3(O(1),O(2),O(3),Oz(1),Oz(2),Oz(3),0,...,...
              'g','LineWidth',2,'MarkerEdgeColor','k',...
              'MarkerFaceColor','m','MarkerSize',1);     %Oz      
     hold on
     plot3(O(1),O(2),O(3),'-bo','LineWidth',1,'MarkerEdgeColor','k',...
                  'MarkerFaceColor','b','MarkerSize',10);  %O     
end;
%-------------- Axes ------------------------------------
ts1='\fontsize{20}\bf\color{red}';
set(gcf,'Color','w')
  set(gca,'XColor','b','YColor','b','ZColor','b',...
        'fontsize',14,'FontWeight','bold');
   title([ts1,Name]);  
   xlabel([ts3,'x']); ylabel([ts3,'y']); zlabel([ts3,'z']);
   axis(WS);
   axis square; 
   %view([1,2,1])
   grid on
end


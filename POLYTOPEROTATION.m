%POLYTOPEROTATION;
%
%-------- Window --------------------------------------------------
w=7; 
x0=-w; x1=w; y0=-w; y1=w; z0=-w; z1=w;
%x0=0; x1=w; y0=0;  y1=w; z0=0;  z1=w;
WS=[x0, x1, y0, y1, z0, z1]; 
%----------- Polytope ---------------------------------------------
[V,A,B,Name]=PolytopeData3(0); 
%[V,A,B,Name]=CubeData(0); 
%--------- Colours ------------------------------------------------  
colors=ColoursList;
%----------- To shift and scale ---------------------
N=size(V,2);                      % number of vertices 
bcp=sum(V,2)/N; bc(1:3)=bcp(1:3); % barycenter
s=2*[1,1,1];                      % scale factors
T=[ s(1),    0,    0, -bc(1);...
       0, s(2),    0, -bc(2);...
       0,    0, s(3), -bc(3);...
       0,    0,    0,     1];
V=T*V;   
%----------- Rotation -----------------------------------------------
alpha=1; beta=1; gamma=1;
O=[0,0,0,1];
R=Matrix3DRotation(alpha,beta,gamma,O);
%------------------------------------------------------------------
eyep=[-w,-w+3,w-1];            % The observer's position
points=1;                      % names of vertices on/off
cole='r'; colv='k'; r=5; we=3; % color/thickness data
PlotPolytopeSceleton3D(V,A,points,cole,colv,r,we,Name,WS);
pause
hold off
PlotPolytopeSolid3D(eyep,V,B,colors,Name,WS);
hold off
pause
for d=1:1:361;
    a=(d-1)*alpha; b=(d-1)*beta; c=(d-1)*gamma;
    Name=[' \alpha=',int2str(a),'^o, \beta=',int2str(b),'^o,',...
          ' \gamma=',int2str(c),'^o'];
    V = R*V; 
    PlotPolytopeSolid3D(eyep,V,B,colors,Name,WS);
    pause(0.01);
    hold off 
end;
  

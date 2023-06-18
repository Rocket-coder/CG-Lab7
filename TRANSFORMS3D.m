%TRANSFORMS3D;
%
%-------- Window --------------------------------------------------
w=7; 
x0=-w; x1=w; y0=-w; y1=w; z0=-w; z1=w;
%x0=0; x1=w; y0=0;  y1=w; z0=0;  z1=w;
WS=[x0, x1, y0, y1, z0, z1]; 
%----------- Polytope ---------------------------------------------
[V,A,B,Name]=PolytopeData3(1); 
%[V,A,B,Name]=CubeData(0); 
%-------- Axes ----------------------------------------------------
Ox=[1,0,0,1]; Oy=[0,1,0,1]; Oz=[0,0,1,1]; O =[0,0,0,1];
Oxyz=[O'  Ox'  Oy'  Oz'];
%----------- To shift and scale -----------------------------------
N=size(V,2);                      % number of vertices 
bcp=sum(V,2)/N; bc(1:3)=bcp(1:3); % barycenter
sf=2;
s=sf*[1,1,1];                % scale factors
ST=[ s(1),   0,    0, -bc(1);...
       0, s(2),    0, -bc(2);...
       0,    0, s(3), -bc(3);...
       0,    0,    0,     1];
%----------- To rotate --------------------------------------------
alpha=35; beta=33; gamma=24;
R=Matrix3DRotation(alpha,beta,gamma,O);
%------------ Transformation --------------------------------------
SV=ST*V   % coordinates of vertices after scaling and shifting
T=R*ST;   % The transformation matrix 
TV=T*V    % coordinates after rotation
%------------------------------------------------------------------
arrows=1; points=1; 
cole='r'; colv='k'; r=5; we=3; % color/thickness data 
Title=[Name,' before transformations'];
PlotPolytope3D(V,A,points,arrows,Oxyz,cole,colv,r,we,Title,WS)
hold off
pause
%-------------------------------------------------------------
Title=[Name,' after scaling and shifting'];
PlotPolytope3D(SV,A,points,arrows,Oxyz,cole,colv,r,we,Title,WS)
ShowMatrix3D(ST,11,11);
hold off
pause
%-------------------------------------------------------------
Oxyz=R*Oxyz;   
Title=['After rotation by Euler''s angles \alpha=',int2str(alpha),...
      '^o, \beta=',int2str(beta),'^o, \gamma=',int2str(gamma),'^o'];
PlotPolytope3D(TV,A,points,arrows,Oxyz,cole,colv,r,we,Title,WS)
ShowMatrix3D(T,11,11);
hold off    
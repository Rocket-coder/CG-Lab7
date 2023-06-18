function [F,vf]=FaceVisibility(k,V,B,eyep,bc)
% To state if a face Fk is visible from the viewpoint eyep
%  B - the list of faces of size NFx(1+maxfacesize)
%  V - the list of vertices of size 4xN
% bc - the barycener of the polytope
% The face is visible if vf<=0
%----------------------------------------------------------
L=B(k,1);      % number of vertices in the face Fk
F=zeros(4,L);  % the face Fk
for v=1:L;
    VF=B(k,1+v);
    F(1:4,v)=V(:,VF);
end;  
SF=sum(F');
fc=SF(1:3)/L;  % the coordinates of the center of Fk
fcb=fc-bc;
eyev=fc-eyep;            %printvector('eyev=',eyev);
nv=Normal2Face2(F,fcb);  %printvector('nv=',nv);
vf=eyev*nv';             %printvector('vf=',vf);
end



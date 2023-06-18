function nv=Normal2Face2(F,fcb)
% Normal vector for the face F
% 
v1=F(:,1); v1=v1(1:3);
v2=F(:,2); v2=v2(1:3);
v3=F(:,3); v3=v3(1:3);
v12=v2-v1;
v13=v3-v1;
nv=vecprod(v12,v13);
if fcb*nv'<0; nv=-nv; end;
end


function colors=ColoursList;
% List of RGB-colors
% 
c1=[255,0,0];      % red
c2=[0,255,0];      % green 
c3=[0,0,255];      % blue
c4=c2+c3;          % cyan
c5=c1+c3;          % magenta
c6=c1+c2;          % yellow
c7=[204,204,0];
c8=[255,153,0];
c9=[255,102,0];
c10=[255,0,102];
c11=[255,102,153];
c12=[153,0,204];
c13=[204,153,255];
c14=[102,51,204];
c15=[51,102,255];
c16=[51,204,102];
c17=[0,153,51];
c18=[102,255,0];
c19=[204,204,51];
c20=[204,255,204];
c21=[51,204,204];
c22=[0,153,204];
c23=[102,51,153];
c24=[204,51,204];
c25=[255,0,102];
colors=[ c1; c2; c3; c4; c5; c6; c7; c8; c9;c10;c11;c12;...
        c13;c14;c15;c16;c17;c18;c19;c20;c21;c22;c23;c24;c25];
colors=colors/255;    
end

function PlotFace3D2(F,color)
%
X=F(1,:); Y=F(2,:); Z=F(3,:);
plot3(X, Y, Z,'-ko',... 
              'LineWidth',2,'MarkerEdgeColor','k',...
              'MarkerFaceColor','k','MarkerSize',6);          
hold on 
fill3(X,Y,Z,color);
hold on
end


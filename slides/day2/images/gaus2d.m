figure
plotgaus(0)
figure
plotgaus(0.6)

function plotgaus(corr)
mu = [0 0];

Sigma = [1 corr; corr 1];
x1 = -3:.2:3; x2 = -3:.2:3;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-3 3 -3 3 0 .4])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
hold all
plot3(x1,repmat(-1,1,length(x1)),F(:,x2==-1),'r','LineWidth',3)
if corr == 0
    plot3(repmat(0,1,length(x1)),x2,F(:,x1==0),'g','LineWidth',3)
else
    plot3(repmat(-0.6,1,length(x1)),x2,F(:,13),'g','LineWidth',3)
end
end
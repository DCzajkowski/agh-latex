x = [-6.28:0.1:6.28];
y1 = sin(x);
y2 = sin(x).^2;
y3 = sin(x)./2;
clf;
hold on
plot(x,y1,'r')
plot(x,y2,'b')
plot(x,y3,'k')
axis equal
axis off
plot([-0.2,0.2],[0,0])
plot([0,0],[-0.2,0.2])
print -dfig f1.fig

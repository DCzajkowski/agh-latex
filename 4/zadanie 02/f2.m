x = y = linspace(-8, 8, 41)';
[xx, yy] = meshgrid(x, y);
z = sqrt(xx .^ 2 + yy .^ 2) + eps;
z = sin(z) ./ z;
clf;
mesh(x, y, z)
axis off
print -dfig f2.fig

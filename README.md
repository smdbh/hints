# 通用替换源
```bash
sed -i 's#https\?://[a-zA-Z0-9.]*#https://mirrors.tencentyun.com#g' /etc/apt/sources.list
```



# matlab

## 系统函数画球
```m
% 不懂，画原始球
mind = min( [ x; y; z ]' );
maxd = max( [ x; y; z ]' );
nsteps = 50;
v = V;
step = ( maxd - mind ) / nsteps;
[ x, y, z ] = meshgrid( linspace( mind(1) - step(1), maxd(1) + step(1), nsteps ), linspace( mind(2) - step(2), maxd(2) + step(2), nsteps ), linspace( mind(3) - step(3), maxd(3) + step(3), nsteps ) );
Ellipsoid = v(1) *x.*x +   v(2) * y.*y + v(3) * z.*z + ...
          2*v(4) *x.*y + 2*v(5)*x.*z + 2*v(6) * y.*z + ...
          2*v(7) *x    + 2*v(8)*y    + 2*v(9) * z;
p = patch( isosurface( x, y, z, Ellipsoid, -v(10) ) );
set( p, 'FaceColor', 'g', 'EdgeColor', 'none' );
alpha(p, 0.5); % 设置透明度为 0.5
```

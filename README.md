# 通用替换源
```bash
sed -i 's#https\?://[a-zA-Z0-9.]*#https://mirrors.tencentyun.com#g' /etc/apt/sources.list
```

# git no ssl
```bash
export GIT_SSL_NO_VERIFY=1
git config http.sslVerify false
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

## C
```

#ifndef MIN
#define MIN(a, b)           (((a) < (b))?(a) : (b))
#endif /* MIN */

#ifndef MAX
#define MAX(a, b)           (((a) > (b))?(a) : (b))
#endif /* MAX */

#ifndef ARRAY_SZ
#define ARRAY_SZ(arr)       (sizeof(arr) / sizeof((arr)[0]))
#endif

#ifdef __LITTLE_ENDIAN__
#define BE16(x) \
    (uint16_t)((((uint16_t)(x) & 0x00ff) << 8) | \
              (((uint16_t)(x) & 0xff00) >> 8) )

#define BE32(x) \
    (uint32_t)((((uint32_t)(x) & 0xFF000000) >> 24) | \
              (((uint32_t)(x) & 0x00FF0000) >> 8) | \
              (((uint32_t)(x) & 0x0000FF00) << 8) | \
              (((uint32_t)(x) & 0x000000FF) << 24))
#else
#define BE16(x) (x)
#define BE32(x) (x)
#endif


#define SET_BITS(value, bits)               ((value) |= (bits))
#define CLEAR_BITS(value, bits)             ((value) &= ~(bits))
#define CHECK_BITS(value, bits)             (((value) & (bits)) > 0 ? 1 : 0)



```

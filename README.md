
# scrcpy
 (https://github.com/Genymobile/scrcpy)
```
scrcpy --video-codec=h265 --max-size=1920 --max-fps=60 --no-audio --keyboard=uhid
scrcpy --video-source=camera --camera-size=1920x1080 --camera-facing=front --v4l2-sink=/dev/video2 --no-playback
scrcpy --gamepad=uhid

```

# 配置安装

```bash
curl https://raw.githubusercontent.com/smdbh/hints/refs/heads/main/arch_init.sh | bash

wget -qO- https://raw.githubusercontent.com/smdbh/hints/refs/heads/main/ubuntu_init.sh | bash
```

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

## 动画
 data 是个fifo, 画图每次都是重新配置
```m
for i = 1:2000
    d = i/100;
    d = complex( cos(d), sin(d));

    data = [data(2:end), d];   % a queue
    
    hold on;
    xlim([-3 3]);  % for right turn
    ylim([-3 3]);
    axis on;
    grid on;
    plot(real(data),imag(data),'red');

    drawnow limitrate;
    hold off;
    clf;

end

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


#define REG_RD16(addr) (*(volatile uint16_t *)(addr))
#define REG_RD32(addr) (*(volatile uint32_t *)(addr))

#define REG_WR16(addr, val)  (*(uint16_t *)(addr) = (val))
#define REG_WR32(addr, val)  (*(uint32_t *)(addr) = (val))




#define SET_BITS(value, bits)               ((value) |= (bits))
#define CLEAR_BITS(value, bits)             ((value) &= ~(bits))
#define CHECK_BITS(value, bits)             (((value) & (bits)) > 0 ? 1 : 0)



```


# C++
读取时间
```
uint64_t get_ms(void)
{
    return std::chrono::duration_cast<std::chrono::milliseconds>(
        std::chrono::system_clock::now().time_since_epoch()
        ).count();
}

```
# vbmp

Read and write bitmap files with in the [V programming language](https://vlang.io).

### Installation
```
v install https://github.com/dy-tea/vbmp.git
```

### Usage
```v
import bmp

const width := 1920
const height := 1080

fn main() {
    mut bitmap := bmp.new(width, height)

    for i in 0..width {
        for j in 0..height {
            bitmap.set_pixel(i, j, 255, 0, 0) or { panic('pixel is out of bounds of image') }
        }
    }

    bitmap.write('out.bmp') or { panic('could not write file') }
}

```


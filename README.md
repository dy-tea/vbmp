# vbmp

Read and write bitmap files with the [V programming language](https://vlang.io).
See the docs [here](https://dy-tea.github.io/vbmp/).

### Installation
```
v install dy-tea.vbmp
```

### Usage
```v
import vbmp

const width := 1920
const height := 1080

fn main() {
    mut bitmap := vbmp.new(width, height)

    for i in 0..width {
        for j in 0..height {
            bitmap.set_pixel(i, j, 255, 0, 0) or { panic('pixel is out of bounds of image') }
        }
    }

    bitmap.write('out.bmp') or { panic('could not write file') }
}

```


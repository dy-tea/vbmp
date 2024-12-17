import vbmp

import math.complex

const width := 4096
const height := 2160

const max_iters := 1000

fn get_iters(x f64, y f64) int {
	mut z := complex.complex(0, 0)
	c := complex.complex(x, y)

	for i in 0..max_iters {
		z = z * z + c;

		if z.abs() > 2 {
			return i
		}
	}

	return -1
}

fn main() {
	mut bitmap := vbmp.new(width, height)

	for y in 0..height {
		for x in 0..width {
			fx := (x - width / 2.0) * 2.0 / width
			fy := (y - width / 2.0) * 2.0 / width;
			iters := get_iters(fx, fy)

			g := u8(256 * f64(iters) / max_iters)

			bitmap.set_pixel(x, y, g, g, g)!
		}
	}

	bitmap.write('fractal.bmp')!
}

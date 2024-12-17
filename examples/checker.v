import vbmp

const width = 1920
const height = 1080

fn main() {
	mut bitmap := vbmp.new(width, height)

	for x in 0 .. width {
		for y in 0 .. height {
			bitmap.set_pixel(x, y, (x - y) % 255, (x + y) % 255, (x * y) % 255)!
		}
	}

	bitmap.write('checker.bmp')!
}

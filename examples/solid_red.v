import vbmp

const size := 800

fn main() {
	mut image := vbmp.new(size, size)

	for i in 0..size {
		for j in 0..size {
			image.set_pixel(i, j, 255, 0, 0)!
		}
	}

	image.write('red.bmp')!
}

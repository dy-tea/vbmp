module bmp

const file_name := 'out.bmp'
const width := 1920
const height := 1080

fn test_write() {
	mut b := new(width, height)

	for i in 0 .. width {
		for j in 0 .. height {
			b.set_pixel(i, j, (i - j) % 255, (i + j) % 255, (i * j) % 255)!
		}
	}

	b.write(file_name)!
}

fn test_read_write() {
	mut b := read(file_name)!

	assert b.width == width
	assert b.height == height

	b.write('out2.bmp')!
}

module bmp

fn test_bmp() {
	width := 1920
	height := 1080

	mut b := new(width, height)

	for i in 0 .. width {
		for j in 0 .. height {
			b.set_pixel(i, j, (i - j) % 255, (i + j) % 255, (i * j) % 255)!
		}
	}

	b.write('out.bmp')!
}

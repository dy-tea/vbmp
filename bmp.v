module bmp

import os

@[packed]
struct FileHeader {
	h1       u8 = 66
	h2       u8 = 77
	size     int
	reserved int
	offset   int
}

@[packed]
struct InfoHeader {
	size        int = 40
	width       int
	height      int
	planes      i16 = 1
	bits_pp     i16 = 24
	compression int
	h_res       int = 2400
	v_res       int = 2400
	colors      int
	imp_colors  int
}

struct Bitmap {
	width  int
	height int
mut:
	pixels []u8
}

// create a new bitmap
pub fn new(width int, height int) Bitmap {
	return Bitmap{
		width:  width
		height: height
		pixels: []u8{len: width * height * 3, cap: width * height * 3, init: 0}
	}
}

// set a pixel of the bitmap to a given color
pub fn (mut bp Bitmap) set_pixel(x u32, y u32, r u8, g u8, b u8) ! {
	offset := int(y) * bp.width * 3 + int(x) * 3

	if offset + 2 < bp.width * bp.height * 3 {
		bp.pixels[offset] = b
		bp.pixels[offset + 1] = g
		bp.pixels[offset + 2] = r
	} else {
		return error('Pixel at (${x}, ${y}) is out of bounds for Bitmap of size ${bp.width}x${bp.height}')
	}
}

// write bitmap to file
pub fn (bp Bitmap) write(path string) ! {
	mut file := os.open_file(path, 'wb')!

	fh := FileHeader{
		size:   int(sizeof(FileHeader)) + int(sizeof(InfoHeader)) + bp.width * bp.height * 3
		offset: int(sizeof(FileHeader) + sizeof(InfoHeader))
	}

	ih := InfoHeader{
		width:  bp.width
		height: bp.height
	}

	file.write_struct(fh)!
	file.write_struct(ih)!
	file.write(bp.pixels)!
}

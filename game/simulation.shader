shader_type canvas_item;

void fragment() {
	vec2 s = TEXTURE_PIXEL_SIZE;
	
	float tl = texture(TEXTURE, UV + vec2(-s.x, -s.y)).r;
	float cl = texture(TEXTURE, UV + vec2(-s.x, 0)).r;
	float bl = texture(TEXTURE, UV + vec2(-s.x, s.y)).r;
	
	float tc = texture(TEXTURE, UV + vec2(0, -s.y)).r;
	float cc = texture(TEXTURE, UV + vec2(0, 0)).r;
	float bc = texture(TEXTURE, UV + vec2(0, s.y)).r;
	
	float tr = texture(TEXTURE, UV + vec2(s.x, -s.y)).r;
	float cr = texture(TEXTURE, UV + vec2(s.x, 0)).r;
	float br = texture(TEXTURE, UV + vec2(s.x, s.y)).r;
	
	int count = int(tl) + int(cl) + int(bl) + int(tc) + int(bc) + int(tr) + int(cr) + int(br);
	
	// Stay
	vec4 output = vec4(cc, cc, cc, 1.0);
	
	// Death
	if (count < 2 || count > 3)
		output = vec4(cc - 0.1, cc - 0.1, cc - 0.1, 1); // Some fading
	
	// Life
	if (count == 3)
		output = vec4(1, 1, 1, 1);
	
	COLOR = output;
}

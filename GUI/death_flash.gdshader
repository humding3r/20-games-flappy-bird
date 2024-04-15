shader_type canvas_item;

uniform float opacity: hint_range(0.0, 1.0, 0.001);

void fragment() {
	COLOR = mix(vec4(1.0, 1.0, 1.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), opacity);
}

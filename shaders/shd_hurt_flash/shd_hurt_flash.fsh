varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_flash;

void main() {
    vec4 col = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    vec3 hurt_col = vec3(1.0, 0.15, 0.15);

    col.rgb = mix(col.rgb, hurt_col, u_flash);

    gl_FragColor = col;
}
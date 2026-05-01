varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_amount;
uniform vec3 u_effect_col;

void main() {
    vec4 col = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    col.rgb = mix(col.rgb, u_effect_col, u_amount);

    gl_FragColor = col;
}
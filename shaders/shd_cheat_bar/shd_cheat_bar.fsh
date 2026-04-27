varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform vec3 u_col1;
uniform vec3 u_col2;

void main() {
    vec4 col = v_vColour;

    float wave = sin((v_vTexcoord.x * 12.0) + u_time) * 0.5 + 0.5;

    vec3 final_col = mix(u_col1, u_col2, wave);

    float shine = smoothstep(0.45, 0.5, wave) * 0.35;

    col.rgb = final_col + shine;
    col.a = v_vColour.a;

    gl_FragColor = col;
}
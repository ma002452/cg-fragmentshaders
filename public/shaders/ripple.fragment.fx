#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    vec2 distorted_uv = model_uv * 2.0 - 1.0;
    float radius = length(distorted_uv);
    vec2 offset_uv = distorted_uv * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;
    vec2 final_uv = model_uv + offset_uv;

    // Color
    FragColor = texture(image, final_uv);
}

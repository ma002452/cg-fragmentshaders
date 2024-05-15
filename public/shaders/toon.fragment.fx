#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    FragColor = vec4((round(texture(image, model_uv).r * 4.0)) / 4.0,
                     (round(texture(image, model_uv).g * 4.0)) / 4.0,
                     (round(texture(image, model_uv).b * 4.0)) / 4.0,
                     1.0);
}

#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Luminance calculation
    float Luminance = 0.299 * texture(image, model_uv).r + 0.587 * texture(image, model_uv).g + 0.114 * texture(image, model_uv).b;

    // Color
    FragColor = vec4(Luminance, Luminance, Luminance, 1.0);
}

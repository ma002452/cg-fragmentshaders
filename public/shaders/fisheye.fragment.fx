#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    vec2 distorted_uv = model_uv * 2.0 - 1.0;
    float theta = atan(distorted_uv.y, distorted_uv.x);
    float radius = pow(length(distorted_uv), 1.5);
    vec2 fisheye_uv = vec2(radius * cos(theta), radius * sin(theta));
    vec2 final_uv = 0.5 * (fisheye_uv + 1.0);

    // Color
    FragColor = texture(image, final_uv);
}

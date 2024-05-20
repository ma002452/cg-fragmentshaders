#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

// Gaussian blur
vec4 blur(sampler2D img, vec2 uv) {
    float offset = 1.0; // the amount to blur
    vec4 color = vec4(0.0); // RGBA sum
    
    color += texture(img, uv + vec2(-offset, -offset));
    color += texture(img, uv + vec2( 0.0, -offset));
    color += texture(img, uv + vec2( offset, -offset));
    
    color += texture(img, uv + vec2(-offset,  0.0));
    color += texture(img, uv + vec2( 0.0,  0.0));
    color += texture(img, uv + vec2( offset,  0.0));
    
    color += texture(img, uv + vec2(-offset,  offset));
    color += texture(img, uv + vec2( 0.0,  offset));
    color += texture(img, uv + vec2( offset,  offset));
    
    return color;
}

void main() {
    // original texture
    vec4 originalColor = texture(image, model_uv);
    
    // make colors of areas beyond the threshold brighter
    vec4 brightColor = max(originalColor - vec4(0.5), 0.0) * 3.0;
    
    // Gaussian blur
    vec4 blurredColor = blur(image, model_uv);
    
    FragColor = originalColor + brightColor * blurredColor;
}

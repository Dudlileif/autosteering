#version 460 core

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform vec4 uColor;

out vec4 fragColor;

void main() {
  vec2 pixel = FlutterFragCoord() / uSize;

  pixel -= 0.5; // Center

  float d = length(pixel) - 0.4; // signed distance function

  vec3 col = vec3(step(0., -d));

  col += clamp(vec3(0.005 / d), 0., 1.) * 12.; // add glow

  col *= uColor.rgb;

  col = clamp(col, 0, 0.4) * 2;

  fragColor = vec4(col, step(0., -0.1));

}
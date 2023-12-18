#version 120

varying vec2 texCoord;

uniform sampler2D gcolor; // tex
uniform sampler2D gaux4; // prev

const bool gaux4Clear = false; // non-clearing buffer

void main() {
    /* DRAWBUFFERS:70 */
    gl_FragData[0] = texture2D(gcolor, texCoord);
    gl_FragData[1] = texture2D(gaux4, texCoord);
}
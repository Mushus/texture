#define PI 3.141592653589793

uniform vec2 size;
uniform vec2 stars[500];
uniform vec3 starPower[500];
int starNum = 500;

void main() {
    vec2 uv = gl_FragCoord.xy / size;
    vec3 color = vec3(0, 0, 0);
    for (int i = 0; i < starNum; i++) {
        vec2 star = stars[i];
        float scrXZDist = sin(uv.y * PI);
        vec3 scrPos = vec3(
            cos(uv.y * PI),
            scrXZDist * sin(uv.x * PI),
            scrXZDist * cos(uv.x * PI));
        float starXZDist = sin(star.y * PI);
        vec3 starPos = vec3(
            cos(star.y * PI),
            starXZDist * sin(star.x * PI),
            starXZDist * cos(star.x * PI));
        float dist = distance(scrPos, starPos);
        color += starPower[i] / (dist * dist) * 0.0001;
        color += starPower[i] / dist * 0.001;
    }
    gl_FragColor = vec4(color.r, color.g, color.b, 1);
}

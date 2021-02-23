#version 330 compatibility

out vec4 near;
out vec4 far;

void main()
{
	// set final vertex position
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;

	// 2d projection of vertex
	vec2 position = gl_Position.xy / gl_Position.w;

	// set clip planes, used to calculate intial ray in fragment shader
	near = inverse(gl_ModelViewProjectionMatrix) * (vec4(position, -1.0, 1.0));
	far = inverse(gl_ModelViewProjectionMatrix) * (vec4(position, 1.0, 1.0));
}
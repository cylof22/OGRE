#version 400 core

#extension GL_ARB_tessellation_shader: enable

// Tessellation Evaluation Shader (Domain Shader in HLSL)
uniform mat4 g_mViewProjection;

layout(quads, equal_spacing, cw) in;

in gl_PerVertex
{
    vec4 gl_Position;
} gl_in[];

out gl_PerVertex
{
    vec4 gl_Position;
};

void main()
{
	// Baricentric interpolation
	vec4 finalPos = (gl_TessCoord.x * gl_in[0].gl_Position) + (gl_TessCoord.y * gl_in[1].gl_Position) + (gl_TessCoord.z * gl_in[2].gl_Position);
    gl_Position = vec4(finalPos.xyz, 1.0) * g_mViewProjection;
}

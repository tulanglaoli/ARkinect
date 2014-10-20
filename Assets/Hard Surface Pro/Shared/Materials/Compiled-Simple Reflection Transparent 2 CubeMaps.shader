Shader "AboutCG 101/Reflective Transparent/Simple Reflection Transparent 2 CubeMaps" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _CubeMapLerp ("CubeMap Lerp", Range(0,1)) = 0
 _Cube ("Cubemap 1", CUBE) = "" {}
 _Cube_01 ("Cubemap 2", CUBE) = "" {}
 _Reflection ("Reflection", Float) = 1
 _Alpha ("Alpha", Float) = 1
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [_MainTex_ST]
"!!ARBvp1.0
# 39 ALU
PARAM c[23] = { { 1 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, vertex.normal, c[13].w;
DP3 R3.w, R0, c[6];
DP3 R2.w, R0, c[7];
DP3 R1.w, R0, c[5];
MOV R1.x, R3.w;
MOV R1.y, R2.w;
MOV R1.z, c[0].x;
MUL R0, R1.wxyy, R1.xyyw;
DP4 R2.z, R1.wxyz, c[17];
DP4 R2.y, R1.wxyz, c[16];
DP4 R2.x, R1.wxyz, c[15];
DP4 R1.z, R0, c[20];
DP4 R1.y, R0, c[19];
DP4 R1.x, R0, c[18];
MUL R3.x, R3.w, R3.w;
MOV R0.w, c[0].x;
MAD R0.x, R1.w, R1.w, -R3;
ADD R1.xyz, R2, R1;
MUL R2.xyz, R0.x, c[21];
MOV R0.xyz, c[14];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
DP3 R0.w, vertex.normal, vertex.normal;
RSQ R0.w, R0.w;
MAD R0.xyz, R3, c[13].w, -vertex.position;
ADD result.texcoord[4].xyz, R1, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
MUL result.texcoord[2].xyz, R1.x, R0;
MUL result.texcoord[1].xyz, R0.w, vertex.normal;
MOV result.texcoord[3].z, R2.w;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R1.w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 39 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [_MainTex_ST]
"vs_2_0
; 39 ALU
def c22, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1, c12.w
dp3 r3.w, r0, c5
dp3 r2.w, r0, c6
dp3 r1.w, r0, c4
mov r1.x, r3.w
mov r1.y, r2.w
mov r1.z, c22.x
mul r0, r1.wxyy, r1.xyyw
dp4 r2.z, r1.wxyz, c16
dp4 r2.y, r1.wxyz, c15
dp4 r2.x, r1.wxyz, c14
dp4 r1.z, r0, c19
dp4 r1.y, r0, c18
dp4 r1.x, r0, c17
mul r3.x, r3.w, r3.w
mov r0.w, c22.x
mad r0.x, r1.w, r1.w, -r3
add r1.xyz, r2, r1
mul r2.xyz, r0.x, c20
mov r0.xyz, c13
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
dp3 r0.w, v1, v1
rsq r0.w, r0.w
mad r0.xyz, r3, c12.w, -v0
add oT4.xyz, r1, r2
dp3 r1.x, r0, r0
rsq r1.x, r1.x
mul oT2.xyz, r1.x, r0
mul oT1.xyz, r0.w, v1
mov oT3.z, r2.w
mov oT3.y, r3.w
mov oT3.x, r1.w
mad oT0.xy, v2, c21, c21.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_World2Object]
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
# 18 ALU
PARAM c[17] = { { 1 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
DP3 R0.w, vertex.normal, vertex.normal;
RSQ R0.w, R0.w;
MOV R1.xyz, c[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[13].w, -vertex.position;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
MUL result.texcoord[2].xyz, R1.x, R0;
MUL result.texcoord[1].xyz, R0.w, vertex.normal;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
"vs_2_0
; 18 ALU
def c16, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
dp3 r0.w, v1, v1
rsq r0.w, r0.w
mov r1.xyz, c13
mov r1.w, c16.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c12.w, -v0
dp3 r1.x, r0, r0
rsq r1.x, r1.x
mul oT2.xyz, r1.x, r0
mul oT1.xyz, r0.w, v1
mad oT0.xy, v2, c15, c15.zwzw
mad oT4.xy, v3, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [_MainTex_ST]
"!!ARBvp1.0
# 69 ALU
PARAM c[31] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..30] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[13].w;
DP3 R4.x, R3, c[5];
DP3 R3.w, R3, c[6];
DP3 R3.x, R3, c[7];
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[16];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[15];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MOV R4.w, c[0].x;
MAD R2, R4.x, R0, R2;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[17];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[18];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[25];
DP4 R2.y, R4, c[24];
DP4 R2.x, R4, c[23];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R4.w, R0, c[28];
DP4 R4.z, R0, c[27];
DP4 R4.y, R0, c[26];
MAD R1.w, R4.x, R4.x, -R1;
ADD R2.xyz, R2, R4.yzww;
MUL R0.xyz, R1.w, c[29];
ADD R2.xyz, R2, R0;
MOV R0.w, c[0].x;
MOV R0.xyz, c[14];
DP4 R4.w, R0, c[11];
DP4 R4.y, R0, c[9];
DP4 R4.z, R0, c[10];
DP3 R0.w, vertex.normal, vertex.normal;
RSQ R0.w, R0.w;
MAD R0.xyz, R4.yzww, c[13].w, -vertex.position;
ADD result.texcoord[4].xyz, R2, R1;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
MUL result.texcoord[2].xyz, R1.x, R0;
MUL result.texcoord[1].xyz, R0.w, vertex.normal;
MOV result.texcoord[3].z, R3.x;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[30], c[30].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 69 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_4LightPosX0]
Vector 15 [unity_4LightPosY0]
Vector 16 [unity_4LightPosZ0]
Vector 17 [unity_4LightAtten0]
Vector 18 [unity_LightColor0]
Vector 19 [unity_LightColor1]
Vector 20 [unity_LightColor2]
Vector 21 [unity_LightColor3]
Vector 22 [unity_SHAr]
Vector 23 [unity_SHAg]
Vector 24 [unity_SHAb]
Vector 25 [unity_SHBr]
Vector 26 [unity_SHBg]
Vector 27 [unity_SHBb]
Vector 28 [unity_SHC]
Vector 29 [_MainTex_ST]
"vs_2_0
; 69 ALU
def c30, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r3.xyz, v1, c12.w
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp3 r3.x, r3, c6
dp4 r0.x, v0, c5
add r1, -r0.x, c15
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c14
mul r1, r1, r1
mov r4.z, r3.x
mov r4.w, c30.x
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c16
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c17
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c30.x
dp4 r2.z, r4, c24
dp4 r2.y, r4, c23
dp4 r2.x, r4, c22
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c30.y
mul r0, r0, r1
mul r1.xyz, r0.y, c19
mad r1.xyz, r0.x, c18, r1
mad r0.xyz, r0.z, c20, r1
mad r1.xyz, r0.w, c21, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r4.w, r0, c27
dp4 r4.z, r0, c26
dp4 r4.y, r0, c25
mad r1.w, r4.x, r4.x, -r1
add r2.xyz, r2, r4.yzww
mul r0.xyz, r1.w, c28
add r2.xyz, r2, r0
mov r0.w, c30.x
mov r0.xyz, c13
dp4 r4.w, r0, c10
dp4 r4.y, r0, c8
dp4 r4.z, r0, c9
dp3 r0.w, v1, v1
rsq r0.w, r0.w
mad r0.xyz, r4.yzww, c12.w, -v0
add oT4.xyz, r2, r1
dp3 r1.x, r0, r0
rsq r1.x, r1.x
mul oT2.xyz, r1.x, r0
mul oT1.xyz, r0.w, v1
mov oT3.z, r3.x
mov oT3.y, r3.w
mov oT3.x, r4
mad oT0.xy, v2, c29, c29.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_CubeMapLerp]
Float 4 [_Reflection]
Float 5 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_Cube_01] CUBE
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 19 ALU, 3 TEX
PARAM c[7] = { program.local[0..5],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
MOV R0.xyz, fragment.texcoord[2];
DP3 R0.x, fragment.texcoord[1], R0;
MUL R0.xyz, fragment.texcoord[1], R0.x;
MAD R2.xyz, -R0, c[6].y, fragment.texcoord[2];
DP3 R0.w, fragment.texcoord[3], c[0];
MAX R0.w, R0, c[6].x;
MUL R1.xyz, R1, c[2];
MUL R0.w, R0, c[6].y;
MOV result.color.w, c[5].x;
TEX R0.xyz, -R2, texture[1], CUBE;
TEX R2.xyz, -R2, texture[2], CUBE;
ADD R3.xyz, R2, -R0;
MUL R2.xyz, R1, fragment.texcoord[4];
MUL R1.xyz, R1, c[1];
MUL R1.xyz, R1, R0.w;
ADD R1.xyz, R1, R2;
MAD R0.xyz, R3, c[3].x, R0;
MAD result.color.xyz, R0, c[4].x, R1;
END
# 19 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_CubeMapLerp]
Float 4 [_Reflection]
Float 5 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_Cube_01] CUBE
"ps_2_0
; 19 ALU, 3 TEX
dcl_2d s0
dcl_cube s1
dcl_cube s2
def c6, 2.00000000, 0.00000000, 0, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
texld r2, t0, s0
mov r0.xyz, t2
dp3 r0.x, t1, r0
mul r0.xyz, t1, r0.x
mad r1.xyz, -r0, c6.x, t2
mov r0.xyz, -r1
mov r1.xyz, -r1
mul r2.xyz, r2, c2
mul r4.xyz, r2, t4
mul r2.xyz, r2, c1
texld r0, r0, s2
texld r1, r1, s1
add r3.xyz, r0, -r1
dp3_pp r0.x, t3, c0
max_pp r0.x, r0, c6.y
mul_pp r0.x, r0, c6
mul r0.xyz, r2, r0.x
add_pp r0.xyz, r0, r4
mad r1.xyz, r3, c3.x, r1
mad_pp r0.xyz, r1, c4.x, r0
mov_pp r0.w, c5.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
Vector 0 [_Color]
Float 1 [_CubeMapLerp]
Float 2 [_Reflection]
Float 3 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_Cube_01] CUBE
SetTexture 3 [unity_Lightmap] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 16 ALU, 4 TEX
PARAM c[5] = { program.local[0..3],
		{ 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
MOV R0.xyz, fragment.texcoord[2];
DP3 R0.x, fragment.texcoord[1], R0;
MUL R0.xyz, fragment.texcoord[1], R0.x;
MAD R3.xyz, -R0, c[4].y, fragment.texcoord[2];
MUL R1.xyz, R1, c[0];
MOV result.color.w, c[3].x;
TEX R2.xyz, -R3, texture[1], CUBE;
TEX R0, fragment.texcoord[4], texture[3], 2D;
TEX R3.xyz, -R3, texture[2], CUBE;
ADD R3.xyz, R3, -R2;
MAD R2.xyz, R3, c[1].x, R2;
MUL R0.xyz, R0.w, R0;
MUL R2.xyz, R2, c[2].x;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[4].x, R2;
END
# 16 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
Vector 0 [_Color]
Float 1 [_CubeMapLerp]
Float 2 [_Reflection]
Float 3 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_Cube_01] CUBE
SetTexture 3 [unity_Lightmap] 2D
"ps_2_0
; 15 ALU, 4 TEX
dcl_2d s0
dcl_cube s1
dcl_cube s2
dcl_2d s3
def c4, 2.00000000, 8.00000000, 0, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t4.xy
texld r3, t0, s0
mov r0.xyz, t2
dp3 r0.x, t1, r0
mul r0.xyz, t1, r0.x
mad r0.xyz, -r0, c4.x, t2
mov r1.xyz, -r0
mov r2.xyz, -r0
texld r0, t4, s3
texld r2, r2, s1
texld r1, r1, s2
mul_pp r0.xyz, r0.w, r0
add r1.xyz, r1, -r2
mad r1.xyz, r1, c1.x, r2
mul r2.xyz, r3, c0
mul_pp r1.xyz, r1, c2.x
mul_pp r0.xyz, r0, r2
mad_pp r0.xyz, r0, c4.y, r1
mov_pp r0.w, c3.x
mov_pp oC0, r0
"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha One
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
# 29 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[17].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[2].xyz, R0.w, R0;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 R1.x, vertex.normal, vertex.normal;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
RSQ R0.w, R1.x;
MUL R1.xyz, vertex.normal, c[17].w;
MUL result.texcoord[1].xyz, R0.w, vertex.normal;
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [_MainTex_ST]
"vs_2_0
; 29 ALU
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c17
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c16.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul oT2.xyz, r0.w, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.x, v1, v1
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
rsq r0.w, r1.x
mul r1.xyz, v1, c16.w
mul oT1.xyz, r0.w, v1
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
add oT4.xyz, -r0, c18
mad oT0.xy, v2, c19, c19.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
# 22 ALU
PARAM c[17] = { { 1 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[13].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R1.x, R0.w;
MUL result.texcoord[2].xyz, R1.x, R0;
MUL R1.xyz, vertex.normal, c[13].w;
DP3 R0.w, vertex.normal, vertex.normal;
RSQ R0.x, R0.w;
MUL result.texcoord[1].xyz, R0.x, vertex.normal;
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
MOV result.texcoord[4].xyz, c[15];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [_MainTex_ST]
"vs_2_0
; 22 ALU
def c16, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c13
mov r1.w, c16.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c12.w, -v0
dp3 r0.w, r0, r0
rsq r1.x, r0.w
mul oT2.xyz, r1.x, r0
mul r1.xyz, v1, c12.w
dp3 r0.w, v1, v1
rsq r0.x, r0.w
mul oT1.xyz, r0.x, v1
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
mov oT4.xyz, c14
mad oT0.xy, v2, c15, c15.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
# 30 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[17].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[2].xyz, R0.w, R0;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 R1.x, vertex.normal, vertex.normal;
DP4 result.texcoord[5].w, R0, c[16];
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
RSQ R0.w, R1.x;
MUL R1.xyz, vertex.normal, c[17].w;
MUL result.texcoord[1].xyz, R0.w, vertex.normal;
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 30 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [_MainTex_ST]
"vs_2_0
; 30 ALU
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c17
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c16.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul oT2.xyz, r0.w, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.x, v1, v1
dp4 oT5.w, r0, c15
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
rsq r0.w, r1.x
mul r1.xyz, v1, c16.w
mul oT1.xyz, r0.w, v1
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
add oT4.xyz, -r0, c18
mad oT0.xy, v2, c19, c19.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
# 29 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[17].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[2].xyz, R0.w, R0;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 R1.x, vertex.normal, vertex.normal;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
RSQ R0.w, R1.x;
MUL R1.xyz, vertex.normal, c[17].w;
MUL result.texcoord[1].xyz, R0.w, vertex.normal;
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [_MainTex_ST]
"vs_2_0
; 29 ALU
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c17
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c16.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul oT2.xyz, r0.w, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.x, v1, v1
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
rsq r0.w, r1.x
mul r1.xyz, v1, c16.w
mul oT1.xyz, r0.w, v1
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
add oT4.xyz, -r0, c18
mad oT0.xy, v2, c19, c19.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
# 28 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[17].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[2].xyz, R0.w, R0;
DP4 R0.x, vertex.position, c[5];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.y, vertex.position, c[6];
DP3 R1.x, vertex.normal, vertex.normal;
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
RSQ R0.x, R1.x;
MUL R1.xyz, vertex.normal, c[17].w;
MUL result.texcoord[1].xyz, R0.x, vertex.normal;
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
MOV result.texcoord[4].xyz, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [_MainTex_ST]
"vs_2_0
; 28 ALU
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c17
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c16.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul oT2.xyz, r0.w, r0
dp4 r0.x, v0, c4
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
dp3 r1.x, v1, v1
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
rsq r0.x, r1.x
mul r1.xyz, v1, c16.w
mul oT1.xyz, r0.x, v1
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
mov oT4.xyz, c18
mad oT0.xy, v2, c19, c19.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 14 ALU, 2 TEX
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[1];
MAX R1.x, R1, c[3];
MUL R0.xyz, R0, c[0];
MOV result.color.w, c[2].x;
TEX R0.w, R0.w, texture[3], 2D;
MUL R0.w, R1.x, R0;
MUL R0.w, R0, c[3].y;
MUL result.color.xyz, R0, R0.w;
END
# 14 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"ps_2_0
; 14 ALU, 2 TEX
dcl_2d s0
dcl_cube s1
dcl_cube s2
dcl_2d s3
def c3, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r1, t0, s0
dp3 r0.x, t5, t5
mov r0.xy, r0.x
mul r1.xyz, r1, c1
mul r1.xyz, r1, c0
mov_pp r0.w, c2.x
texld r2, r0, s3
dp3_pp r0.x, t4, t4
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t4
dp3_pp r0.x, t3, r0
max_pp r0.x, r0, c3
mul_pp r0.x, r0, r2
mul_pp r0.x, r0, c3.y
mul r0.xyz, r1, r0.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Alpha]
SetTexture 0 [_MainTex] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 9 ALU, 1 TEX
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, fragment.texcoord[4];
DP3 R0.w, fragment.texcoord[3], R1;
MAX R0.w, R0, c[3].x;
MUL R0.xyz, R0, c[1];
MUL R0.w, R0, c[3].y;
MUL R0.xyz, R0, c[0];
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].x;
END
# 9 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Alpha]
SetTexture 0 [_MainTex] 2D
"ps_2_0
; 9 ALU, 1 TEX
dcl_2d s0
dcl_cube s1
dcl_cube s2
def c3, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
texld r1, t0, s0
mov_pp r0.xyz, t4
dp3_pp r0.x, t3, r0
max_pp r0.x, r0, c3
mul r1.xyz, r1, c1
mul_pp r0.x, r0, c3.y
mul r1.xyz, r1, c0
mul r0.xyz, r1, r0.x
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_LightTextureB0] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 20 ALU, 3 TEX
PARAM c[4] = { program.local[0..2],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
RCP R0.x, fragment.texcoord[5].w;
MAD R1.xy, fragment.texcoord[5], R0.x, c[3].y;
DP3 R1.z, fragment.texcoord[5], fragment.texcoord[5];
MOV result.color.w, c[2].x;
TEX R0.w, R1, texture[3], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, R1.z, texture[4], 2D;
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[3], R1;
SLT R1.y, c[3].x, fragment.texcoord[5].z;
MUL R0.w, R1.y, R0;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[3].x;
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0, c[1];
MUL R0.w, R0, c[3].z;
MUL R0.xyz, R0, c[0];
MUL result.color.xyz, R0, R0.w;
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_LightTextureB0] 2D
"ps_2_0
; 19 ALU, 3 TEX
dcl_2d s0
dcl_cube s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
def c3, 0.50000000, 0.00000000, 1.00000000, 2.00000000
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5
texld r2, t0, s0
dp3 r1.x, t5, t5
mov r1.xy, r1.x
rcp r0.x, t5.w
mad r0.xy, t5, r0.x, c3.x
texld r3, r1, s4
texld r0, r0, s3
dp3_pp r1.x, t4, t4
cmp r0.x, -t5.z, c3.y, c3.z
mul r0.x, r0, r0.w
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t4
dp3_pp r1.x, t3, r1
max_pp r1.x, r1, c3.y
mul r0.x, r0, r3
mul_pp r0.x, r1, r0
mul r1.xyz, r2, c1
mul_pp r0.x, r0, c3.w
mul r1.xyz, r1, c0
mul r0.xyz, r1, r0.x
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 3 [_LightTextureB0] 2D
SetTexture 4 [_LightTexture0] CUBE
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 16 ALU, 3 TEX
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[5], texture[4], CUBE;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[4];
MUL R0.xyz, R0, c[1];
DP3 R1.x, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[0];
MOV result.color.w, c[2].x;
TEX R0.w, R0.w, texture[3], 2D;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[3].x;
MUL R0.w, R0, R1.y;
MUL R0.w, R0, c[3].y;
MUL result.color.xyz, R0, R0.w;
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 3 [_LightTextureB0] 2D
SetTexture 4 [_LightTexture0] CUBE
"ps_2_0
; 15 ALU, 3 TEX
dcl_2d s0
dcl_cube s1
dcl_cube s2
dcl_2d s3
dcl_cube s4
def c3, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r1, t0, s0
dp3 r0.x, t5, t5
mov r2.xy, r0.x
mul r1.xyz, r1, c1
mul r1.xyz, r1, c0
texld r0, t5, s4
texld r2, r2, s3
dp3_pp r0.x, t4, t4
rsq_pp r0.x, r0.x
mul_pp r3.xyz, r0.x, t4
mul r0.x, r2, r0.w
dp3_pp r2.x, t3, r3
max_pp r2.x, r2, c3
mul_pp r0.x, r2, r0
mul_pp r0.x, r0, c3.y
mul r0.xyz, r1, r0.x
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 11 ALU, 2 TEX
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0.w, fragment.texcoord[5], texture[3], 2D;
MOV R1.xyz, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[3], R1;
MAX R1.x, R1, c[3];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0, c[1];
MUL R0.w, R0, c[3].y;
MUL R0.xyz, R0, c[0];
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].x;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Alpha]
SetTexture 0 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"ps_2_0
; 10 ALU, 2 TEX
dcl_2d s0
dcl_cube s1
dcl_cube s2
dcl_2d s3
def c3, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xy
texld r0, t5, s3
texld r1, t0, s0
mov_pp r0.xyz, t4
dp3_pp r0.x, t3, r0
max_pp r0.x, r0, c3
mul_pp r0.x, r0, r0.w
mul r1.xyz, r1, c1
mul_pp r0.x, r0, c3.y
mul r1.xyz, r1, c0
mul r0.xyz, r1, r0.x
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
}
 }
}
Fallback "Transparent/VertexLit"
}
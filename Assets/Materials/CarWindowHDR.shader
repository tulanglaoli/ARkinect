Shader "Car/CarWindowHDR" {
Properties {
 _DiffuseColor ("Diffuse Color", Color) = (1,1,1,1)
 _SpecularColor ("Specular Color", Color) = (1,1,1,1)
 _AmbientColor ("Metalic Color", Color) = (1,1,1,1)
 _AmbientColor2 ("Candy Color", Color) = (1,1,1,1)
 _Glossiness ("Glossiness", Range(0.1,1)) = 0.1
 _Diffuse ("Diffuse", 2D) = "white" {}
 _GlossMap ("GlossMap", 2D) = "white" {}
 _Cube ("Reflection Cubemap", CUBE) = "" { TexGen CubeReflect }
 _Intensity ("Fresnel Intensity", Range(0,2)) = 0.73545
 _RimPower ("Fresnel Power", Range(0.1,3)) = 0.556979
 _MetalicScale ("Metalic Intensity", Range(0,4)) = 1
 _MetalicPower ("Metalic Power", Range(0,20)) = 0
 _CandyScale ("Candy Intensity", Range(0,4)) = 1
 _CandyPower ("Candy Power", Range(0,20)) = 0
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="False" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent" "IGNOREPROJECTOR"="False" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [_Diffuse_ST]
Vector 24 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 59 ALU
PARAM c[25] = { { 1 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[13].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.y, R1, c[20];
DP4 R3.x, R1, c[19];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[22];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[6].xyz, R2, R3;
MUL R3.xyz, R0, vertex.attrib[14].w;
MOV R0, c[15];
MOV R1.xyz, c[14];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[13].w, -vertex.position;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R3, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R3, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[3], R0, c[13].w;
DP3 R0.y, R3, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[1].y, R2, R3;
DP3 result.texcoord[5].y, R3, R1;
MUL result.texcoord[4], R0, c[13].w;
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
DP3 result.texcoord[5].z, vertex.normal, R1;
DP3 result.texcoord[5].x, vertex.attrib[14], R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 59 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [_Diffuse_ST]
Vector 23 [_GlossMap_ST]
"vs_3_0
; 62 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c24, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c12.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c24.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c21
add o7.xyz, r1, r2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mov r1.w, c24.x
mov r1.xyz, c13
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c12.w, -v0
mov r1, c8
dp4 r4.x, c14, r1
dp3 r0.y, r3, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o3, r0, c12.w
dp3 r0.y, r3, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o4, r0, c12.w
dp3 r0.y, r3, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o2.y, r2, r3
dp3 o6.y, r3, r4
mul o5, r0, c12.w
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
dp3 o6.z, v2, r4
dp3 o6.x, v1, r4
mad o1.zw, v3.xyxy, c23.xyxy, c23
mad o1.xy, v3, c22, c22.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 16 [unity_LightmapST]
Vector 17 [_Diffuse_ST]
Vector 18 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 35 ALU
PARAM c[19] = { { 1 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R1.xyz, R1, c[13].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R1, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R1, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[3], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R1, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[1].y, R1, R2;
MUL result.texcoord[4], R0, c[13].w;
DP3 result.texcoord[1].z, vertex.normal, R1;
DP3 result.texcoord[1].x, R1, vertex.attrib[14];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_LightmapST]
Vector 15 [_Diffuse_ST]
Vector 16 [_GlossMap_ST]
"vs_3_0
; 36 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r0, v1.w
mov r0.xyz, c13
mov r0.w, c17.x
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r1.xyz, r1, c12.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r1, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o3, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r1, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o4, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r1, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o2.y, r1, r2
mul o5, r0, c12.w
dp3 o2.z, v2, r1
dp3 o2.x, r1, v1
mad o1.zw, v3.xyxy, c16.xyxy, c16
mad o1.xy, v3, c15, c15.zwzw
mad o6.xy, v4, c14, c14.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [_Diffuse_ST]
Vector 25 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 65 ALU
PARAM c[26] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..25] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[19];
DP4 R2.y, R0, c[18];
DP4 R2.x, R0, c[17];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[22];
DP4 R3.y, R1, c[21];
DP4 R3.x, R1, c[20];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[23];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[6].xyz, R2, R3;
MUL R3.xyz, R0, vertex.attrib[14].w;
MOV R0, c[16];
MOV R1.xyz, c[15];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[14].w, -vertex.position;
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
DP3 R0.w, -R2, c[5];
DP3 result.texcoord[5].y, R3, R1;
DP3 R0.y, R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[2], R0, c[14].w;
DP3 R0.w, -R2, c[6];
DP3 R0.y, R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[3], R0, c[14].w;
DP3 R0.w, -R2, c[7];
DP3 R0.y, R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[4], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[5].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[5].x, vertex.attrib[14], R1;
DP3 result.texcoord[1].y, R2, R3;
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
MUL R2.xyz, R0.xyww, c[0].y;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
ADD result.texcoord[7].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[7].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[25].xyxy, c[25];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[24], c[24].zwzw;
END
# 65 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [_Diffuse_ST]
Vector 25 [_GlossMap_ST]
"vs_3_0
; 67 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
dcl_texcoord7 o8
def c26, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c14.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c26.x
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c22
dp4 r3.y, r1, c21
dp4 r3.x, r1, c20
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c23
add o7.xyz, r1, r2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1.w, c26.x
mov r1.xyz, c15
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c14.w, -v0
mov r1, c8
dp4 r4.x, c16, r1
dp3 r0.y, r3, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o3, r0, c14.w
dp3 r0.y, r3, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o4, r0, c14.w
dp3 r0.y, r3, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o5, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c26.y
mul r1.y, r1, c12.x
dp3 o2.y, r2, r3
dp3 o6.y, r3, r4
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
dp3 o6.z, v2, r4
dp3 o6.x, v1, r4
mad o8.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o8.zw, r0
mad o1.zw, v3.xyxy, c25.xyxy, c25
mad o1.xy, v3, c24, c24.zwzw
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 17 [unity_LightmapST]
Vector 18 [_Diffuse_ST]
Vector 19 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 41 ALU
PARAM c[20] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[15];
MOV R0.w, c[0].x;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R1.xyz, R1, c[14].w, -vertex.position;
DP3 R0.w, -R1, c[5];
DP3 result.texcoord[1].y, R1, R2;
DP3 R0.y, R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[2], R0, c[14].w;
DP3 R0.w, -R1, c[6];
DP3 R0.y, R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[3], R0, c[14].w;
DP3 R0.w, -R1, c[7];
DP3 R0.y, R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[4], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[1].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
DP3 result.texcoord[1].x, R1, vertex.attrib[14];
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
ADD result.texcoord[6].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 41 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [unity_LightmapST]
Vector 17 [_Diffuse_ST]
Vector 18 [_GlossMap_ST]
"vs_3_0
; 42 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c19, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r0, v1.w
mov r0.xyz, c15
mov r0.w, c19.x
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r1.xyz, r1, c14.w, -v0
dp3 r0.w, -r1, c4
dp3 o2.y, r1, r2
dp3 r0.y, r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o3, r0, c14.w
dp3 r0.w, -r1, c5
dp3 r0.y, r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o4, r0, c14.w
dp3 r0.w, -r1, c6
dp3 r0.y, r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o5, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp3 o2.z, v2, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c19.y
dp3 o2.x, r1, v1
mov r1.x, r2
mul r1.y, r2, c12.x
mad o7.xy, r2.z, c13.zwzw, r1
mov o0, r0
mov o7.zw, r0
mad o1.zw, v3.xyxy, c18.xyxy, c18
mad o1.xy, v3, c17, c17.zwzw
mad o6.xy, v4, c16, c16.zwzw
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [_Diffuse_ST]
Vector 32 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 90 ALU
PARAM c[33] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..32] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[13].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MAD R1.xyz, R0.w, c[23], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[29];
DP4 R3.y, R0, c[28];
DP4 R3.x, R0, c[27];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
MOV R1.w, c[0].x;
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[30];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[6].xyz, R3, R1;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1.xyz, c[14];
MUL R3.xyz, R0, vertex.attrib[14].w;
MOV R0, c[15];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[13].w, -vertex.position;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R3, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R3, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[3], R0, c[13].w;
DP3 R0.y, R3, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[1].y, R2, R3;
DP3 result.texcoord[5].y, R3, R1;
MUL result.texcoord[4], R0, c[13].w;
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
DP3 result.texcoord[5].z, vertex.normal, R1;
DP3 result.texcoord[5].x, vertex.attrib[14], R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[32].xyxy, c[32];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 90 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
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
Vector 30 [_Diffuse_ST]
Vector 31 [_GlossMap_ST]
"vs_3_0
; 93 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c32, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c12.w
dp4 r0.x, v0, c5
add r1, -r0.x, c16
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c32.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c17
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c18
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c32.x
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.y
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mad r1.xyz, r0.w, c22, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c28
dp4 r3.y, r0, c27
dp4 r3.x, r0, c26
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c29
add r2.xyz, r2, r3
add r2.xyz, r2, r0
add o7.xyz, r2, r1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mov r1.w, c32.x
mov r1.xyz, c13
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c12.w, -v0
mov r1, c8
dp4 r4.x, c14, r1
dp3 r0.y, r3, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o3, r0, c12.w
dp3 r0.y, r3, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o4, r0, c12.w
dp3 r0.y, r3, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o2.y, r2, r3
dp3 o6.y, r3, r4
mul o5, r0, c12.w
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
dp3 o6.z, v2, r4
dp3 o6.x, v1, r4
mad o1.zw, v3.xyxy, c31.xyxy, c31
mad o1.xy, v3, c30, c30.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [_Diffuse_ST]
Vector 33 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 96 ALU
PARAM c[34] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..33] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[14].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[18];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[17];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[19];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[20];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[22];
MAD R1.xyz, R0.x, c[21], R1;
MAD R0.xyz, R0.z, c[23], R1;
MAD R1.xyz, R0.w, c[24], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[30];
DP4 R3.y, R0, c[29];
DP4 R3.x, R0, c[28];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
MOV R1.w, c[0].x;
DP4 R2.z, R4, c[27];
DP4 R2.y, R4, c[26];
DP4 R2.x, R4, c[25];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[31];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[6].xyz, R3, R1;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1.xyz, c[15];
MUL R3.xyz, R0, vertex.attrib[14].w;
MOV R0, c[16];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[14].w, -vertex.position;
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
DP3 R0.w, -R2, c[5];
DP3 result.texcoord[5].y, R3, R1;
DP3 R0.y, R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[2], R0, c[14].w;
DP3 R0.w, -R2, c[6];
DP3 R0.y, R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[3], R0, c[14].w;
DP3 R0.w, -R2, c[7];
DP3 R0.y, R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[4], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[5].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[5].x, vertex.attrib[14], R1;
DP3 result.texcoord[1].y, R2, R3;
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
MUL R2.xyz, R0.xyww, c[0].z;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
ADD result.texcoord[7].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[7].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[33].xyxy, c[33];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[32], c[32].zwzw;
END
# 96 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [_Diffuse_ST]
Vector 33 [_GlossMap_ST]
"vs_3_0
; 98 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
dcl_texcoord7 o8
def c34, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c14.w
dp4 r0.x, v0, c5
add r1, -r0.x, c18
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c17
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c34.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c19
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c20
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c34.x
dp4 r2.z, r4, c27
dp4 r2.y, r4, c26
dp4 r2.x, r4, c25
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c34.y
mul r0, r0, r1
mul r1.xyz, r0.y, c22
mad r1.xyz, r0.x, c21, r1
mad r0.xyz, r0.z, c23, r1
mad r1.xyz, r0.w, c24, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c30
dp4 r3.y, r0, c29
dp4 r3.x, r0, c28
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c31
add r2.xyz, r2, r3
add r2.xyz, r2, r0
add o7.xyz, r2, r1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1.w, c34.x
mov r1.xyz, c15
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c14.w, -v0
mov r1, c8
dp4 r4.x, c16, r1
dp3 r0.y, r3, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o3, r0, c14.w
dp3 r0.y, r3, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o4, r0, c14.w
dp3 r0.y, r3, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o5, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c34.z
mul r1.y, r1, c12.x
dp3 o2.y, r2, r3
dp3 o6.y, r3, r4
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
dp3 o6.z, v2, r4
dp3 o6.x, v1, r4
mad o8.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o8.zw, r0
mad o1.zw, v3.xyxy, c33.xyxy, c33
mad o1.xy, v3, c32, c32.zwzw
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
Float 4 [_RimPower]
Float 5 [_Intensity]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_GlossMap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 46 ALU, 3 TEX
PARAM c[8] = { program.local[0..5],
		{ 0, 128, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R1.w, R1.w;
MOV R1.x, fragment.texcoord[2].z;
MOV R1.y, fragment.texcoord[3].z;
MOV R1.z, fragment.texcoord[4];
MOV R0.x, fragment.texcoord[2].w;
MOV R0.z, fragment.texcoord[4].w;
MOV R0.y, fragment.texcoord[3].w;
DP3 R0.w, R1, R0;
MUL R1.xyz, R1, R0.w;
MAD R0.xyz, -R1, c[6].z, R0;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
TEX R0.xyz, R0, texture[1], CUBE;
RSQ R0.w, R0.w;
MOV R1.xyz, fragment.texcoord[5];
MAD R1.xyz, R0.w, fragment.texcoord[1], R1;
DP3 R0.w, R1, R1;
MAD R1.w, fragment.texcoord[1].z, -R1, c[6];
POW R1.x, R1.w, c[4].x;
MUL R3.xyz, R0, R1.x;
RSQ R0.w, R0.w;
MUL R0.y, R0.w, R1.z;
TEX R0.x, fragment.texcoord[0].zwzw, texture[2], 2D;
MAD R1.x, R0, c[3], R0;
MAX R0.w, R0.y, c[6].x;
MOV R0.xyz, c[7];
MUL R3.xyz, R3, c[5].x;
DP3 R0.y, R0, c[0];
MUL R1.x, R1, c[6].y;
POW R0.x, R0.w, R1.x;
MUL R1.w, R0.x, R0.y;
TEX R0, fragment.texcoord[0], texture[0], 2D;
ADD R2.w, -R0, c[6];
MAX R1.x, fragment.texcoord[5].z, c[6];
MUL R1.xyz, R1.x, c[0];
MUL R1, R1, c[6].z;
MUL R2.xyz, R2.w, c[2];
MUL R2.xyz, R1.w, R2;
MUL R2.xyz, R1, R2;
MUL R0.xyz, R0, c[1];
MAD R1.xyz, R0, R1, R2;
MUL R3.xyz, R3, R3;
MUL R2.xyz, R2.w, R3;
MAD R0.xyz, R0, fragment.texcoord[6], R1;
ADD result.color.xyz, R0, R2;
MOV result.color.w, R0;
END
# 46 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
Float 4 [_RimPower]
Float 5 [_Intensity]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_GlossMap] 2D
"ps_3_0
; 48 ALU, 3 TEX
dcl_2d s0
dcl_cube s1
dcl_2d s2
def c6, 0.00000000, 128.00000000, 2.00000000, 1.00000000
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyzw
dcl_texcoord4 v4.xyzw
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
dp3 r0.x, v1, v1
rsq r1.w, r0.x
mov_pp r0.x, v2.z
mov_pp r0.y, v3.z
mov_pp r0.z, v4
mov r1.x, v2.w
mov r1.z, v4.w
mov r1.y, v3.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.w, v1.z, -r1, c6
pow r0, r1.w, c4.x
mov r1.w, r0.x
mad r1.xyz, -r2, c6.z, r1
texld r1.xyz, r1, s1
mul r3.xyz, r1, r1.w
dp3_pp r0.w, v1, v1
mul r3.xyz, r3, c5.x
rsq_pp r0.w, r0.w
mov_pp r0.xyz, v5
mad_pp r0.xyz, r0.w, v1, r0
dp3_pp r0.y, r0, r0
texld r0.x, v0.zwzw, s2
mad r0.w, r0.x, c3.x, r0.x
rsq_pp r0.y, r0.y
mul_pp r0.x, r0.y, r0.z
mul_pp r1.y, r0.w, c6
max_pp r1.x, r0, c6
pow r0, r1.x, r1.y
mov_pp r1.xyz, c0
dp3_pp r0.y, c7, r1
mul r1.w, r0.x, r0.y
texld r0, v0, s0
add r2.w, -r0, c6
max_pp r1.x, v5.z, c6
mul_pp r1.xyz, r1.x, c0
mul_pp r1, r1, c6.z
mul r2.xyz, r2.w, c2
mul_pp r2.xyz, r1.w, r2
mul_pp r2.xyz, r1, r2
mul r0.xyz, r0, c1
mad_pp r1.xyz, r0, r1, r2
mul r3.xyz, r3, r3
mul r2.xyz, r2.w, r3
mad_pp r0.xyz, r0, v6, r1
add_pp oC0.xyz, r0, r2
mov_pp oC0.w, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" }
Vector 0 [_DiffuseColor]
Float 1 [_RimPower]
Float 2 [_Intensity]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [unity_Lightmap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 26 ALU, 3 TEX
PARAM c[4] = { program.local[0..2],
		{ 8, 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
MOV R1.x, fragment.texcoord[2].z;
MOV R1.y, fragment.texcoord[3].z;
MOV R1.z, fragment.texcoord[4];
MOV R0.x, fragment.texcoord[2].w;
MOV R0.z, fragment.texcoord[4].w;
MOV R0.y, fragment.texcoord[3].w;
DP3 R0.w, R1, R0;
MUL R1.xyz, R1, R0.w;
RSQ R1.w, R1.w;
MAD R0.w, -R1, fragment.texcoord[1].z, c[3].z;
MAD R0.xyz, -R1, c[3].y, R0;
TEX R1, fragment.texcoord[0], texture[0], 2D;
POW R0.w, R0.w, c[1].x;
TEX R0.xyz, R0, texture[1], CUBE;
MUL R0.xyz, R0, R0.w;
MUL R0.xyz, R0, c[2].x;
ADD R0.w, -R1, c[3].z;
MUL R0.xyz, R0, R0;
MUL R2.xyz, R0, R0.w;
TEX R0, fragment.texcoord[5], texture[2], 2D;
MUL R1.xyz, R1, c[0];
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[3].x, R2;
MOV result.color.w, R1;
END
# 26 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" }
Vector 0 [_DiffuseColor]
Float 1 [_RimPower]
Float 2 [_Intensity]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [unity_Lightmap] 2D
"ps_3_0
; 26 ALU, 3 TEX
dcl_2d s0
dcl_cube s1
dcl_2d s2
def c3, 2.00000000, 1.00000000, 8.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyzw
dcl_texcoord4 v4.xyzw
dcl_texcoord5 v5.xy
dp3 r0.x, v1, v1
rsq r0.x, r0.x
mad r2.w, -r0.x, v1.z, c3.y
pow r0, r2.w, c1.x
mov r0.w, r0.x
mov_pp r2.x, v2.z
mov_pp r2.y, v3.z
mov_pp r2.z, v4
mov r1.x, v2.w
mov r1.z, v4.w
mov r1.y, v3.w
dp3 r1.w, r2, r1
mul r2.xyz, r2, r1.w
mad r1.xyz, -r2, c3.x, r1
texld r0.xyz, r1, s1
texld r1, v0, s0
mul r0.xyz, r0, r0.w
mul r0.xyz, r0, c2.x
add r0.w, -r1, c3.y
mul r0.xyz, r0, r0
mul r2.xyz, r0, r0.w
texld r0, v5, s2
mul r1.xyz, r1, c0
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, r1
mad_pp oC0.xyz, r0, c3.z, r2
mov_pp oC0.w, r1
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
Float 4 [_RimPower]
Float 5 [_Intensity]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_GlossMap] 2D
SetTexture 3 [_ShadowMapTexture] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 48 ALU, 4 TEX
PARAM c[8] = { program.local[0..5],
		{ 0, 128, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R1.w, R1.w;
MOV R1.x, fragment.texcoord[2].z;
MOV R1.y, fragment.texcoord[3].z;
MOV R1.z, fragment.texcoord[4];
MOV R0.x, fragment.texcoord[2].w;
MOV R0.z, fragment.texcoord[4].w;
MOV R0.y, fragment.texcoord[3].w;
DP3 R0.w, R1, R0;
MUL R1.xyz, R1, R0.w;
MAD R0.xyz, -R1, c[6].z, R0;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
TEX R0.xyz, R0, texture[1], CUBE;
RSQ R0.w, R0.w;
MOV R1.xyz, fragment.texcoord[5];
MAD R1.xyz, R0.w, fragment.texcoord[1], R1;
DP3 R0.w, R1, R1;
MAD R1.w, fragment.texcoord[1].z, -R1, c[6];
POW R1.x, R1.w, c[4].x;
MUL R2.xyz, R0, R1.x;
RSQ R0.w, R0.w;
MUL R0.y, R0.w, R1.z;
TEX R0.x, fragment.texcoord[0].zwzw, texture[2], 2D;
MAD R1.x, R0, c[3], R0;
MAX R0.w, R0.y, c[6].x;
MOV R0.xyz, c[7];
MUL R2.xyz, R2, c[5].x;
DP3 R0.y, R0, c[0];
MUL R1.x, R1, c[6].y;
POW R0.x, R0.w, R1.x;
TEX R1, fragment.texcoord[0], texture[0], 2D;
MUL R3.w, R0.x, R0.y;
MAX R0.x, fragment.texcoord[5].z, c[6];
MUL R3.xyz, R0.x, c[0];
TXP R0.x, fragment.texcoord[7], texture[3], 2D;
MUL R0, R0.x, R3;
ADD R2.w, -R1, c[6];
MUL R2.xyz, R2, R2;
MUL R0, R0, c[6].z;
MUL R3.xyz, R2.w, c[2];
MUL R3.xyz, R0.w, R3;
MUL R1.xyz, R1, c[1];
MUL R3.xyz, R0, R3;
MAD R0.xyz, R1, R0, R3;
MUL R2.xyz, R2.w, R2;
MAD R0.xyz, R1, fragment.texcoord[6], R0;
ADD result.color.xyz, R0, R2;
MOV result.color.w, R1;
END
# 48 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
Float 4 [_RimPower]
Float 5 [_Intensity]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_GlossMap] 2D
SetTexture 3 [_ShadowMapTexture] 2D
"ps_3_0
; 49 ALU, 4 TEX
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_2d s3
def c6, 0.00000000, 128.00000000, 2.00000000, 1.00000000
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyzw
dcl_texcoord4 v4.xyzw
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
dcl_texcoord7 v7
dp3 r0.x, v1, v1
rsq r1.w, r0.x
mov_pp r0.x, v2.z
mov_pp r0.y, v3.z
mov_pp r0.z, v4
mov r1.x, v2.w
mov r1.z, v4.w
mov r1.y, v3.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.w, v1.z, -r1, c6
pow r0, r1.w, c4.x
mov r1.w, r0.x
mad r1.xyz, -r2, c6.z, r1
texld r1.xyz, r1, s1
mul r2.xyz, r1, r1.w
dp3_pp r0.w, v1, v1
mul r2.xyz, r2, c5.x
rsq_pp r0.w, r0.w
mov_pp r0.xyz, v5
mad_pp r0.xyz, r0.w, v1, r0
dp3_pp r0.y, r0, r0
texld r0.x, v0.zwzw, s2
mad r0.w, r0.x, c3.x, r0.x
rsq_pp r0.y, r0.y
mul_pp r0.x, r0.y, r0.z
mul_pp r1.y, r0.w, c6
max_pp r1.x, r0, c6
pow r0, r1.x, r1.y
mov_pp r1.xyz, c0
dp3_pp r0.y, c7, r1
texld r1, v0, s0
mul r3.w, r0.x, r0.y
max_pp r0.x, v5.z, c6
mul_pp r3.xyz, r0.x, c0
texldp r0.x, v7, s3
mul_pp r0, r0.x, r3
add r2.w, -r1, c6
mul r2.xyz, r2, r2
mul_pp r0, r0, c6.z
mul r3.xyz, r2.w, c2
mul_pp r3.xyz, r0.w, r3
mul r1.xyz, r1, c1
mul_pp r3.xyz, r0, r3
mad_pp r0.xyz, r1, r0, r3
mul r2.xyz, r2.w, r2
mad_pp r0.xyz, r1, v6, r0
add_pp oC0.xyz, r0, r2
mov_pp oC0.w, r1
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
Vector 0 [_DiffuseColor]
Float 1 [_RimPower]
Float 2 [_Intensity]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_ShadowMapTexture] 2D
SetTexture 3 [unity_Lightmap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 32 ALU, 4 TEX
PARAM c[4] = { program.local[0..2],
		{ 8, 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1, fragment.texcoord[5], texture[3], 2D;
MUL R0.xyz, R1.w, R1;
TXP R2.x, fragment.texcoord[6], texture[2], 2D;
MUL R1.xyz, R1, R2.x;
MUL R0.xyz, R0, c[3].x;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.w, R0.w;
MAD R0.w, -R0, fragment.texcoord[1].z, c[3].z;
MUL R2.xyz, R0, R2.x;
MUL R1.xyz, R1, c[3].y;
MIN R0.xyz, R0, R1;
MAX R1.xyz, R0, R2;
MOV R2.x, fragment.texcoord[2].z;
MOV R2.y, fragment.texcoord[3].z;
MOV R2.z, fragment.texcoord[4];
MOV R0.x, fragment.texcoord[2].w;
MOV R0.z, fragment.texcoord[4].w;
MOV R0.y, fragment.texcoord[3].w;
DP3 R1.w, R2, R0;
MUL R2.xyz, R2, R1.w;
MAD R0.xyz, -R2, c[3].y, R0;
POW R0.w, R0.w, c[1].x;
TEX R0.xyz, R0, texture[1], CUBE;
MUL R2.xyz, R0, R0.w;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R2.xyz, R2, c[2].x;
ADD R1.w, -R0, c[3].z;
MUL R2.xyz, R2, R2;
MUL R2.xyz, R2, R1.w;
MUL R0.xyz, R0, c[0];
MAD result.color.xyz, R0, R1, R2;
MOV result.color.w, R0;
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
Vector 0 [_DiffuseColor]
Float 1 [_RimPower]
Float 2 [_Intensity]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_ShadowMapTexture] 2D
SetTexture 3 [unity_Lightmap] 2D
"ps_3_0
; 31 ALU, 4 TEX
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_2d s3
def c3, 8.00000000, 2.00000000, 1.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyzw
dcl_texcoord4 v4.xyzw
dcl_texcoord5 v5.xy
dcl_texcoord6 v6
texldp r1.x, v6, s2
texld r0, v5, s3
mul_pp r2.xyz, r0, r1.x
mul_pp r0.xyz, r0.w, r0
dp3 r0.w, v1, v1
rsq r0.w, r0.w
mul_pp r0.xyz, r0, c3.x
mul_pp r2.xyz, r2, c3.y
min_pp r2.xyz, r0, r2
mul_pp r0.xyz, r0, r1.x
max_pp r3.xyz, r2, r0
mad r2.w, -r0, v1.z, c3.z
pow r0, r2.w, c1.x
mov r0.w, r0.x
mov_pp r2.x, v2.z
mov_pp r2.y, v3.z
mov_pp r2.z, v4
mov r1.x, v2.w
mov r1.z, v4.w
mov r1.y, v3.w
dp3 r1.w, r2, r1
mul r2.xyz, r2, r1.w
mad r1.xyz, -r2, c3.y, r1
texld r0.xyz, r1, s1
mul r1.xyz, r0, r0.w
texld r0, v0, s0
mul r1.xyz, r1, c2.x
add r1.w, -r0, c3.z
mul r1.xyz, r1, r1
mul r1.xyz, r1, r1.w
mul r0.xyz, r0, c0
mad_pp oC0.xyz, r0, r3, r1
mov_pp oC0.w, r0
"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "IGNOREPROJECTOR"="False" "RenderType"="Transparent" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [_Diffuse_ST]
Vector 21 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 34 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[19];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[17].w, -vertex.position;
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 34 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [_Diffuse_ST]
Vector 20 [_GlossMap_ST]
"vs_3_0
; 37 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c21.x
mov r0.xyz, c17
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c16.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1, c8
dp4 r4.x, c18, r1
mad r0.xyz, r4, c16.w, -v0
dp3 o2.y, r0, r2
dp3 o2.z, v2, r0
dp3 o2.x, r0, v1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o3.y, r2, r3
dp3 o3.z, v2, r3
dp3 o3.x, v1, r3
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_World2Object]
Vector 9 [unity_Scale]
Vector 10 [_WorldSpaceCameraPos]
Vector 11 [_WorldSpaceLightPos0]
Vector 12 [_Diffuse_ST]
Vector 13 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 26 ALU
PARAM c[14] = { { 1 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[10];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[7];
DP4 R2.y, R1, c[6];
DP4 R2.x, R1, c[5];
MAD R2.xyz, R2, c[9].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[11];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[7];
DP4 R3.y, R0, c[6];
DP4 R3.x, R0, c[5];
DP3 result.texcoord[1].y, R3, R1;
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[1].z, vertex.normal, R3;
DP3 result.texcoord[1].x, R3, vertex.attrib[14];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 26 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [unity_Scale]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_WorldSpaceLightPos0]
Vector 11 [_Diffuse_ST]
Vector 12 [_GlossMap_ST]
"vs_3_0
; 29 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
def c13, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c13.x
mov r0.xyz, c9
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
mad r3.xyz, r1, c8.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c6
dp4 r4.z, c10, r0
mov r0, c5
mov r1, c4
dp4 r4.y, c10, r0
dp4 r4.x, c10, r1
dp3 o2.y, r4, r2
dp3 o3.y, r2, r3
dp3 o2.z, v2, r4
dp3 o2.x, r4, v1
dp3 o3.z, v2, r3
dp3 o3.x, v1, r3
mad o1.zw, v3.xyxy, c12.xyxy, c12
mad o1.xy, v3, c11, c11.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [_Diffuse_ST]
Vector 21 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 35 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[19];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[17].w, -vertex.position;
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
DP4 result.texcoord[3].w, R0, c[16];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [_Diffuse_ST]
Vector 20 [_GlossMap_ST]
"vs_3_0
; 38 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c21.x
mov r0.xyz, c17
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c16.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1, c8
dp4 r4.x, c18, r1
mad r0.xyz, r4, c16.w, -v0
dp4 r0.w, v0, c7
dp3 o2.y, r0, r2
dp3 o2.z, v2, r0
dp3 o2.x, r0, v1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o3.y, r2, r3
dp3 o3.z, v2, r3
dp3 o3.x, v1, r3
dp4 o4.w, r0, c15
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [_Diffuse_ST]
Vector 21 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 34 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[19];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[17].w, -vertex.position;
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 34 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [_Diffuse_ST]
Vector 20 [_GlossMap_ST]
"vs_3_0
; 37 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c21.x
mov r0.xyz, c17
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c16.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1, c8
dp4 r4.x, c18, r1
mad r0.xyz, r4, c16.w, -v0
dp3 o2.y, r0, r2
dp3 o2.z, v2, r0
dp3 o2.x, r0, v1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o3.y, r2, r3
dp3 o3.z, v2, r3
dp3 o3.x, v1, r3
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [_Diffuse_ST]
Vector 21 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 32 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[19];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[1].y, R3, R1;
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[1].z, vertex.normal, R3;
DP3 result.texcoord[1].x, R3, vertex.attrib[14];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 32 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [_Diffuse_ST]
Vector 20 [_GlossMap_ST]
"vs_3_0
; 35 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c21.x
mov r0.xyz, c17
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c16.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1, c8
dp4 r4.x, c18, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o2.y, r4, r2
dp3 o3.y, r2, r3
dp3 o2.z, v2, r4
dp3 o2.x, r4, v1
dp3 o3.z, v2, r3
dp3 o3.x, v1, r3
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_GlossMap] 2D
SetTexture 2 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 31 ALU, 3 TEX
PARAM c[6] = { program.local[0..3],
		{ 0, 128, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
DP3 R0.x, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.y, R0.x;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
MUL R1.xyz, R0.y, fragment.texcoord[1];
RSQ R0.x, R0.x;
MAD R0.xyz, R0.x, fragment.texcoord[2], R1;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MUL R0.y, R0, R0.z;
TEX R0.x, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R0.x, R0, c[3], R0;
MAX R0.w, R0.y, c[4].x;
MUL R1.x, R0, c[4].y;
MOV R0.xyz, c[5];
POW R1.x, R0.w, R1.x;
DP3 R1.y, R0, c[0];
TEX R0, fragment.texcoord[0], texture[0], 2D;
ADD R2.x, -R0.w, c[4].w;
MUL R1.w, R1.x, R1.y;
MAX R1.x, R1.z, c[4];
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
MUL R1.xyz, R1.x, c[0];
TEX R0.w, R0.w, texture[2], 2D;
MUL R1, R0.w, R1;
MUL R1, R1, c[4].z;
MUL R2.xyz, R2.x, c[2];
MUL R2.xyz, R1.w, R2;
MUL R2.xyz, R1, R2;
MUL R0.xyz, R0, c[1];
MAD result.color.xyz, R0, R1, R2;
MOV result.color.w, c[4].x;
END
# 31 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_GlossMap] 2D
SetTexture 2 [_LightTexture0] 2D
"ps_3_0
; 31 ALU, 3 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 0.00000000, 128.00000000, 2.00000000, 1.00000000
def c5, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dp3_pp r0.x, v1, v1
rsq_pp r0.y, r0.x
dp3_pp r0.x, v2, v2
mul_pp r2.xyz, r0.y, v1
rsq_pp r0.x, r0.x
mad_pp r0.xyz, r0.x, v2, r2
dp3_pp r0.y, r0, r0
texld r0.x, v0.zwzw, s1
mad r0.w, r0.x, c3.x, r0.x
rsq_pp r0.y, r0.y
mul_pp r0.x, r0.y, r0.z
mul_pp r1.y, r0.w, c4
max_pp r1.x, r0, c4
pow r0, r1.x, r1.y
mov r0.y, r0.x
mov_pp r1.xyz, c0
dp3_pp r0.x, c5, r1
mul r2.w, r0.y, r0.x
texld r1, v0, s0
max_pp r0.y, r2.z, c4.x
dp3 r0.x, v3, v3
mul_pp r2.xyz, r0.y, c0
texld r0.x, r0.x, s2
mul_pp r0, r0.x, r2
add r1.w, -r1, c4
mul_pp r0, r0, c4.z
mul r2.xyz, r1.w, c2
mul_pp r2.xyz, r0.w, r2
mul_pp r2.xyz, r0, r2
mul r1.xyz, r1, c1
mad_pp oC0.xyz, r1, r0, r2
mov_pp oC0.w, c4.x
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_GlossMap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 26 ALU, 2 TEX
PARAM c[6] = { program.local[0..3],
		{ 0, 128, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
MOV R1.xyz, fragment.texcoord[1];
RSQ R0.x, R0.x;
MAD R0.xyz, R0.x, fragment.texcoord[2], R1;
DP3 R0.x, R0, R0;
RSQ R0.x, R0.x;
MUL R0.y, R0.x, R0.z;
TEX R0.x, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R1.x, R0, c[3], R0;
MAX R0.w, R0.y, c[4].x;
MOV R0.xyz, c[5];
DP3 R0.y, R0, c[0];
MUL R1.x, R1, c[4].y;
POW R0.x, R0.w, R1.x;
MUL R1.w, R0.x, R0.y;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MAX R1.x, fragment.texcoord[1].z, c[4];
ADD R0.w, -R0, c[4];
MUL R1.xyz, R1.x, c[0];
MUL R1, R1, c[4].z;
MUL R2.xyz, R0.w, c[2];
MUL R2.xyz, R1.w, R2;
MUL R2.xyz, R1, R2;
MUL R0.xyz, R0, c[1];
MAD result.color.xyz, R0, R1, R2;
MOV result.color.w, c[4].x;
END
# 26 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_GlossMap] 2D
"ps_3_0
; 26 ALU, 2 TEX
dcl_2d s0
dcl_2d s1
def c4, 0.00000000, 128.00000000, 2.00000000, 1.00000000
def c5, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dp3_pp r0.x, v2, v2
mov_pp r1.xyz, v1
rsq_pp r0.x, r0.x
mad_pp r0.xyz, r0.x, v2, r1
dp3_pp r0.y, r0, r0
texld r0.x, v0.zwzw, s1
mad r0.w, r0.x, c3.x, r0.x
rsq_pp r0.y, r0.y
mul_pp r0.x, r0.y, r0.z
mul_pp r1.y, r0.w, c4
max_pp r1.x, r0, c4
pow r0, r1.x, r1.y
mov_pp r1.xyz, c0
dp3_pp r0.y, c5, r1
mul r1.w, r0.x, r0.y
texld r0, v0, s0
max_pp r1.x, v1.z, c4
add r0.w, -r0, c4
mul_pp r1.xyz, r1.x, c0
mul_pp r1, r1, c4.z
mul r2.xyz, r0.w, c2
mul_pp r2.xyz, r1.w, r2
mul_pp r2.xyz, r1, r2
mul r0.xyz, r0, c1
mad_pp oC0.xyz, r0, r1, r2
mov_pp oC0.w, c4.x
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_GlossMap] 2D
SetTexture 2 [_LightTexture0] 2D
SetTexture 3 [_LightTextureB0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 37 ALU, 4 TEX
PARAM c[6] = { program.local[0..3],
		{ 0, 0.5, 128, 2 },
		{ 0.2199707, 0.70703125, 0.070983887, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
RCP R2.y, fragment.texcoord[3].w;
MAD R2.zw, fragment.texcoord[3].xyxy, R2.y, c[4].y;
DP3 R0.x, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.x, R0.x;
MUL R1.xyz, R0.x, fragment.texcoord[1];
DP3 R0.y, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.x, R0.y;
MAD R0.xyz, R0.x, fragment.texcoord[2], R1;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MUL R0.y, R0, R0.z;
TEX R0.x, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R0.x, R0, c[3], R0;
MAX R1.x, R0.y, c[4];
MUL R0.w, R0.x, c[4].z;
POW R1.y, R1.x, R0.w;
MOV R0.xyz, c[5];
DP3 R1.x, R0, c[0];
TEX R0, fragment.texcoord[0], texture[0], 2D;
ADD R2.x, -R0.w, c[5].w;
MAX R0.w, R1.z, c[4].x;
MUL R1.w, R1.y, R1.x;
MUL R1.xyz, R0.w, c[0];
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
TEX R2.w, R2.zwzw, texture[2], 2D;
SLT R2.y, c[4].x, fragment.texcoord[3].z;
MUL R2.y, R2, R2.w;
TEX R0.w, R0.w, texture[3], 2D;
MUL R0.w, R2.y, R0;
MUL R1, R0.w, R1;
MUL R1, R1, c[4].w;
MUL R2.xyz, R2.x, c[2];
MUL R2.xyz, R1.w, R2;
MUL R2.xyz, R1, R2;
MUL R0.xyz, R0, c[1];
MAD result.color.xyz, R0, R1, R2;
MOV result.color.w, c[4].x;
END
# 37 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_GlossMap] 2D
SetTexture 2 [_LightTexture0] 2D
SetTexture 3 [_LightTextureB0] 2D
"ps_3_0
; 36 ALU, 4 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c4, 0.00000000, 1.00000000, 0.50000000, 128.00000000
def c5, 0.21997070, 0.70703125, 0.07098389, 2.00000000
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
dp3_pp r0.x, v1, v1
rsq_pp r0.y, r0.x
dp3_pp r0.x, v2, v2
mul_pp r2.xyz, r0.y, v1
rsq_pp r0.x, r0.x
mad_pp r0.xyz, r0.x, v2, r2
dp3_pp r0.y, r0, r0
texld r0.x, v0.zwzw, s1
mad r0.w, r0.x, c3.x, r0.x
rsq_pp r0.y, r0.y
mul_pp r0.x, r0.y, r0.z
mul_pp r1.y, r0.w, c4.w
max_pp r1.x, r0, c4
pow r0, r1.x, r1.y
mov r0.y, r0.x
mov_pp r1.xyz, c0
dp3_pp r0.x, c5, r1
mul r2.w, r0.y, r0.x
texld r1, v0, s0
max_pp r0.y, r2.z, c4.x
mul_pp r2.xyz, r0.y, c0
rcp r0.x, v3.w
mad r3.xy, v3, r0.x, c4.z
dp3 r0.x, v3, v3
texld r0.w, r3, s2
cmp r0.y, -v3.z, c4.x, c4
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s3
mul_pp r0.x, r0.y, r0
mul_pp r0, r0.x, r2
add r1.w, -r1, c4.y
mul_pp r0, r0, c5.w
mul r2.xyz, r1.w, c2
mul_pp r2.xyz, r0.w, r2
mul_pp r2.xyz, r0, r2
mul r1.xyz, r1, c1
mad_pp oC0.xyz, r1, r0, r2
mov_pp oC0.w, c4.x
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_GlossMap] 2D
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_LightTexture0] CUBE
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 33 ALU, 4 TEX
PARAM c[6] = { program.local[0..3],
		{ 0, 128, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
DP3 R2.y, fragment.texcoord[3], fragment.texcoord[3];
DP3 R0.x, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.x, R0.x;
MUL R1.xyz, R0.x, fragment.texcoord[1];
DP3 R0.y, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.x, R0.y;
MAD R0.xyz, R0.x, fragment.texcoord[2], R1;
DP3 R0.x, R0, R0;
RSQ R0.x, R0.x;
MUL R0.y, R0.x, R0.z;
TEX R0.x, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R0.w, R0.x, c[3].x, R0.x;
MAX R1.x, R0.y, c[4];
MOV R0.xyz, c[5];
DP3 R0.x, R0, c[0];
MUL R0.w, R0, c[4].y;
POW R0.y, R1.x, R0.w;
MUL R1.w, R0.y, R0.x;
TEX R0, fragment.texcoord[0], texture[0], 2D;
ADD R2.x, -R0.w, c[4].w;
TEX R2.w, R2.y, texture[2], 2D;
MAX R1.x, R1.z, c[4];
TEX R0.w, fragment.texcoord[3], texture[3], CUBE;
MUL R1.xyz, R1.x, c[0];
MUL R0.w, R2, R0;
MUL R1, R0.w, R1;
MUL R1, R1, c[4].z;
MUL R2.xyz, R2.x, c[2];
MUL R2.xyz, R1.w, R2;
MUL R2.xyz, R1, R2;
MUL R0.xyz, R0, c[1];
MAD result.color.xyz, R0, R1, R2;
MOV result.color.w, c[4].x;
END
# 33 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_GlossMap] 2D
SetTexture 2 [_LightTextureB0] 2D
SetTexture 3 [_LightTexture0] CUBE
"ps_3_0
; 31 ALU, 4 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
def c4, 0.00000000, 128.00000000, 2.00000000, 1.00000000
def c5, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dp3_pp r0.x, v1, v1
rsq_pp r0.y, r0.x
dp3_pp r0.x, v2, v2
mul_pp r2.xyz, r0.y, v1
rsq_pp r0.x, r0.x
mad_pp r0.xyz, r0.x, v2, r2
dp3_pp r0.y, r0, r0
texld r0.x, v0.zwzw, s1
mad r0.w, r0.x, c3.x, r0.x
rsq_pp r0.y, r0.y
mul_pp r0.x, r0.y, r0.z
mul_pp r1.y, r0.w, c4
max_pp r1.x, r0, c4
pow r0, r1.x, r1.y
mov_pp r1.xyz, c0
dp3_pp r0.y, c5, r1
texld r1, v0, s0
mul r2.w, r0.x, r0.y
max_pp r0.x, r2.z, c4
mul_pp r2.xyz, r0.x, c0
dp3 r0.x, v3, v3
texld r0.w, v3, s3
texld r0.x, r0.x, s2
mul r0.x, r0, r0.w
mul_pp r0, r0.x, r2
add r1.w, -r1, c4
mul_pp r0, r0, c4.z
mul r2.xyz, r1.w, c2
mul_pp r2.xyz, r0.w, r2
mul_pp r2.xyz, r0, r2
mul r1.xyz, r1, c1
mad_pp oC0.xyz, r1, r0, r2
mov_pp oC0.w, c4.x
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_GlossMap] 2D
SetTexture 2 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 28 ALU, 3 TEX
PARAM c[6] = { program.local[0..3],
		{ 0, 128, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
MOV R1.xyz, fragment.texcoord[1];
RSQ R0.x, R0.x;
MAD R0.xyz, R0.x, fragment.texcoord[2], R1;
DP3 R0.x, R0, R0;
RSQ R0.x, R0.x;
MUL R0.y, R0.x, R0.z;
TEX R0.x, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R1.x, R0, c[3], R0;
MAX R0.w, R0.y, c[4].x;
MOV R0.xyz, c[5];
DP3 R0.y, R0, c[0];
MUL R1.x, R1, c[4].y;
POW R0.x, R0.w, R1.x;
MUL R1.w, R0.x, R0.y;
TEX R0, fragment.texcoord[0], texture[0], 2D;
ADD R2.x, -R0.w, c[4].w;
MAX R1.x, fragment.texcoord[1].z, c[4];
MUL R1.xyz, R1.x, c[0];
TEX R0.w, fragment.texcoord[3], texture[2], 2D;
MUL R1, R0.w, R1;
MUL R1, R1, c[4].z;
MUL R2.xyz, R2.x, c[2];
MUL R2.xyz, R1.w, R2;
MUL R2.xyz, R1, R2;
MUL R0.xyz, R0, c[1];
MAD result.color.xyz, R0, R1, R2;
MOV result.color.w, c[4].x;
END
# 28 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_DiffuseColor]
Vector 2 [_SpecularColor]
Float 3 [_Glossiness]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_GlossMap] 2D
SetTexture 2 [_LightTexture0] 2D
"ps_3_0
; 27 ALU, 3 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 0.00000000, 128.00000000, 2.00000000, 1.00000000
def c5, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xy
dp3_pp r0.x, v2, v2
mov_pp r1.xyz, v1
rsq_pp r0.x, r0.x
mad_pp r0.xyz, r0.x, v2, r1
dp3_pp r0.y, r0, r0
texld r0.x, v0.zwzw, s1
mad r0.w, r0.x, c3.x, r0.x
rsq_pp r0.y, r0.y
mul_pp r0.x, r0.y, r0.z
mul_pp r1.y, r0.w, c4
max_pp r1.x, r0, c4
pow r0, r1.x, r1.y
mov_pp r1.xyz, c0
dp3_pp r0.y, c5, r1
mul r1.w, r0.x, r0.y
texld r0, v0, s0
add r2.x, -r0.w, c4.w
max_pp r1.x, v1.z, c4
mul_pp r1.xyz, r1.x, c0
texld r0.w, v3, s2
mul_pp r1, r0.w, r1
mul_pp r1, r1, c4.z
mul r2.xyz, r2.x, c2
mul_pp r2.xyz, r1.w, r2
mul_pp r2.xyz, r1, r2
mul r0.xyz, r0, c1
mad_pp oC0.xyz, r0, r1, r2
mov_pp oC0.w, c4.x
"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Transparent" "IGNOREPROJECTOR"="False" "RenderType"="Transparent" }
  ZWrite Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
Vector 10 [_GlossMap_ST]
"3.0-!!ARBvp1.0
# 21 ALU
PARAM c[11] = { program.local[0],
		state.matrix.mvp,
		program.local[5..10] };
TEMP R0;
TEMP R1;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
DP3 R0.y, R1, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1].xyz, R0, c[9].w;
DP3 R0.y, R1, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2].xyz, R0, c[9].w;
DP3 R0.y, R1, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3].xyz, R0, c[9].w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
Vector 9 [_GlossMap_ST]
"vs_3_0
; 22 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
dp3 r0.y, r1, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2.xyz, r0, c8.w
dp3 r0.y, r1, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3.xyz, r0, c8.w
dp3 r0.y, r1, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o4.xyz, r0, c8.w
mad o1.xy, v3, c9, c9.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_Glossiness]
SetTexture 0 [_GlossMap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 6 ALU, 1 TEX
PARAM c[2] = { program.local[0],
		{ 0.5 } };
TEMP R0;
TEX R0.x, fragment.texcoord[0], texture[0], 2D;
MOV R0.w, fragment.texcoord[3].z;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MAD result.color.xyz, R0.yzww, c[1].x, c[1].x;
MAD result.color.w, R0.x, c[0].x, R0.x;
END
# 6 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_Glossiness]
SetTexture 0 [_GlossMap] 2D
"ps_3_0
; 5 ALU, 1 TEX
dcl_2d s0
def c1, 0.50000000, 0, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
texld r0.x, v0, s0
mov_pp r0.w, v3.z
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mad_pp oC0.xyz, r0.yzww, c1.x, c1.x
mad oC0.w, r0.x, c0.x, r0.x
"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="Transparent" "IGNOREPROJECTOR"="False" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_Diffuse_ST]
"3.0-!!ARBvp1.0
# 39 ALU
PARAM c[17] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[15];
MOV R0.w, c[0].x;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R1.xyz, R1, c[14].w, -vertex.position;
DP3 R0.w, -R1, c[5];
DP3 result.texcoord[1].y, R1, R2;
DP3 R0.y, R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[3], R0, c[14].w;
DP3 R0.w, -R1, c[6];
DP3 R0.y, R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[4], R0, c[14].w;
DP3 R0.w, -R1, c[7];
DP3 R0.y, R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[5], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[1].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
DP3 result.texcoord[1].x, R1, vertex.attrib[14];
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
ADD result.texcoord[2].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
END
# 39 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_Diffuse_ST]
"vs_3_0
; 40 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c17, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r0, v1.w
mov r0.xyz, c15
mov r0.w, c17.x
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r1.xyz, r1, c14.w, -v0
dp3 r0.w, -r1, c4
dp3 o2.y, r1, r2
dp3 r0.y, r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o4, r0, c14.w
dp3 r0.w, -r1, c5
dp3 r0.y, r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o5, r0, c14.w
dp3 r0.w, -r1, c6
dp3 r0.y, r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o6, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp3 o2.z, v2, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c17.y
dp3 o2.x, r1, v1
mov r1.x, r2
mul r1.y, r2, c12.x
mad o3.xy, r2.z, c13.zwzw, r1
mov o0, r0
mov o3.zw, r0
mad o1.xy, v3, c16, c16.zwzw
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_ProjectionParams]
Vector 18 [unity_Scale]
Vector 19 [_WorldSpaceCameraPos]
Vector 20 [unity_LightmapST]
Vector 21 [unity_ShadowFadeCenterAndType]
Vector 22 [_Diffuse_ST]
"3.0-!!ARBvp1.0
# 49 ALU
PARAM c[23] = { { 1, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[19];
MOV R0.w, c[0].x;
DP4 R1.z, R0, c[15];
DP4 R1.x, R0, c[13];
DP4 R1.y, R0, c[14];
MAD R1.xyz, R1, c[18].w, -vertex.position;
DP3 R0.w, -R1, c[9];
DP3 result.texcoord[1].y, R1, R2;
DP3 R0.y, R2, c[9];
DP3 result.texcoord[1].z, vertex.normal, R1;
DP3 result.texcoord[1].x, R1, vertex.attrib[14];
DP3 R0.x, vertex.attrib[14], c[9];
DP3 R0.z, vertex.normal, c[9];
MUL result.texcoord[3], R0, c[18].w;
DP3 R0.w, -R1, c[10];
DP3 R0.y, R2, c[10];
DP3 R0.x, vertex.attrib[14], c[10];
DP3 R0.z, vertex.normal, c[10];
MUL result.texcoord[4], R0, c[18].w;
DP3 R0.w, -R1, c[11];
DP3 R0.y, R2, c[11];
DP3 R0.x, vertex.attrib[14], c[11];
DP3 R0.z, vertex.normal, c[11];
MUL result.texcoord[5], R0, c[18].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R2.xyz, R0.xyww, c[0].y;
MOV result.position, R0;
MOV R0.x, c[0];
ADD R0.y, R0.x, -c[21].w;
DP4 R0.x, vertex.position, c[3];
MOV R1.x, R2;
MUL R1.y, R2, c[17].x;
ADD result.texcoord[2].xy, R1, R2.z;
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[21];
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[7].xyz, R1, c[21].w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[6].xy, vertex.texcoord[1], c[20], c[20].zwzw;
MUL result.texcoord[7].w, -R0.x, R0.y;
END
# 49 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [unity_Scale]
Vector 19 [_WorldSpaceCameraPos]
Vector 20 [unity_LightmapST]
Vector 21 [unity_ShadowFadeCenterAndType]
Vector 22 [_Diffuse_ST]
"vs_3_0
; 50 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
dcl_texcoord7 o8
def c23, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r0, v1.w
mov r0.xyz, c19
mov r0.w, c23.x
dp4 r1.z, r0, c14
dp4 r1.x, r0, c12
dp4 r1.y, r0, c13
mad r1.xyz, r1, c18.w, -v0
dp3 r0.w, -r1, c8
dp3 o2.y, r1, r2
dp3 r0.y, r2, c8
dp3 o2.z, v2, r1
dp3 o2.x, r1, v1
dp3 r0.x, v1, c8
dp3 r0.z, v2, c8
mul o4, r0, c18.w
dp3 r0.w, -r1, c9
dp3 r0.y, r2, c9
dp3 r0.x, v1, c9
dp3 r0.z, v2, c9
mul o5, r0, c18.w
dp3 r0.w, -r1, c10
dp3 r0.y, r2, c10
dp3 r0.x, v1, c10
dp3 r0.z, v2, c10
mul o6, r0, c18.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r2.xyz, r0.xyww, c23.y
mov o0, r0
mov r0.x, c21.w
add r0.y, c23.x, -r0.x
dp4 r0.x, v0, c2
mov r1.x, r2
mul r1.y, r2, c16.x
mad o3.xy, r2.z, c17.zwzw, r1
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c21
mov o3.zw, r0
mul o8.xyz, r1, c21.w
mad o1.xy, v3, c22, c22.zwzw
mad o7.xy, v4, c20, c20.zwzw
mul o8.w, -r0.x, r0.y
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
Vector 0 [_DiffuseColor]
Vector 1 [_SpecularColor]
Float 2 [_RimPower]
Float 3 [_Intensity]
Vector 4 [unity_Ambient]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_LightBuffer] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 33 ALU, 3 TEX
PARAM c[6] = { program.local[0..4],
		{ 1, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
MOV R1.x, fragment.texcoord[3].z;
MOV R1.y, fragment.texcoord[4].z;
MOV R1.z, fragment.texcoord[5];
MOV R0.x, fragment.texcoord[3].w;
MOV R0.z, fragment.texcoord[5].w;
MOV R0.y, fragment.texcoord[4].w;
DP3 R0.w, R1, R0;
MUL R1.xyz, R1, R0.w;
RSQ R1.w, R1.w;
MAD R0.w, -R1, fragment.texcoord[1].z, c[5].x;
MAD R0.xyz, -R1, c[5].y, R0;
POW R0.w, R0.w, c[2].x;
TEX R0.xyz, R0, texture[1], CUBE;
MUL R0.xyz, R0, R0.w;
MUL R1.xyz, R0, c[3].x;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R2.xyz, R1, R1;
TXP R1, fragment.texcoord[2], texture[2], 2D;
ADD R2.w, -R0, c[5].x;
MUL R3.xyz, R2.w, c[1];
LG2 R1.w, R1.w;
MUL R3.xyz, -R1.w, R3;
LG2 R1.x, R1.x;
LG2 R1.z, R1.z;
LG2 R1.y, R1.y;
ADD R1.xyz, -R1, c[4];
MUL R3.xyz, R1, R3;
MUL R0.xyz, R0, c[0];
MUL R2.xyz, R2.w, R2;
MAD R0.xyz, R0, R1, R3;
ADD result.color.xyz, R0, R2;
MOV result.color.w, R0;
END
# 33 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
Vector 0 [_DiffuseColor]
Vector 1 [_SpecularColor]
Float 2 [_RimPower]
Float 3 [_Intensity]
Vector 4 [unity_Ambient]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_LightBuffer] 2D
"ps_3_0
; 33 ALU, 3 TEX
dcl_2d s0
dcl_cube s1
dcl_2d s2
def c5, 1.00000000, 2.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2
dcl_texcoord3 v3.xyzw
dcl_texcoord4 v4.xyzw
dcl_texcoord5 v5.xyzw
dp3 r0.x, v1, v1
rsq r0.x, r0.x
mad r2.w, -r0.x, v1.z, c5.x
pow r0, r2.w, c2.x
mov r0.w, r0.x
mov_pp r2.x, v3.z
mov_pp r2.y, v4.z
mov_pp r2.z, v5
mov r1.x, v3.w
mov r1.z, v5.w
mov r1.y, v4.w
dp3 r1.w, r2, r1
mul r2.xyz, r2, r1.w
mad r1.xyz, -r2, c5.y, r1
texld r0.xyz, r1, s1
mul r0.xyz, r0, r0.w
mul r1.xyz, r0, c3.x
texld r0, v0, s0
mul r2.xyz, r1, r1
texldp r1, v2, s2
add r2.w, -r0, c5.x
mul r3.xyz, r2.w, c1
log_pp r1.w, r1.w
mul_pp r3.xyz, -r1.w, r3
log_pp r1.x, r1.x
log_pp r1.z, r1.z
log_pp r1.y, r1.y
add_pp r1.xyz, -r1, c4
mul_pp r3.xyz, r1, r3
mul r0.xyz, r0, c0
mul r2.xyz, r2.w, r2
mad_pp r0.xyz, r0, r1, r3
add_pp oC0.xyz, r0, r2
mov_pp oC0.w, r0
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
Vector 0 [_DiffuseColor]
Vector 1 [_SpecularColor]
Float 2 [_RimPower]
Float 3 [_Intensity]
Vector 4 [unity_LightmapFade]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_LightBuffer] 2D
SetTexture 3 [unity_Lightmap] 2D
SetTexture 4 [unity_LightmapInd] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 44 ALU, 5 TEX
PARAM c[6] = { program.local[0..4],
		{ 8, 1, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TXP R2, fragment.texcoord[2], texture[2], 2D;
TEX R1, fragment.texcoord[6], texture[3], 2D;
TEX R0, fragment.texcoord[6], texture[4], 2D;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R0, c[5].x;
DP4 R0.w, fragment.texcoord[7], fragment.texcoord[7];
RSQ R0.w, R0.w;
RCP R0.w, R0.w;
MAD R1.xyz, R1, c[5].x, -R0;
MAD_SAT R0.w, R0, c[4].z, c[4];
MAD R0.xyz, R0.w, R1, R0;
LG2 R1.x, R2.x;
LG2 R1.y, R2.y;
LG2 R1.z, R2.z;
ADD R1.xyz, -R1, R0;
MOV R2.x, fragment.texcoord[3].z;
MOV R2.y, fragment.texcoord[4].z;
MOV R2.z, fragment.texcoord[5];
MOV R0.x, fragment.texcoord[3].w;
MOV R0.z, fragment.texcoord[5].w;
MOV R0.y, fragment.texcoord[4].w;
DP3 R0.w, R2, R0;
MUL R2.xyz, R2, R0.w;
MAD R0.xyz, -R2, c[5].z, R0;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.w, R1.w;
MAD R0.w, -R0, fragment.texcoord[1].z, c[5].y;
POW R1.w, R0.w, c[2].x;
TEX R2.xyz, R0, texture[1], CUBE;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R2.xyz, R2, R1.w;
MUL R3.xyz, R2, c[3].x;
ADD R1.w, -R0, c[5].y;
MUL R3.xyz, R3, R3;
MUL R2.xyz, R1.w, c[1];
LG2 R2.w, R2.w;
MUL R2.xyz, -R2.w, R2;
MUL R2.xyz, R1, R2;
MUL R0.xyz, R0, c[0];
MUL R3.xyz, R1.w, R3;
MAD R0.xyz, R0, R1, R2;
ADD result.color.xyz, R0, R3;
MOV result.color.w, R0;
END
# 44 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
Vector 0 [_DiffuseColor]
Vector 1 [_SpecularColor]
Float 2 [_RimPower]
Float 3 [_Intensity]
Vector 4 [unity_LightmapFade]
SetTexture 0 [_Diffuse] 2D
SetTexture 1 [_Cube] CUBE
SetTexture 2 [_LightBuffer] 2D
SetTexture 3 [unity_Lightmap] 2D
SetTexture 4 [unity_LightmapInd] 2D
"ps_3_0
; 42 ALU, 5 TEX
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c5, 8.00000000, 1.00000000, 2.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2
dcl_texcoord3 v3.xyzw
dcl_texcoord4 v4.xyzw
dcl_texcoord5 v5.xyzw
dcl_texcoord6 v6.xy
dcl_texcoord7 v7
texld r1, v6, s3
texld r0, v6, s4
mul_pp r0.xyz, r0.w, r0
dp4 r0.w, v7, v7
rsq r0.w, r0.w
rcp r0.w, r0.w
mul_pp r1.xyz, r1.w, r1
mul_pp r0.xyz, r0, c5.x
mad_pp r2.xyz, r1, c5.x, -r0
texldp r1, v2, s2
mad_sat r0.w, r0, c4.z, c4
mad_pp r0.xyz, r0.w, r2, r0
dp3 r0.w, v1, v1
rsq r2.w, r0.w
mov r2.x, v3.w
mov r2.z, v5.w
mov r2.y, v4.w
mad r2.w, -r2, v1.z, c5.y
log_pp r1.x, r1.x
log_pp r1.y, r1.y
log_pp r1.z, r1.z
add_pp r1.xyz, -r1, r0
mov_pp r0.x, v3.z
mov_pp r0.y, v4.z
mov_pp r0.z, v5
dp3 r0.w, r0, r2
mul r3.xyz, r0, r0.w
pow r0, r2.w, c2.x
mad r2.xyz, -r3, c5.z, r2
mov r2.w, r0.x
texld r0, v0, s0
texld r2.xyz, r2, s1
mul r2.xyz, r2, r2.w
mul r3.xyz, r2, c3.x
add r2.w, -r0, c5.y
mul r3.xyz, r3, r3
mul r2.xyz, r2.w, c1
log_pp r1.w, r1.w
mul_pp r2.xyz, -r1.w, r2
mul_pp r2.xyz, r1, r2
mul r0.xyz, r0, c0
mul r3.xyz, r2.w, r3
mad_pp r0.xyz, r0, r1, r2
add_pp oC0.xyz, r0, r3
mov_pp oC0.w, r0
"
}
}
 }
}
Fallback "Transparent"
}
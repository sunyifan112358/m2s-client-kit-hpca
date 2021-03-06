.global kfft

.metadata
	uavprivate = 0
	hwregion = 0
	hwlocal = 8704

	userElements[0]    = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1]    = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2]    = IMM_CONST_BUFFER, 1, s[8:11]

	FloatMode            = 192
	IeeeMode             = 0
	rat_op = 0x0c00	

	COMPUTE_PGM_RSRC2:USER_SGPR      = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN      = 1
	COMPUTE_PGM_RSRC2:LDS_SIZE       = 34



.args

	float* greal 0 uav11 RW
	float* gimag 16 uav10 RW

.text

  s_mov_b32     m0, 0x00008000                              // 00000000: BEFC03FF 00008000
  s_buffer_load_dword  s0, s[4:7], 0x04                     // 00000008: C2000504
  s_buffer_load_dword  s1, s[4:7], 0x18                     // 0000000C: C2008518
  s_waitcnt     lgkmcnt(0)                                  // 00000010: BF8C007F
  s_min_u32     s0, s0, 0x0000ffff                          // 00000014: 8380FF00 0000FFFF
  v_mov_b32     v1, s0                                      // 0000001C: 7E020200
  v_mul_i32_i24  v1, s12, v1                                // 00000020: 1202020C
  v_add_i32     v0, vcc, v0, v1                             // 00000024: 4A000300
  v_add_i32     v0, vcc, s1, v0                             // 00000028: 4A000001
  s_buffer_load_dword  s0, s[8:11], 0x00                    // 0000002C: C2000900
  v_and_b32     v1, 63, v0                                  // 00000030: 360200BF
  v_bfe_u32     v2, v0, 6, 22                               // 00000034: D2900002 02590D00
  v_lshlrev_b32  v3, 2, v1                                  // 0000003C: 34060282
  v_lshlrev_b32  v2, 10, v2                                 // 00000040: 3404048A
  s_movk_i32    s1, 0xfc00                                  // 00000044: B001FC00
  s_buffer_load_dword  s4, s[8:11], 0x04                    // 00000048: C2020904
  v_bfi_b32     v2, s1, v2, v3                              // 0000004C: D2940002 040E0401
  v_or_b32      v4, 0x00000300, v2                          // 00000054: 380804FF 00000300
  v_or_b32      v5, 0x00000100, v2                          // 0000005C: 380A04FF 00000100
  v_or_b32      v6, 0x00000200, v2                          // 00000064: 380C04FF 00000200
  v_lshlrev_b32  v4, 2, v4                                  // 0000006C: 34080882
  v_lshlrev_b32  v5, 2, v5                                  // 00000070: 340A0A82
  v_lshlrev_b32  v2, 2, v2                                  // 00000074: 34040482
  v_lshlrev_b32  v6, 2, v6                                  // 00000078: 340C0C82
  s_waitcnt     lgkmcnt(0)                                  // 0000007C: BF8C007F
  v_add_i32     v7, vcc, s0, v4                             // 00000080: 4A0E0800
  s_load_dwordx4  s[8:11], s[2:3], 0x58                     // 00000084: C0840358
  v_add_i32     v8, vcc, s0, v5                             // 00000088: 4A100A00
  v_add_i32     v9, vcc, s0, v2                             // 0000008C: 4A120400
  v_add_i32     v10, vcc, s0, v6                            // 00000090: 4A140C00
  v_add_i32     v4, vcc, s4, v4                             // 00000094: 4A080804
  s_load_dwordx4  s[0:3], s[2:3], 0x50                      // 00000098: C0800350
  v_add_i32     v5, vcc, s4, v5                             // 0000009C: 4A0A0A04
  v_add_i32     v2, vcc, s4, v2                             // 000000A0: 4A040404
  v_add_i32     v6, vcc, s4, v6                             // 000000A4: 4A0C0C04
  s_waitcnt     lgkmcnt(0)                                  // 000000A8: BF8C007F
  tbuffer_load_format_xyzw  v[11:14], v7, s[8:11], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 000000AC: EBF31000 80020B07
  tbuffer_load_format_xyzw  v[15:18], v8, s[8:11], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 000000B4: EBF31000 80020F08
  tbuffer_load_format_xyzw  v[19:22], v9, s[8:11], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 000000BC: EBF31000 80021309
  tbuffer_load_format_xyzw  v[23:26], v10, s[8:11], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 000000C4: EBF31000 8002170A
  tbuffer_load_format_xyzw  v[27:30], v4, s[0:3], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 000000CC: EBF31000 80001B04
  tbuffer_load_format_xyzw  v[31:34], v5, s[0:3], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 000000D4: EBF31000 80001F05
  tbuffer_load_format_xyzw  v[35:38], v2, s[0:3], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 000000DC: EBF31000 80002302
  tbuffer_load_format_xyzw  v[39:42], v6, s[0:3], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 000000E4: EBF31000 80002706
  v_mov_b32     v43, 0x00000200                             // 000000EC: 7E5602FF 00000200
  v_add_i32     v44, vcc, 1, v3                             // 000000F4: 4A580681
  v_cmp_gt_i32  s[4:5], v3, v43                             // 000000F8: D1080004 00025703
  v_mov_b32     v45, 0xfffffc00                             // 00000100: 7E5A02FF FFFFFC00
  v_add_i32     v46, vcc, 2, v3                             // 00000108: 4A5C0682
  v_cmp_gt_i32  s[6:7], v44, v43                            // 0000010C: D1080006 0002572C
  v_cndmask_b32  v47, 0, v45, s[4:5]                        // 00000114: D200002F 00125A80
  v_add_i32     v48, vcc, 3, v3                             // 0000011C: 4A600683
  v_cmp_gt_i32  s[4:5], v46, v43                            // 00000120: D1080004 0002572E
  v_cndmask_b32  v49, 0, v45, s[6:7]                        // 00000128: D2000031 001A5A80
  v_add_i32     v47, vcc, v3, v47                           // 00000130: 4A5E5F03
  v_lshlrev_b32  v50, 3, v1                                 // 00000134: 34640283
  v_mov_b32     v51, 0x00000200                             // 00000138: 7E6602FF 00000200
  v_cmp_gt_i32  s[6:7], v48, v43                            // 00000140: D1080006 00025730
  v_cndmask_b32  v43, 0, v45, s[4:5]                        // 00000148: D200002B 00125A80
  v_add_i32     v44, vcc, v44, v49                          // 00000150: 4A58632C
  v_cvt_f32_i32  v47, v47                                   // 00000154: 7E5E0B2F
  v_mov_b32     v49, 0xbbc90fdb                             // 00000158: 7E6202FF BBC90FDB
  v_add_i32     v52, vcc, 2, v50                            // 00000160: 4A686482
  v_cmp_gt_i32  s[4:5], v50, v51                            // 00000164: D1080004 00026732
  v_mov_b32     v53, 0xfffffc00                             // 0000016C: 7E6A02FF FFFFFC00
  v_cndmask_b32  v45, 0, v45, s[6:7]                        // 00000174: D200002D 001A5A80
  v_add_i32     v43, vcc, v46, v43                          // 0000017C: 4A56572E
  v_cvt_f32_i32  v44, v44                                   // 00000180: 7E580B2C
  v_mul_f32     v46, v49, v47                               // 00000184: 105C5F31
  v_mov_b32     v47, 0x3e22f983                             // 00000188: 7E5E02FF 3E22F983
  v_lshrrev_b32  v54, 3, v1                                 // 00000190: 2C6C0283
  s_waitcnt     vmcnt(6)                                    // 00000194: BF8C1F76
  v_add_f32     v55, v11, v15                               // 00000198: 066E1F0B
  s_waitcnt     vmcnt(4)                                    // 0000019C: BF8C1F74
  v_add_f32     v56, v19, v23                               // 000001A0: 06702F13
  v_add_i32     v57, vcc, 4, v50                            // 000001A4: 4A726484
  v_cmp_gt_i32  s[6:7], v52, v51                            // 000001A8: D1080006 00026734
  v_cndmask_b32  v58, 0, v53, s[4:5]                        // 000001B0: D200003A 00126A80
  v_add_i32     v45, vcc, v48, v45                          // 000001B8: 4A5A5B30
  v_cvt_f32_i32  v43, v43                                   // 000001BC: 7E560B2B
  v_mul_f32     v44, v44, v49                               // 000001C0: 1058632C
  v_mul_legacy_f32  v48, v47, v46                           // 000001C4: 0E605D2F
  v_mov_b32     v59, 0x80000000                             // 000001C8: 7E7602FF 80000000
  v_add_i32     v54, vcc, v3, v54                           // 000001D0: 4A6C6D03
  v_add_f32     v60, v12, v16                               // 000001D4: 0678210C
  v_add_f32     v61, v20, v24                               // 000001D8: 067A3114
  v_add_f32     v62, v55, v56                               // 000001DC: 067C7137
  v_add_i32     v63, vcc, 6, v50                            // 000001E0: 4A7E6486
  v_cmp_gt_i32  s[4:5], v57, v51                            // 000001E4: D1080004 00026739
  v_cndmask_b32  v64, 0, v53, s[6:7]                        // 000001EC: D2000040 001A6A80
  v_add_i32     v50, vcc, v50, v58                          // 000001F4: 4A647532
  v_cvt_f32_i32  v45, v45                                   // 000001F8: 7E5A0B2D
  v_mul_f32     v43, v43, v49                               // 000001FC: 1056632B
  v_mul_legacy_f32  v58, v44, v47                           // 00000200: 0E745F2C
  v_and_b32     v46, v59, v46                               // 00000204: 365C5D3B
  v_fract_f32   v48, abs(v48)                               // 00000208: D3400130 00000130
  v_lshlrev_b32  v54, 2, v54                                // 00000210: 346C6C82
  v_add_f32     v65, v13, v17                               // 00000214: 0682230D
  v_add_f32     v66, v21, v25                               // 00000218: 06843315
  v_add_f32     v67, v60, v61                               // 0000021C: 06867B3C
  v_mul_i32_i24  v68, v3, 3                                 // 00000220: D2120044 00010703
  v_mov_b32     v69, 0x00000200                             // 00000228: 7E8A02FF 00000200
  v_cmp_gt_i32  s[6:7], v63, v51                            // 00000230: D1080006 0002673F
  v_cndmask_b32  v51, 0, v53, s[4:5]                        // 00000238: D2000033 00126A80
  v_add_i32     v52, vcc, v52, v64                          // 00000240: 4A688134
  v_cvt_f32_i32  v50, v50                                   // 00000244: 7E640B32
  v_mov_b32     v64, 0xbbc90fdb                             // 00000248: 7E8002FF BBC90FDB
  v_mul_f32     v45, v45, v49                               // 00000250: 105A632D
  v_mul_legacy_f32  v49, v43, v47                           // 00000254: 0E625F2B
  v_and_b32     v44, v44, v59                               // 00000258: 3658772C
  v_fract_f32   v58, abs(v58)                               // 0000025C: D340013A 0000013A
  v_or_b32      v46, v46, v48                               // 00000264: 385C612E
  s_waitcnt     vmcnt(2)                                    // 00000268: BF8C1F72
  ds_write_b32  v54, v62                                    // 0000026C: D8340000 00003E36
  v_add_i32     v48, vcc, 4, v54                            // 00000274: 4A606C84
  v_subrev_f32  v62, v27, v31                               // 00000278: 0A7C3F1B
  v_sub_f32     v19, v19, v23                               // 0000027C: 08262F13
  v_add_f32     v23, v14, v18                               // 00000280: 062E250E
  v_add_f32     v70, v22, v26                               // 00000284: 068C3516
  v_add_f32     v71, v65, v66                               // 00000288: 068E8541
  v_add_i32     v72, vcc, 3, v68                            // 0000028C: 4A908883
  v_cmp_gt_i32  s[4:5], v68, v69                            // 00000290: D1080004 00028B44
  v_mov_b32     v73, 0xfffffc00                             // 00000298: 7E9202FF FFFFFC00
  v_cndmask_b32  v53, 0, v53, s[6:7]                        // 000002A0: D2000035 001A6A80
  v_add_i32     v51, vcc, v57, v51                          // 000002A8: 4A666739
  v_cvt_f32_i32  v52, v52                                   // 000002AC: 7E680B34
  v_mul_f32     v50, v64, v50                               // 000002B0: 10646540
  v_mov_b32     v57, 0x3e22f983                             // 000002B4: 7E7202FF 3E22F983
  v_mul_legacy_f32  v47, v45, v47                           // 000002BC: 0E5E5F2D
  v_and_b32     v43, v43, v59                               // 000002C0: 3656772B
  v_fract_f32   v49, abs(v49)                               // 000002C4: D3400131 00000131
  v_or_b32      v44, v44, v58                               // 000002CC: 3858752C
  v_cos_f32     v58, v46                                    // 000002D0: 7E746D2E
  ds_write_b32  v48, v67                                    // 000002D4: D8340000 00004330
  v_add_i32     v67, vcc, 8, v54                            // 000002DC: 4A866C88
  v_subrev_f32  v11, v11, v15                               // 000002E0: 0A161F0B
  s_waitcnt     vmcnt(0)                                    // 000002E4: BF8C1F70
  v_sub_f32     v15, v35, v39                               // 000002E8: 081E4F23
  v_subrev_f32  v74, v28, v32                               // 000002EC: 0A94411C
  v_sub_f32     v20, v20, v24                               // 000002F0: 08283114
  v_add_f32     v24, v62, v19                               // 000002F4: 0630273E
  v_add_f32     v75, v23, v70                               // 000002F8: 06968D17
  v_add_i32     v76, vcc, 6, v68                            // 000002FC: 4A988886
  v_cmp_gt_i32  s[6:7], v72, v69                            // 00000300: D1080006 00028B48
  v_cndmask_b32  v77, 0, v73, s[4:5]                        // 00000308: D200004D 00129280
  v_add_i32     v53, vcc, v63, v53                          // 00000310: 4A6A6B3F
  v_cvt_f32_i32  v51, v51                                   // 00000314: 7E660B33
  v_mul_f32     v52, v52, v64                               // 00000318: 10688134
  v_mul_legacy_f32  v63, v57, v50                           // 0000031C: 0E7E6539
  v_mov_b32     v78, 0x80000000                             // 00000320: 7E9C02FF 80000000
  v_and_b32     v45, v45, v59                               // 00000328: 365A772D
  v_fract_f32   v47, abs(v47)                               // 0000032C: D340012F 0000012F
  v_or_b32      v43, v43, v49                               // 00000334: 3856632B
  v_cos_f32     v49, v44                                    // 00000338: 7E626D2C
  v_sin_f32     v46, v46                                    // 0000033C: 7E5C6B2E
  ds_write_b32  v67, v71                                    // 00000340: D8340000 00004743
  v_add_i32     v59, vcc, 12, v54                           // 00000348: 4A766C8C
  v_subrev_f32  v12, v12, v16                               // 0000034C: 0A18210C
  v_sub_f32     v16, v36, v40                               // 00000350: 08205124
  v_subrev_f32  v71, v11, v15                               // 00000354: 0A8E1F0B
  v_subrev_f32  v79, v29, v33                               // 00000358: 0A9E431D
  v_sub_f32     v21, v21, v25                               // 0000035C: 082A3315
  v_add_f32     v25, v74, v20                               // 00000360: 0632294A
  v_mul_f32     v80, v58, v24                               // 00000364: 10A0313A
  v_add_i32     v81, vcc, 9, v68                            // 00000368: 4AA28889
  v_cmp_gt_i32  s[4:5], v76, v69                            // 0000036C: D1080004 00028B4C
  v_cndmask_b32  v82, 0, v73, s[6:7]                        // 00000374: D2000052 001A9280
  v_add_i32     v68, vcc, v68, v77                          // 0000037C: 4A889B44
  v_cvt_f32_i32  v53, v53                                   // 00000380: 7E6A0B35
  v_mul_f32     v51, v51, v64                               // 00000384: 10668133
  v_mul_legacy_f32  v77, v52, v57                           // 00000388: 0E9A7334
  v_and_b32     v50, v78, v50                               // 0000038C: 3664654E
  v_fract_f32   v63, abs(v63)                               // 00000390: D340013F 0000013F
  v_or_b32      v45, v45, v47                               // 00000398: 385A5F2D
  v_cos_f32     v47, v43                                    // 0000039C: 7E5E6D2B
  v_sin_f32     v44, v44                                    // 000003A0: 7E586B2C
  ds_write_b32  v59, v75                                    // 000003A4: D8340000 00004B3B
  v_subrev_f32  v13, v13, v17                               // 000003AC: 0A1A230D
  v_sub_f32     v17, v37, v41                               // 000003B0: 08225325
  v_subrev_f32  v75, v12, v16                               // 000003B4: 0A96210C
  v_subrev_f32  v83, v30, v34                               // 000003B8: 0AA6451E
  v_sub_f32     v22, v22, v26                               // 000003BC: 082C3516
  v_add_f32     v26, v79, v21                               // 000003C0: 06342B4F
  v_mul_f32     v84, v49, v25                               // 000003C4: 10A83331
  v_mad_f32     v80, -v46, v71, v80                         // 000003C8: D2820050 25428F2E
  v_add_i32     v85, vcc, 0x00000420, v54                   // 000003D0: 4AAA6CFF 00000420
  v_cmp_gt_i32  s[6:7], v81, v69                            // 000003D8: D1080006 00028B51
  v_cndmask_b32  v69, 0, v73, s[4:5]                        // 000003E0: D2000045 00129280
  v_add_i32     v72, vcc, v72, v82                          // 000003E8: 4A90A548
  v_cvt_f32_i32  v68, v68                                   // 000003EC: 7E880B44
  v_mov_b32     v82, 0xbbc90fdb                             // 000003F0: 7EA402FF BBC90FDB
  v_mul_f32     v53, v53, v64                               // 000003F8: 106A8135
  v_mul_legacy_f32  v64, v51, v57                           // 000003FC: 0E807333
  v_and_b32     v52, v52, v78                               // 00000400: 36689D34
  v_fract_f32   v77, abs(v77)                               // 00000404: D340014D 0000014D
  v_or_b32      v50, v50, v63                               // 0000040C: 38647F32
  v_cos_f32     v63, v45                                    // 00000410: 7E7E6D2D
  v_sin_f32     v43, v43                                    // 00000414: 7E566B2B
  v_subrev_f32  v14, v14, v18                               // 00000418: 0A1C250E
  v_sub_f32     v18, v38, v42                               // 0000041C: 08245526
  v_subrev_f32  v86, v13, v17                               // 00000420: 0AAC230D
  v_add_f32     v87, v83, v22                               // 00000424: 06AE2D53
  v_mul_f32     v88, v47, v26                               // 00000428: 10B0352F
  v_mad_f32     v84, -v44, v75, v84                         // 0000042C: D2820054 2552972C
  ds_write_b32  v85, v80                                    // 00000434: D8340000 00005055
  v_add_i32     v80, vcc, 0x00000424, v54                   // 0000043C: 4AA06CFF 00000424
  v_cndmask_b32  v73, 0, v73, s[6:7]                        // 00000444: D2000049 001A9280
  v_add_i32     v69, vcc, v76, v69                          // 0000044C: 4A8A8B4C
  v_cvt_f32_i32  v72, v72                                   // 00000450: 7E900B48
  v_mul_f32     v68, v82, v68                               // 00000454: 10888952
  v_mov_b32     v76, 0x3e22f983                             // 00000458: 7E9802FF 3E22F983
  v_mul_legacy_f32  v57, v53, v57                           // 00000460: 0E727335
  v_and_b32     v51, v51, v78                               // 00000464: 36669D33
  v_fract_f32   v64, abs(v64)                               // 00000468: D3400140 00000140
  v_or_b32      v52, v52, v77                               // 00000470: 38689B34
  v_cos_f32     v77, v50                                    // 00000474: 7E9A6D32
  v_sin_f32     v45, v45                                    // 00000478: 7E5A6B2D
  v_subrev_f32  v89, v14, v18                               // 0000047C: 0AB2250E
  v_mul_f32     v90, v63, v87                               // 00000480: 10B4AF3F
  v_mad_f32     v88, -v43, v86, v88                         // 00000484: D2820058 2562AD2B
  ds_write_b32  v80, v84                                    // 0000048C: D8340000 00005450
  v_add_i32     v84, vcc, 0x00000428, v54                   // 00000494: 4AA86CFF 00000428
  v_add_f32     v27, v27, v31                               // 0000049C: 06363F1B
  v_add_f32     v31, v35, v39                               // 000004A0: 063E4F23
  v_subrev_f32  v35, v55, v56                               // 000004A4: 0A467137
  v_add_i32     v39, vcc, v81, v73                          // 000004A8: 4A4E9351
  v_cvt_f32_i32  v55, v69                                   // 000004AC: 7E6E0B45
  v_mul_f32     v56, v72, v82                               // 000004B0: 1070A548
  v_mul_legacy_f32  v69, v76, v68                           // 000004B4: 0E8A894C
  v_mov_b32     v72, 0x80000000                             // 000004B8: 7E9002FF 80000000
  v_and_b32     v53, v53, v78                               // 000004C0: 366A9D35
  v_fract_f32   v57, abs(v57)                               // 000004C4: D3400139 00000139
  v_or_b32      v51, v51, v64                               // 000004CC: 38668133
  v_cos_f32     v64, v52                                    // 000004D0: 7E806D34
  v_sin_f32     v50, v50                                    // 000004D4: 7E646B32
  v_mad_f32     v90, -v45, v89, v90                         // 000004D8: D282005A 256AB32D
  ds_write_b32  v84, v88                                    // 000004E0: D8340000 00005854
  v_add_i32     v73, vcc, 0x0000042c, v54                   // 000004E8: 4A926CFF 0000042C
  v_add_f32     v28, v28, v32                               // 000004F0: 0638411C
  v_add_f32     v32, v36, v40                               // 000004F4: 06405124
  v_subrev_f32  v36, v27, v31                               // 000004F8: 0A483F1B
  v_subrev_f32  v40, v60, v61                               // 000004FC: 0A507B3C
  v_mul_f32     v60, v77, v35                               // 00000500: 1078474D
  v_cvt_f32_i32  v39, v39                                   // 00000504: 7E4E0B27
  v_mul_f32     v55, v55, v82                               // 00000508: 106EA537
  v_mul_legacy_f32  v61, v56, v76                           // 0000050C: 0E7A9938
  v_and_b32     v68, v72, v68                               // 00000510: 36888948
  v_fract_f32   v69, abs(v69)                               // 00000514: D3400145 00000145
  v_or_b32      v53, v53, v57                               // 0000051C: 386A7335
  v_cos_f32     v57, v51                                    // 00000520: 7E726D33
  v_sin_f32     v52, v52                                    // 00000524: 7E686B34
  ds_write_b32  v73, v90                                    // 00000528: D8340000 00005A49
  v_add_f32     v29, v29, v33                               // 00000530: 063A431D
  v_add_f32     v33, v37, v41                               // 00000534: 06425325
  v_subrev_f32  v37, v28, v32                               // 00000538: 0A4A411C
  v_subrev_f32  v41, v65, v66                               // 0000053C: 0A528541
  v_mul_f32     v65, v64, v40                               // 00000540: 10825140
  v_mad_f32     v60, -v50, v36, v60                         // 00000544: D282003C 24F24932
  v_add_i32     v66, vcc, 0x00000840, v54                   // 0000054C: 4A846CFF 00000840
  v_mul_f32     v39, v39, v82                               // 00000554: 104EA527
  v_mul_legacy_f32  v78, v55, v76                           // 00000558: 0E9C9937
  v_and_b32     v56, v56, v72                               // 0000055C: 36709138
  v_fract_f32   v61, abs(v61)                               // 00000560: D340013D 0000013D
  v_or_b32      v68, v68, v69                               // 00000568: 38888B44
  v_cos_f32     v69, v53                                    // 0000056C: 7E8A6D35
  v_sin_f32     v51, v51                                    // 00000570: 7E666B33
  v_add_f32     v30, v30, v34                               // 00000574: 063C451E
  v_add_f32     v34, v38, v42                               // 00000578: 06445526
  v_subrev_f32  v38, v29, v33                               // 0000057C: 0A4C431D
  v_subrev_f32  v23, v23, v70                               // 00000580: 0A2E8D17
  v_mul_f32     v42, v57, v41                               // 00000584: 10545339
  v_mad_f32     v65, -v52, v37, v65                         // 00000588: D2820041 25064B34
  ds_write_b32  v66, v60                                    // 00000590: D8340000 00003C42
  v_add_i32     v60, vcc, 0x00000844, v54                   // 00000598: 4A786CFF 00000844
  v_mul_legacy_f32  v70, v39, v76                           // 000005A0: 0E8C9927
  v_and_b32     v55, v55, v72                               // 000005A4: 366E9137
  v_fract_f32   v76, abs(v78)                               // 000005A8: D340014C 0000014E
  v_or_b32      v56, v56, v61                               // 000005B0: 38707B38
  v_cos_f32     v61, v68                                    // 000005B4: 7E7A6D44
  v_sin_f32     v53, v53                                    // 000005B8: 7E6A6B35
  v_subrev_f32  v78, v30, v34                               // 000005BC: 0A9C451E
  v_mul_f32     v81, v69, v23                               // 000005C0: 10A22F45
  v_mad_f32     v42, -v51, v38, v42                         // 000005C4: D282002A 24AA4D33
  ds_write_b32  v60, v65                                    // 000005CC: D8340000 0000413C
  v_add_i32     v65, vcc, 0x00000848, v54                   // 000005D4: 4A826CFF 00000848
  v_subrev_f32  v19, v62, v19                               // 000005DC: 0A26273E
  v_and_b32     v39, v39, v72                               // 000005E0: 364E9127
  v_fract_f32   v62, abs(v70)                               // 000005E4: D340013E 00000146
  v_or_b32      v55, v55, v76                               // 000005EC: 386E9937
  v_cos_f32     v70, v56                                    // 000005F0: 7E8C6D38
  v_sin_f32     v68, v68                                    // 000005F4: 7E886B44
  v_mad_f32     v81, -v53, v78, v81                         // 000005F8: D2820051 25469D35
  ds_write_b32  v65, v42                                    // 00000600: D8340000 00002A41
  v_add_i32     v42, vcc, 0x0000084c, v54                   // 00000608: 4A546CFF 0000084C
  v_add_f32     v11, v11, v15                               // 00000610: 06161F0B
  v_subrev_f32  v15, v74, v20                               // 00000614: 0A1E294A
  v_mul_f32     v20, v61, v19                               // 00000618: 1028273D
  v_or_b32      v39, v39, v62                               // 0000061C: 384E7D27
  v_cos_f32     v62, v55                                    // 00000620: 7E7C6D37
  v_sin_f32     v56, v56                                    // 00000624: 7E706B38
  ds_write_b32  v42, v81                                    // 00000628: D8340000 0000512A
  v_add_f32     v12, v12, v16                               // 00000630: 0618210C
  v_subrev_f32  v16, v79, v21                               // 00000634: 0A202B4F
  v_mul_f32     v21, v70, v15                               // 00000638: 102A1F46
  v_mad_f32     v20, -v68, v11, v20                         // 0000063C: D2820014 24521744
  v_add_i32     v72, vcc, 0x00000c60, v54                   // 00000644: 4A906CFF 00000C60
  v_cos_f32     v74, v39                                    // 0000064C: 7E946D27
  v_sin_f32     v55, v55                                    // 00000650: 7E6E6B37
  v_add_f32     v13, v13, v17                               // 00000654: 061A230D
  v_subrev_f32  v17, v83, v22                               // 00000658: 0A222D53
  v_mul_f32     v22, v62, v16                               // 0000065C: 102C213E
  v_mad_f32     v21, -v56, v12, v21                         // 00000660: D2820015 24561938
  ds_write_b32  v72, v20                                    // 00000668: D8340000 00001448
  v_add_i32     v20, vcc, 0x00000c64, v54                   // 00000670: 4A286CFF 00000C64
  v_sin_f32     v39, v39                                    // 00000678: 7E4E6B27
  v_add_f32     v14, v14, v18                               // 0000067C: 061C250E
  v_mul_f32     v18, v74, v17                               // 00000680: 1024234A
  v_mad_f32     v22, -v55, v13, v22                         // 00000684: D2820016 245A1B37
  ds_write_b32  v20, v21                                    // 0000068C: D8340000 00001514
  v_add_i32     v21, vcc, 0x00000c68, v54                   // 00000694: 4A2A6CFF 00000C68
  v_mad_f32     v18, -v39, v14, v18                         // 0000069C: D2820012 244A1D27
  ds_write_b32  v21, v22                                    // 000006A4: D8340000 00001615
  v_add_i32     v22, vcc, 0x00000c6c, v54                   // 000006AC: 4A2C6CFF 00000C6C
  ds_write_b32  v22, v18                                    // 000006B4: D8340000 00001216
  v_add_f32     v18, v27, v31                               // 000006BC: 06243F1B
  v_add_i32     v27, vcc, 0x00001080, v54                   // 000006C0: 4A366CFF 00001080
  v_add_f32     v28, v28, v32                               // 000006C8: 0638411C
  ds_write_b32  v27, v18                                    // 000006CC: D8340000 0000121B
  v_add_i32     v18, vcc, 0x00001084, v54                   // 000006D4: 4A246CFF 00001084
  v_add_f32     v29, v29, v33                               // 000006DC: 063A431D
  ds_write_b32  v18, v28                                    // 000006E0: D8340000 00001C12
  v_add_i32     v28, vcc, 0x00001088, v54                   // 000006E8: 4A386CFF 00001088
  v_add_f32     v30, v30, v34                               // 000006F0: 063C451E
  ds_write_b32  v28, v29                                    // 000006F4: D8340000 00001D1C
  v_add_i32     v29, vcc, 0x0000108c, v54                   // 000006FC: 4A3A6CFF 0000108C
  v_mul_f32     v31, v58, v71                               // 00000704: 103E8F3A
  ds_write_b32  v29, v30                                    // 00000708: D8340000 00001E1D
  v_mul_f32     v30, v49, v75                               // 00000710: 103C9731
  v_mac_f32     v31, v46, v24                               // 00000714: 3E3E312E
  v_add_i32     v24, vcc, 0x000014a0, v54                   // 00000718: 4A306CFF 000014A0
  v_mul_f32     v32, v47, v86                               // 00000720: 1040AD2F
  v_mac_f32     v30, v44, v25                               // 00000724: 3E3C332C
  ds_write_b32  v24, v31                                    // 00000728: D8340000 00001F18
  v_add_i32     v25, vcc, 0x000014a4, v54                   // 00000730: 4A326CFF 000014A4
  v_mul_f32     v31, v63, v89                               // 00000738: 103EB33F
  v_mac_f32     v32, v43, v26                               // 0000073C: 3E40352B
  ds_write_b32  v25, v30                                    // 00000740: D8340000 00001E19
  v_add_i32     v26, vcc, 0x000014a8, v54                   // 00000748: 4A346CFF 000014A8
  v_mac_f32     v31, v45, v87                               // 00000750: 3E3EAF2D
  ds_write_b32  v26, v32                                    // 00000754: D8340000 0000201A
  v_add_i32     v30, vcc, 0x000014ac, v54                   // 0000075C: 4A3C6CFF 000014AC
  v_mul_f32     v32, v77, v36                               // 00000764: 1040494D
  ds_write_b32  v30, v31                                    // 00000768: D8340000 00001F1E
  v_mul_f32     v31, v64, v37                               // 00000770: 103E4B40
  v_mac_f32     v32, v50, v35                               // 00000774: 3E404732
  v_add_i32     v33, vcc, 0x000018c0, v54                   // 00000778: 4A426CFF 000018C0
  v_mul_f32     v34, v57, v38                               // 00000780: 10444D39
  v_mac_f32     v31, v52, v40                               // 00000784: 3E3E5134
  ds_write_b32  v33, v32                                    // 00000788: D8340000 00002021
  v_add_i32     v32, vcc, 0x000018c4, v54                   // 00000790: 4A406CFF 000018C4
  v_mul_f32     v35, v69, v78                               // 00000798: 10469D45
  v_mac_f32     v34, v51, v41                               // 0000079C: 3E445333
  ds_write_b32  v32, v31                                    // 000007A0: D8340000 00001F20
  v_add_i32     v31, vcc, 0x000018c8, v54                   // 000007A8: 4A3E6CFF 000018C8
  v_mac_f32     v35, v53, v23                               // 000007B0: 3E462F35
  ds_write_b32  v31, v34                                    // 000007B4: D8340000 0000221F
  v_add_i32     v23, vcc, 0x000018cc, v54                   // 000007BC: 4A2E6CFF 000018CC
  v_mul_f32     v11, v61, v11                               // 000007C4: 1016173D
  ds_write_b32  v23, v35                                    // 000007C8: D8340000 00002317
  v_mul_f32     v12, v70, v12                               // 000007D0: 10181946
  v_mac_f32     v11, v68, v19                               // 000007D4: 3E162744
  v_add_i32     v19, vcc, 0x00001ce0, v54                   // 000007D8: 4A266CFF 00001CE0
  v_mul_f32     v13, v62, v13                               // 000007E0: 101A1B3E
  v_mac_f32     v12, v56, v15                               // 000007E4: 3E181F38
  ds_write_b32  v19, v11                                    // 000007E8: D8340000 00000B13
  v_add_i32     v11, vcc, 0x00001ce4, v54                   // 000007F0: 4A166CFF 00001CE4
  v_mul_f32     v14, v74, v14                               // 000007F8: 101C1D4A
  v_mac_f32     v13, v55, v16                               // 000007FC: 3E1A2137
  ds_write_b32  v11, v12                                    // 00000800: D8340000 00000C0B
  v_add_i32     v12, vcc, 0x00001ce8, v54                   // 00000808: 4A186CFF 00001CE8
  v_lshrrev_b32  v15, 5, v1                                 // 00000810: 2C1E0285
  v_mac_f32     v14, v39, v17                               // 00000814: 3E1C2327
  ds_write_b32  v12, v13                                    // 00000818: D8340000 00000D0C
  v_add_i32     v13, vcc, 0x00001cec, v54                   // 00000820: 4A1A6CFF 00001CEC
  v_add_i32     v15, vcc, v1, v15                           // 00000828: 4A1E1F01
  ds_write_b32  v13, v14                                    // 0000082C: D8340000 00000E0D
  v_lshlrev_b32  v14, 2, v15                                // 00000834: 341C1E82
  s_waitcnt     lgkmcnt(0)                                  // 00000838: BF8C007F
  s_barrier                                                 // 0000083C: BF8A0000
  v_add_i32     v15, vcc, 0x00000f78, v14                   // 00000840: 4A1E1CFF 00000F78
  v_add_i32     v16, vcc, 0x00000318, v14                   // 00000848: 4A201CFF 00000318
  v_add_i32     v17, vcc, 0x00000b58, v14                   // 00000850: 4A221CFF 00000B58
  v_add_i32     v34, vcc, 0x00000738, v14                   // 00000858: 4A441CFF 00000738
  v_add_i32     v35, vcc, 0x00000d68, v14                   // 00000860: 4A461CFF 00000D68
  v_add_i32     v36, vcc, 0x00000108, v14                   // 00000868: 4A481CFF 00000108
  v_add_i32     v37, vcc, 0x00000948, v14                   // 00000870: 4A4A1CFF 00000948
  v_add_i32     v38, vcc, 0x00000528, v14                   // 00000878: 4A4C1CFF 00000528
  v_add_i32     v39, vcc, 0x00000e70, v14                   // 00000880: 4A4E1CFF 00000E70
  v_add_i32     v40, vcc, 0x00000210, v14                   // 00000888: 4A501CFF 00000210
  v_add_i32     v41, vcc, 0x00000a50, v14                   // 00000890: 4A521CFF 00000A50
  v_add_i32     v43, vcc, 0x00000630, v14                   // 00000898: 4A561CFF 00000630
  v_add_i32     v44, vcc, 0x00000c60, v14                   // 000008A0: 4A581CFF 00000C60
  v_add_i32     v45, vcc, 0x00000840, v14                   // 000008A8: 4A5A1CFF 00000840
  v_add_i32     v46, vcc, 0x00000420, v14                   // 000008B0: 4A5C1CFF 00000420
  v_mul_i32_i24  v47, v1, 12                                // 000008B8: D212002F 00011901
  s_movk_i32    s4, 0x0200                                  // 000008C0: B0040200
  v_or_b32      v49, 0xfffffc00, v47                        // 000008C4: 38625EFF FFFFFC00
  v_cmp_lt_u32  vcc, s4, v47                                // 000008CC: 7D825E04
  ds_read_b32   v50, v15                                    // 000008D0: D8D80000 3200000F
  ds_read_b32   v51, v16                                    // 000008D8: D8D80000 33000010
  ds_read_b32   v52, v17                                    // 000008E0: D8D80000 34000011
  ds_read_b32   v53, v34                                    // 000008E8: D8D80000 35000022
  ds_read_b32   v55, v35                                    // 000008F0: D8D80000 37000023
  ds_read_b32   v56, v36                                    // 000008F8: D8D80000 38000024
  ds_read_b32   v57, v37                                    // 00000900: D8D80000 39000025
  ds_read_b32   v58, v38                                    // 00000908: D8D80000 3A000026
  ds_read_b32   v61, v39                                    // 00000910: D8D80000 3D000027
  ds_read_b32   v62, v40                                    // 00000918: D8D80000 3E000028
  ds_read_b32   v63, v41                                    // 00000920: D8D80000 3F000029
  ds_read_b32   v64, v43                                    // 00000928: D8D80000 4000002B
  ds_read_b32   v68, v44                                    // 00000930: D8D80000 4400002C
  ds_read_b32   v69, v14                                    // 00000938: D8D80000 4500000E
  ds_read_b32   v70, v45                                    // 00000940: D8D80000 4600002D
  ds_read_b32   v71, v46                                    // 00000948: D8D80000 4700002E
  v_cndmask_b32  v47, v47, v49, vcc                         // 00000950: 005E632F
  v_lshlrev_b32  v49, 3, v1                                 // 00000954: 34620283
  v_cvt_f32_i32  v47, v47                                   // 00000958: 7E5E0B2F
  v_add_i32     v74, vcc, 0x000015a8, v14                   // 0000095C: 4A941CFF 000015A8
  v_add_i32     v75, vcc, 0x000019c8, v14                   // 00000964: 4A961CFF 000019C8
  v_add_i32     v76, vcc, 0x00001de8, v14                   // 0000096C: 4A981CFF 00001DE8
  v_add_i32     v77, vcc, 0x00001188, v14                   // 00000974: 4A9A1CFF 00001188
  v_add_i32     v78, vcc, 0x000017b8, v14                   // 0000097C: 4A9C1CFF 000017B8
  v_add_i32     v79, vcc, 0x00001bd8, v14                   // 00000984: 4A9E1CFF 00001BD8
  v_add_i32     v81, vcc, 0x00001ff8, v14                   // 0000098C: 4AA21CFF 00001FF8
  v_add_i32     v82, vcc, 0x00001398, v14                   // 00000994: 4AA41CFF 00001398
  v_add_i32     v83, vcc, 0x000014a0, v14                   // 0000099C: 4AA61CFF 000014A0
  v_add_i32     v86, vcc, 0x000018c0, v14                   // 000009A4: 4AAC1CFF 000018C0
  v_add_i32     v87, vcc, 0x00001ce0, v14                   // 000009AC: 4AAE1CFF 00001CE0
  v_add_i32     v88, vcc, 0x00001080, v14                   // 000009B4: 4AB01CFF 00001080
  v_add_i32     v89, vcc, 0x000016b0, v14                   // 000009BC: 4AB21CFF 000016B0
  v_add_i32     v90, vcc, 0x00001ad0, v14                   // 000009C4: 4AB41CFF 00001AD0
  v_add_i32     v91, vcc, 0x00001ef0, v14                   // 000009CC: 4AB61CFF 00001EF0
  v_add_i32     v92, vcc, 0x00001290, v14                   // 000009D4: 4AB81CFF 00001290
  v_cvt_f32_i32  v49, v49                                   // 000009DC: 7E620B31
  v_cvt_f32_i32  v93, v3                                    // 000009E0: 7EBA0B03
  v_mul_f32     v47, 0xbbc90fdb, v47                        // 000009E4: 105E5EFF BBC90FDB
  v_mul_f32     v49, 0xbbc90fdb, v49                        // 000009EC: 106262FF BBC90FDB
  v_mul_f32     v93, 0xbbc90fdb, v93                        // 000009F4: 10BABAFF BBC90FDB
  v_mul_legacy_f32  v94, 0x3e22f983, v47                    // 000009FC: 0EBC5EFF 3E22F983
  v_mul_legacy_f32  v95, 0x3e22f983, v49                    // 00000A04: 0EBE62FF 3E22F983
  v_mul_legacy_f32  v96, 0x3e22f983, v93                    // 00000A0C: 0EC0BAFF 3E22F983
  v_and_b32     v47, 0x80000000, v47                        // 00000A14: 365E5EFF 80000000
  v_fract_f32   v94, abs(v94)                               // 00000A1C: D340015E 0000015E
  v_and_b32     v49, 0x80000000, v49                        // 00000A24: 366262FF 80000000
  v_fract_f32   v95, abs(v95)                               // 00000A2C: D340015F 0000015F
  v_and_b32     v93, 0x80000000, v93                        // 00000A34: 36BABAFF 80000000
  v_fract_f32   v96, abs(v96)                               // 00000A3C: D3400160 00000160
  s_waitcnt     lgkmcnt(10)                                 // 00000A44: BF8C0A7F
  v_add_f32     v97, v51, v56                               // 00000A48: 06C27133
  s_waitcnt     lgkmcnt(8)                                  // 00000A4C: BF8C087F
  v_add_f32     v98, v53, v58                               // 00000A50: 06C47535
  v_add_f32     v99, v52, v57                               // 00000A54: 06C67334
  v_add_f32     v100, v50, v55                              // 00000A58: 06C86F32
  s_waitcnt     lgkmcnt(2)                                  // 00000A5C: BF8C027F
  v_add_f32     v101, v62, v69                              // 00000A60: 06CA8B3E
  s_waitcnt     lgkmcnt(0)                                  // 00000A64: BF8C007F
  v_add_f32     v102, v64, v71                              // 00000A68: 06CC8F40
  v_add_f32     v103, v63, v70                              // 00000A6C: 06CE8D3F
  v_add_f32     v104, v61, v68                              // 00000A70: 06D0893D
  v_or_b32      v47, v47, v94                               // 00000A74: 385EBD2F
  v_or_b32      v49, v49, v95                               // 00000A78: 3862BF31
  v_or_b32      v93, v93, v96                               // 00000A7C: 38BAC15D
  v_add_f32     v94, v97, v101                              // 00000A80: 06BCCB61
  v_add_f32     v95, v98, v102                              // 00000A84: 06BECD62
  v_add_f32     v96, v99, v103                              // 00000A88: 06C0CF63
  v_add_f32     v105, v100, v104                            // 00000A8C: 06D2D164
  v_cos_f32     v106, v47                                   // 00000A90: 7ED46D2F
  v_sin_f32     v47, v47                                    // 00000A94: 7E5E6B2F
  ds_read_b32   v107, v74                                   // 00000A98: D8D80000 6B00004A
  ds_read_b32   v108, v75                                   // 00000AA0: D8D80000 6C00004B
  ds_read_b32   v109, v76                                   // 00000AA8: D8D80000 6D00004C
  ds_read_b32   v110, v77                                   // 00000AB0: D8D80000 6E00004D
  ds_read_b32   v111, v78                                   // 00000AB8: D8D80000 6F00004E
  ds_read_b32   v112, v79                                   // 00000AC0: D8D80000 7000004F
  ds_read_b32   v113, v81                                   // 00000AC8: D8D80000 71000051
  ds_read_b32   v114, v82                                   // 00000AD0: D8D80000 72000052
  ds_read_b32   v115, v83                                   // 00000AD8: D8D80000 73000053
  ds_read_b32   v116, v86                                   // 00000AE0: D8D80000 74000056
  ds_read_b32   v117, v87                                   // 00000AE8: D8D80000 75000057
  ds_read_b32   v118, v88                                   // 00000AF0: D8D80000 76000058
  ds_read_b32   v119, v89                                   // 00000AF8: D8D80000 77000059
  ds_read_b32   v120, v90                                   // 00000B00: D8D80000 7800005A
  ds_read_b32   v121, v91                                   // 00000B08: D8D80000 7900005B
  ds_read_b32   v122, v92                                   // 00000B10: D8D80000 7A00005C
  v_cos_f32     v123, v49                                   // 00000B18: 7EF66D31
  v_sin_f32     v49, v49                                    // 00000B1C: 7E626B31
  v_cos_f32     v124, v93                                   // 00000B20: 7EF86D5D
  v_sin_f32     v93, v93                                    // 00000B24: 7EBA6B5D
  s_waitcnt     lgkmcnt(0)                                  // 00000B28: BF8C007F
  s_barrier                                                 // 00000B2C: BF8A0000
  v_sub_f32     v125, v110, v114                            // 00000B30: 08FAE56E
  v_subrev_f32  v62, v62, v69                               // 00000B34: 0A7C8B3E
  v_subrev_f32  v51, v51, v56                               // 00000B38: 0A667133
  v_sub_f32     v56, v118, v122                             // 00000B3C: 0870F576
  v_add_f32     v69, v125, v62                              // 00000B40: 068A7D7D
  v_subrev_f32  v126, v51, v56                              // 00000B44: 0AFC7133
  v_mul_f32     v127, v124, v69                             // 00000B48: 10FE8B7C
  v_add_f32     v110, v110, v114                            // 00000B4C: 06DCE56E
  v_add_f32     v114, v118, v122                            // 00000B50: 06E4F576
  v_subrev_f32  v97, v97, v101                              // 00000B54: 0AC2CB61
  ds_write_b32  v54, v94                                    // 00000B58: D8340000 00005E36
  v_mad_f32     v127, -v93, v126, v127                      // 00000B60: D282007F 25FEFD5D
  v_subrev_f32  v54, v110, v114                             // 00000B68: 0A6CE56E
  v_mul_f32     v94, v123, v97                              // 00000B6C: 10BCC37B
  v_subrev_f32  v62, v125, v62                              // 00000B70: 0A7C7D7D
  v_sub_f32     v101, v107, v111                            // 00000B74: 08CADF6B
  v_subrev_f32  v64, v64, v71                               // 00000B78: 0A808F40
  ds_write_b32  v48, v127                                   // 00000B7C: D8340000 00007F30
  v_mad_f32     v94, -v49, v54, v94                         // 00000B84: D282005E 257A6D31
  v_add_f32     v48, v51, v56                               // 00000B8C: 06607133
  v_mul_f32     v51, v106, v62                              // 00000B90: 10667D6A
  v_subrev_f32  v53, v53, v58                               // 00000B94: 0A6A7535
  v_sub_f32     v56, v115, v119                             // 00000B98: 0870EF73
  v_add_f32     v58, v101, v64                              // 00000B9C: 06748165
  ds_write_b32  v67, v94                                    // 00000BA0: D8340000 00005E43
  v_mad_f32     v51, -v47, v48, v51                         // 00000BA8: D2820033 24CE612F
  v_subrev_f32  v67, v53, v56                               // 00000BB0: 0A867135
  v_mul_f32     v71, v124, v58                              // 00000BB4: 108E757C
  v_add_f32     v94, v107, v111                             // 00000BB8: 06BCDF6B
  v_add_f32     v107, v115, v119                            // 00000BBC: 06D6EF73
  v_subrev_f32  v98, v98, v102                              // 00000BC0: 0AC4CD62
  ds_write_b32  v59, v51                                    // 00000BC4: D8340000 0000333B
  v_mad_f32     v71, -v93, v67, v71                         // 00000BCC: D2820047 251E875D
  v_subrev_f32  v51, v94, v107                              // 00000BD4: 0A66D75E
  v_mul_f32     v59, v123, v98                              // 00000BD8: 1076C57B
  v_subrev_f32  v64, v101, v64                              // 00000BDC: 0A808165
  ds_write_b32  v85, v95                                    // 00000BE0: D8340000 00005F55
  v_sub_f32     v85, v108, v112                             // 00000BE8: 08AAE16C
  v_subrev_f32  v63, v63, v70                               // 00000BEC: 0A7E8D3F
  v_mad_f32     v59, -v49, v51, v59                         // 00000BF0: D282003B 24EE6731
  v_add_f32     v53, v53, v56                               // 00000BF8: 066A7135
  v_mul_f32     v56, v106, v64                              // 00000BFC: 1070816A
  ds_write_b32  v80, v71                                    // 00000C00: D8340000 00004750
  v_subrev_f32  v52, v52, v57                               // 00000C08: 0A687334
  v_sub_f32     v57, v116, v120                             // 00000C0C: 0872F174
  v_add_f32     v70, v85, v63                               // 00000C10: 068C7F55
  v_mad_f32     v56, -v47, v53, v56                         // 00000C14: D2820038 24E26B2F
  ds_write_b32  v84, v59                                    // 00000C1C: D8340000 00003B54
  v_subrev_f32  v59, v52, v57                               // 00000C24: 0A767334
  v_mul_f32     v71, v124, v70                              // 00000C28: 108E8D7C
  v_add_f32     v80, v108, v112                             // 00000C2C: 06A0E16C
  v_add_f32     v84, v116, v120                             // 00000C30: 06A8F174
  v_subrev_f32  v95, v99, v103                              // 00000C34: 0ABECF63
  ds_write_b32  v73, v56                                    // 00000C38: D8340000 00003849
  v_mad_f32     v71, -v93, v59, v71                         // 00000C40: D2820047 251E775D
  v_subrev_f32  v56, v80, v84                               // 00000C48: 0A70A950
  v_mul_f32     v73, v123, v95                              // 00000C4C: 1092BF7B
  v_subrev_f32  v63, v85, v63                               // 00000C50: 0A7E7F55
  ds_write_b32  v66, v96                                    // 00000C54: D8340000 00006042
  v_sub_f32     v66, v109, v113                             // 00000C5C: 0884E36D
  v_subrev_f32  v61, v61, v68                               // 00000C60: 0A7A893D
  v_mad_f32     v73, -v49, v56, v73                         // 00000C64: D2820049 25267131
  v_add_f32     v52, v52, v57                               // 00000C6C: 06687334
  v_mul_f32     v57, v106, v63                              // 00000C70: 10727F6A
  ds_write_b32  v60, v71                                    // 00000C74: D8340000 0000473C
  v_subrev_f32  v50, v50, v55                               // 00000C7C: 0A646F32
  v_sub_f32     v55, v117, v121                             // 00000C80: 086EF375
  v_add_f32     v60, v66, v61                               // 00000C84: 06787B42
  v_mad_f32     v57, -v47, v52, v57                         // 00000C88: D2820039 24E6692F
  ds_write_b32  v65, v73                                    // 00000C90: D8340000 00004941
  v_subrev_f32  v65, v50, v55                               // 00000C98: 0A826F32
  v_mul_f32     v68, v124, v60                              // 00000C9C: 1088797C
  v_add_f32     v71, v109, v113                             // 00000CA0: 068EE36D
  v_add_f32     v73, v117, v121                             // 00000CA4: 0692F375
  v_subrev_f32  v85, v100, v104                             // 00000CA8: 0AAAD164
  ds_write_b32  v42, v57                                    // 00000CAC: D8340000 0000392A
  v_mad_f32     v68, -v93, v65, v68                         // 00000CB4: D2820044 2512835D
  v_subrev_f32  v42, v71, v73                               // 00000CBC: 0A549347
  v_mul_f32     v57, v123, v85                              // 00000CC0: 1072AB7B
  v_subrev_f32  v61, v66, v61                               // 00000CC4: 0A7A7B42
  ds_write_b32  v72, v105                                   // 00000CC8: D8340000 00006948
  v_mad_f32     v57, -v49, v42, v57                         // 00000CD0: D2820039 24E65531
  v_add_f32     v50, v50, v55                               // 00000CD8: 06646F32
  v_mul_f32     v55, v106, v61                              // 00000CDC: 106E7B6A
  ds_write_b32  v20, v68                                    // 00000CE0: D8340000 00004414
  v_mad_f32     v55, -v47, v50, v55                         // 00000CE8: D2820037 24DE652F
  ds_write_b32  v21, v57                                    // 00000CF0: D8340000 00003915
  ds_write_b32  v22, v55                                    // 00000CF8: D8340000 00003716
  v_add_f32     v20, v110, v114                             // 00000D00: 0628E56E
  v_mul_f32     v21, v124, v126                             // 00000D04: 102AFD7C
  ds_write_b32  v27, v20                                    // 00000D08: D8340000 0000141B
  v_mac_f32     v21, v93, v69                               // 00000D10: 3E2A8B5D
  v_mul_f32     v20, v123, v54                              // 00000D14: 10286D7B
  ds_write_b32  v18, v21                                    // 00000D18: D8340000 00001512
  v_mac_f32     v20, v49, v97                               // 00000D20: 3E28C331
  v_mul_f32     v18, v106, v48                              // 00000D24: 1024616A
  ds_write_b32  v28, v20                                    // 00000D28: D8340000 0000141C
  v_mac_f32     v18, v47, v62                               // 00000D30: 3E247D2F
  v_add_f32     v20, v94, v107                              // 00000D34: 0628D75E
  v_mul_f32     v21, v124, v67                              // 00000D38: 102A877C
  ds_write_b32  v29, v18                                    // 00000D3C: D8340000 0000121D
  v_mac_f32     v21, v93, v58                               // 00000D44: 3E2A755D
  v_mul_f32     v18, v123, v51                              // 00000D48: 1024677B
  ds_write_b32  v24, v20                                    // 00000D4C: D8340000 00001418
  v_mac_f32     v18, v49, v98                               // 00000D54: 3E24C531
  v_mul_f32     v20, v106, v53                              // 00000D58: 10286B6A
  ds_write_b32  v25, v21                                    // 00000D5C: D8340000 00001519
  v_mac_f32     v20, v47, v64                               // 00000D64: 3E28812F
  ds_write_b32  v26, v18                                    // 00000D68: D8340000 0000121A
  v_add_f32     v18, v80, v84                               // 00000D70: 0624A950
  v_mul_f32     v21, v124, v59                              // 00000D74: 102A777C
  ds_write_b32  v30, v20                                    // 00000D78: D8340000 0000141E
  v_mac_f32     v21, v93, v70                               // 00000D80: 3E2A8D5D
  v_mul_f32     v20, v123, v56                              // 00000D84: 1028717B
  ds_write_b32  v33, v18                                    // 00000D88: D8340000 00001221
  v_mac_f32     v20, v49, v95                               // 00000D90: 3E28BF31
  v_mul_f32     v18, v106, v52                              // 00000D94: 1024696A
  ds_write_b32  v32, v21                                    // 00000D98: D8340000 00001520
  v_mac_f32     v18, v47, v63                               // 00000DA0: 3E247F2F
  ds_write_b32  v31, v20                                    // 00000DA4: D8340000 0000141F
  v_add_f32     v20, v71, v73                               // 00000DAC: 06289347
  v_mul_f32     v21, v124, v65                              // 00000DB0: 102A837C
  ds_write_b32  v23, v18                                    // 00000DB4: D8340000 00001217
  v_mac_f32     v21, v93, v60                               // 00000DBC: 3E2A795D
  v_mul_f32     v18, v123, v42                              // 00000DC0: 1024557B
  ds_write_b32  v19, v20                                    // 00000DC4: D8340000 00001413
  v_mac_f32     v18, v49, v85                               // 00000DCC: 3E24AB31
  v_mul_f32     v19, v106, v50                              // 00000DD0: 1026656A
  ds_write_b32  v11, v21                                    // 00000DD4: D8340000 0000150B
  v_mac_f32     v19, v47, v61                               // 00000DDC: 3E267B2F
  ds_write_b32  v12, v18                                    // 00000DE0: D8340000 0000120C
  ds_write_b32  v13, v19                                    // 00000DE8: D8340000 0000130D
  s_waitcnt     lgkmcnt(0)                                  // 00000DF0: BF8C007F
  s_barrier                                                 // 00000DF4: BF8A0000
  v_and_b32     v11, 0x000000f0, v3                         // 00000DF8: 361606FF 000000F0
  v_mul_i32_i24  v12, v11, 3                                // 00000E00: D212000C 0001070B
  v_or_b32      v13, 0xfffffc00, v12                        // 00000E08: 381A18FF FFFFFC00
  v_cmp_lt_u32  vcc, s4, v12                                // 00000E10: 7D821804
  ds_read_b32   v15, v15                                    // 00000E14: D8D80000 0F00000F
  ds_read_b32   v16, v16                                    // 00000E1C: D8D80000 10000010
  ds_read_b32   v17, v17                                    // 00000E24: D8D80000 11000011
  ds_read_b32   v18, v34                                    // 00000E2C: D8D80000 12000022
  ds_read_b32   v19, v35                                    // 00000E34: D8D80000 13000023
  ds_read_b32   v20, v36                                    // 00000E3C: D8D80000 14000024
  ds_read_b32   v21, v37                                    // 00000E44: D8D80000 15000025
  ds_read_b32   v22, v38                                    // 00000E4C: D8D80000 16000026
  ds_read_b32   v23, v39                                    // 00000E54: D8D80000 17000027
  ds_read_b32   v24, v40                                    // 00000E5C: D8D80000 18000028
  ds_read_b32   v25, v41                                    // 00000E64: D8D80000 19000029
  ds_read_b32   v26, v43                                    // 00000E6C: D8D80000 1A00002B
  ds_read_b32   v27, v44                                    // 00000E74: D8D80000 1B00002C
  ds_read_b32   v14, v14                                    // 00000E7C: D8D80000 0E00000E
  ds_read_b32   v28, v45                                    // 00000E84: D8D80000 1C00002D
  ds_read_b32   v29, v46                                    // 00000E8C: D8D80000 1D00002E
  v_cndmask_b32  v12, v12, v13, vcc                         // 00000E94: 00181B0C
  v_lshlrev_b32  v13, 1, v11                                // 00000E98: 341A1681
  v_cvt_f32_i32  v12, v12                                   // 00000E9C: 7E180B0C
  v_cvt_f32_i32  v13, v13                                   // 00000EA0: 7E1A0B0D
  v_cvt_f32_i32  v11, v11                                   // 00000EA4: 7E160B0B
  v_mul_f32     v12, 0xbbc90fdb, v12                        // 00000EA8: 101818FF BBC90FDB
  v_mul_f32     v13, 0xbbc90fdb, v13                        // 00000EB0: 101A1AFF BBC90FDB
  v_mul_f32     v11, 0xbbc90fdb, v11                        // 00000EB8: 101616FF BBC90FDB
  v_mul_legacy_f32  v30, 0x3e22f983, v12                    // 00000EC0: 0E3C18FF 3E22F983
  v_mul_legacy_f32  v31, 0x3e22f983, v13                    // 00000EC8: 0E3E1AFF 3E22F983
  v_mul_legacy_f32  v32, 0x3e22f983, v11                    // 00000ED0: 0E4016FF 3E22F983
  v_and_b32     v12, 0x80000000, v12                        // 00000ED8: 361818FF 80000000
  v_fract_f32   v30, abs(v30)                               // 00000EE0: D340011E 0000011E
  v_and_b32     v13, 0x80000000, v13                        // 00000EE8: 361A1AFF 80000000
  v_fract_f32   v31, abs(v31)                               // 00000EF0: D340011F 0000011F
  v_and_b32     v11, 0x80000000, v11                        // 00000EF8: 361616FF 80000000
  v_fract_f32   v32, abs(v32)                               // 00000F00: D3400120 00000120
  s_waitcnt     lgkmcnt(10)                                 // 00000F08: BF8C0A7F
  v_add_f32     v33, v16, v20                               // 00000F0C: 06422910
  s_waitcnt     lgkmcnt(8)                                  // 00000F10: BF8C087F
  v_add_f32     v34, v18, v22                               // 00000F14: 06442D12
  v_add_f32     v35, v17, v21                               // 00000F18: 06462B11
  v_add_f32     v36, v15, v19                               // 00000F1C: 0648270F
  s_waitcnt     lgkmcnt(2)                                  // 00000F20: BF8C027F
  v_add_f32     v37, v24, v14                               // 00000F24: 064A1D18
  s_waitcnt     lgkmcnt(0)                                  // 00000F28: BF8C007F
  v_add_f32     v38, v26, v29                               // 00000F2C: 064C3B1A
  v_add_f32     v39, v25, v28                               // 00000F30: 064E3919
  v_add_f32     v40, v23, v27                               // 00000F34: 06503717
  v_or_b32      v12, v12, v30                               // 00000F38: 38183D0C
  v_or_b32      v13, v13, v31                               // 00000F3C: 381A3F0D
  v_or_b32      v11, v11, v32                               // 00000F40: 3816410B
  v_add_f32     v30, v33, v37                               // 00000F44: 063C4B21
  v_add_f32     v31, v34, v38                               // 00000F48: 063E4D22
  v_add_f32     v32, v35, v39                               // 00000F4C: 06404F23
  v_add_f32     v41, v36, v40                               // 00000F50: 06525124
  v_cos_f32     v42, v12                                    // 00000F54: 7E546D0C
  v_sin_f32     v12, v12                                    // 00000F58: 7E186B0C
  ds_read_b32   v43, v74                                    // 00000F5C: D8D80000 2B00004A
  ds_read_b32   v44, v75                                    // 00000F64: D8D80000 2C00004B
  ds_read_b32   v45, v76                                    // 00000F6C: D8D80000 2D00004C
  ds_read_b32   v46, v77                                    // 00000F74: D8D80000 2E00004D
  ds_read_b32   v47, v78                                    // 00000F7C: D8D80000 2F00004E
  ds_read_b32   v48, v79                                    // 00000F84: D8D80000 3000004F
  ds_read_b32   v49, v81                                    // 00000F8C: D8D80000 31000051
  ds_read_b32   v50, v82                                    // 00000F94: D8D80000 32000052
  ds_read_b32   v51, v83                                    // 00000F9C: D8D80000 33000053
  ds_read_b32   v52, v86                                    // 00000FA4: D8D80000 34000056
  ds_read_b32   v53, v87                                    // 00000FAC: D8D80000 35000057
  ds_read_b32   v54, v88                                    // 00000FB4: D8D80000 36000058
  ds_read_b32   v55, v89                                    // 00000FBC: D8D80000 37000059
  ds_read_b32   v56, v90                                    // 00000FC4: D8D80000 3800005A
  ds_read_b32   v57, v91                                    // 00000FCC: D8D80000 3900005B
  ds_read_b32   v58, v92                                    // 00000FD4: D8D80000 3A00005C
  v_cos_f32     v59, v13                                    // 00000FDC: 7E766D0D
  v_sin_f32     v13, v13                                    // 00000FE0: 7E1A6B0D
  v_cos_f32     v60, v11                                    // 00000FE4: 7E786D0B
  v_sin_f32     v11, v11                                    // 00000FE8: 7E166B0B
  s_waitcnt     lgkmcnt(0)                                  // 00000FEC: BF8C007F
  s_barrier                                                 // 00000FF0: BF8A0000
  ds_write_b32  v3, v30                                     // 00000FF4: D8340000 00001E03
  v_add_i32     v30, vcc, 0x00000108, v3                    // 00000FFC: 4A3C06FF 00000108
  v_sub_f32     v61, v46, v50                               // 00001004: 087A652E
  v_subrev_f32  v14, v24, v14                               // 00001008: 0A1C1D18
  ds_write_b32  v30, v31                                    // 0000100C: D8340000 00001F1E
  v_add_i32     v24, vcc, 0x00000210, v3                    // 00001014: 4A3006FF 00000210
  v_subrev_f32  v16, v16, v20                               // 0000101C: 0A202910
  v_sub_f32     v20, v54, v58                               // 00001020: 08287536
  v_sub_f32     v30, v43, v47                               // 00001024: 083C5F2B
  v_subrev_f32  v26, v26, v29                               // 00001028: 0A343B1A
  v_add_f32     v29, v61, v14                               // 0000102C: 063A1D3D
  ds_write_b32  v24, v32                                    // 00001030: D8340000 00002018
  v_add_i32     v24, vcc, 0x00000318, v3                    // 00001038: 4A3006FF 00000318
  v_subrev_f32  v18, v18, v22                               // 00001040: 0A242D12
  v_sub_f32     v22, v51, v55                               // 00001044: 082C6F33
  v_subrev_f32  v31, v16, v20                               // 00001048: 0A3E2910
  v_sub_f32     v32, v44, v48                               // 0000104C: 0840612C
  v_subrev_f32  v25, v25, v28                               // 00001050: 0A323919
  v_add_f32     v28, v30, v26                               // 00001054: 0638351E
  v_mul_f32     v62, v60, v29                               // 00001058: 107C3B3C
  ds_write_b32  v24, v41                                    // 0000105C: D8340000 00002918
  v_subrev_f32  v17, v17, v21                               // 00001064: 0A222B11
  v_sub_f32     v21, v52, v56                               // 00001068: 082A7134
  v_subrev_f32  v24, v18, v22                               // 0000106C: 0A302D12
  v_sub_f32     v41, v45, v49                               // 00001070: 0852632D
  v_subrev_f32  v23, v23, v27                               // 00001074: 0A2E3717
  v_add_f32     v27, v32, v25                               // 00001078: 06363320
  v_mul_f32     v63, v60, v28                               // 0000107C: 107E393C
  v_mad_f32     v62, -v11, v31, v62                         // 00001080: D282003E 24FA3F0B
  v_add_i32     v64, vcc, 0x00000420, v3                    // 00001088: 4A8006FF 00000420
  v_subrev_f32  v15, v15, v19                               // 00001090: 0A1E270F
  v_sub_f32     v19, v53, v57                               // 00001094: 08267335
  v_subrev_f32  v65, v17, v21                               // 00001098: 0A822B11
  v_add_f32     v66, v41, v23                               // 0000109C: 06842F29
  v_mul_f32     v67, v60, v27                               // 000010A0: 1086373C
  v_mad_f32     v63, -v11, v24, v63                         // 000010A4: D282003F 24FE310B
  ds_write_b32  v64, v62                                    // 000010AC: D8340000 00003E40
  v_add_i32     v62, vcc, 0x00000528, v3                    // 000010B4: 4A7C06FF 00000528
  v_subrev_f32  v64, v15, v19                               // 000010BC: 0A80270F
  v_mul_f32     v68, v60, v66                               // 000010C0: 1088853C
  v_mad_f32     v67, -v11, v65, v67                         // 000010C4: D2820043 250E830B
  ds_write_b32  v62, v63                                    // 000010CC: D8340000 00003F3E
  v_add_i32     v62, vcc, 0x00000630, v3                    // 000010D4: 4A7C06FF 00000630
  v_add_f32     v46, v46, v50                               // 000010DC: 065C652E
  v_add_f32     v50, v54, v58                               // 000010E0: 06647536
  v_subrev_f32  v33, v33, v37                               // 000010E4: 0A424B21
  v_mad_f32     v68, -v11, v64, v68                         // 000010E8: D2820044 2512810B
  ds_write_b32  v62, v67                                    // 000010F0: D8340000 0000433E
  v_add_i32     v37, vcc, 0x00000738, v3                    // 000010F8: 4A4A06FF 00000738
  v_add_f32     v43, v43, v47                               // 00001100: 06565F2B
  v_add_f32     v47, v51, v55                               // 00001104: 065E6F33
  v_subrev_f32  v51, v46, v50                               // 00001108: 0A66652E
  v_subrev_f32  v34, v34, v38                               // 0000110C: 0A444D22
  v_mul_f32     v38, v59, v33                               // 00001110: 104C433B
  ds_write_b32  v37, v68                                    // 00001114: D8340000 00004425
  v_add_f32     v37, v44, v48                               // 0000111C: 064A612C
  v_add_f32     v44, v52, v56                               // 00001120: 06587134
  v_subrev_f32  v48, v43, v47                               // 00001124: 0A605F2B
  v_subrev_f32  v35, v35, v39                               // 00001128: 0A464F23
  v_mul_f32     v39, v59, v34                               // 0000112C: 104E453B
  v_mad_f32     v38, -v13, v51, v38                         // 00001130: D2820026 249A670D
  v_add_i32     v52, vcc, 0x00000840, v3                    // 00001138: 4A6806FF 00000840
  v_add_f32     v45, v45, v49                               // 00001140: 065A632D
  v_add_f32     v49, v53, v57                               // 00001144: 06627335
  v_subrev_f32  v53, v37, v44                               // 00001148: 0A6A5925
  v_subrev_f32  v36, v36, v40                               // 0000114C: 0A485124
  v_mul_f32     v40, v59, v35                               // 00001150: 1050473B
  v_mad_f32     v39, -v13, v48, v39                         // 00001154: D2820027 249E610D
  ds_write_b32  v52, v38                                    // 0000115C: D8340000 00002634
  v_add_i32     v38, vcc, 0x00000948, v3                    // 00001164: 4A4C06FF 00000948
  v_subrev_f32  v52, v45, v49                               // 0000116C: 0A68632D
  v_mul_f32     v54, v59, v36                               // 00001170: 106C493B
  v_mad_f32     v40, -v13, v53, v40                         // 00001174: D2820028 24A26B0D
  ds_write_b32  v38, v39                                    // 0000117C: D8340000 00002726
  v_add_i32     v38, vcc, 0x00000a50, v3                    // 00001184: 4A4C06FF 00000A50
  v_subrev_f32  v14, v61, v14                               // 0000118C: 0A1C1D3D
  v_mad_f32     v54, -v13, v52, v54                         // 00001190: D2820036 24DA690D
  ds_write_b32  v38, v40                                    // 00001198: D8340000 00002826
  v_add_i32     v38, vcc, 0x00000b58, v3                    // 000011A0: 4A4C06FF 00000B58
  v_add_f32     v16, v16, v20                               // 000011A8: 06202910
  v_subrev_f32  v20, v30, v26                               // 000011AC: 0A28351E
  v_mul_f32     v26, v42, v14                               // 000011B0: 10341D2A
  ds_write_b32  v38, v54                                    // 000011B4: D8340000 00003626
  v_add_f32     v18, v18, v22                               // 000011BC: 06242D12
  v_subrev_f32  v22, v32, v25                               // 000011C0: 0A2C3320
  v_mul_f32     v25, v42, v20                               // 000011C4: 1032292A
  v_mad_f32     v26, -v12, v16, v26                         // 000011C8: D282001A 246A210C
  v_add_i32     v30, vcc, 0x00000c60, v3                    // 000011D0: 4A3C06FF 00000C60
  v_add_f32     v17, v17, v21                               // 000011D8: 06222B11
  v_subrev_f32  v21, v41, v23                               // 000011DC: 0A2A2F29
  v_mul_f32     v23, v42, v22                               // 000011E0: 102E2D2A
  v_mad_f32     v25, -v12, v18, v25                         // 000011E4: D2820019 2466250C
  ds_write_b32  v30, v26                                    // 000011EC: D8340000 00001A1E
  v_add_i32     v26, vcc, 0x00000d68, v3                    // 000011F4: 4A3406FF 00000D68
  v_add_f32     v15, v15, v19                               // 000011FC: 061E270F
  v_mul_f32     v19, v42, v21                               // 00001200: 10262B2A
  v_mad_f32     v23, -v12, v17, v23                         // 00001204: D2820017 245E230C
  ds_write_b32  v26, v25                                    // 0000120C: D8340000 0000191A
  v_add_i32     v25, vcc, 0x00000e70, v3                    // 00001214: 4A3206FF 00000E70
  v_mad_f32     v19, -v12, v15, v19                         // 0000121C: D2820013 244E1F0C
  ds_write_b32  v25, v23                                    // 00001224: D8340000 00001719
  v_add_i32     v23, vcc, 0x00000f78, v3                    // 0000122C: 4A2E06FF 00000F78
  ds_write_b32  v23, v19                                    // 00001234: D8340000 00001317
  v_add_f32     v19, v46, v50                               // 0000123C: 0626652E
  v_add_i32     v23, vcc, 0x00001080, v3                    // 00001240: 4A2E06FF 00001080
  v_add_f32     v25, v43, v47                               // 00001248: 06325F2B
  ds_write_b32  v23, v19                                    // 0000124C: D8340000 00001317
  v_add_i32     v19, vcc, 0x00001188, v3                    // 00001254: 4A2606FF 00001188
  v_add_f32     v23, v37, v44                               // 0000125C: 062E5925
  ds_write_b32  v19, v25                                    // 00001260: D8340000 00001913
  v_add_i32     v19, vcc, 0x00001290, v3                    // 00001268: 4A2606FF 00001290
  v_add_f32     v25, v45, v49                               // 00001270: 0632632D
  ds_write_b32  v19, v23                                    // 00001274: D8340000 00001713
  v_add_i32     v19, vcc, 0x00001398, v3                    // 0000127C: 4A2606FF 00001398
  v_mul_f32     v23, v60, v31                               // 00001284: 102E3F3C
  ds_write_b32  v19, v25                                    // 00001288: D8340000 00001913
  v_mul_f32     v19, v60, v24                               // 00001290: 1026313C
  v_mac_f32     v23, v11, v29                               // 00001294: 3E2E3B0B
  v_add_i32     v24, vcc, 0x000014a0, v3                    // 00001298: 4A3006FF 000014A0
  v_mul_f32     v25, v60, v65                               // 000012A0: 1032833C
  v_mac_f32     v19, v11, v28                               // 000012A4: 3E26390B
  ds_write_b32  v24, v23                                    // 000012A8: D8340000 00001718
  v_add_i32     v23, vcc, 0x000015a8, v3                    // 000012B0: 4A2E06FF 000015A8
  v_mul_f32     v24, v60, v64                               // 000012B8: 1030813C
  v_mac_f32     v25, v11, v27                               // 000012BC: 3E32370B
  ds_write_b32  v23, v19                                    // 000012C0: D8340000 00001317
  v_add_i32     v19, vcc, 0x000016b0, v3                    // 000012C8: 4A2606FF 000016B0
  v_mac_f32     v24, v11, v66                               // 000012D0: 3E30850B
  ds_write_b32  v19, v25                                    // 000012D4: D8340000 00001913
  v_add_i32     v11, vcc, 0x000017b8, v3                    // 000012DC: 4A1606FF 000017B8
  v_mul_f32     v19, v59, v51                               // 000012E4: 1026673B
  ds_write_b32  v11, v24                                    // 000012E8: D8340000 0000180B
  v_mul_f32     v11, v59, v48                               // 000012F0: 1016613B
  v_mac_f32     v19, v13, v33                               // 000012F4: 3E26430D
  v_add_i32     v23, vcc, 0x000018c0, v3                    // 000012F8: 4A2E06FF 000018C0
  v_mul_f32     v24, v59, v53                               // 00001300: 10306B3B
  v_mac_f32     v11, v13, v34                               // 00001304: 3E16450D
  ds_write_b32  v23, v19                                    // 00001308: D8340000 00001317
  v_add_i32     v19, vcc, 0x000019c8, v3                    // 00001310: 4A2606FF 000019C8
  v_mul_f32     v23, v59, v52                               // 00001318: 102E693B
  v_mac_f32     v24, v13, v35                               // 0000131C: 3E30470D
  ds_write_b32  v19, v11                                    // 00001320: D8340000 00000B13
  v_add_i32     v11, vcc, 0x00001ad0, v3                    // 00001328: 4A1606FF 00001AD0
  v_mac_f32     v23, v13, v36                               // 00001330: 3E2E490D
  ds_write_b32  v11, v24                                    // 00001334: D8340000 0000180B
  v_add_i32     v11, vcc, 0x00001bd8, v3                    // 0000133C: 4A1606FF 00001BD8
  v_mul_f32     v13, v42, v16                               // 00001344: 101A212A
  ds_write_b32  v11, v23                                    // 00001348: D8340000 0000170B
  v_mul_f32     v11, v42, v18                               // 00001350: 1016252A
  v_mac_f32     v13, v12, v14                               // 00001354: 3E1A1D0C
  v_add_i32     v14, vcc, 0x00001ce0, v3                    // 00001358: 4A1C06FF 00001CE0
  v_mul_f32     v16, v42, v17                               // 00001360: 1020232A
  v_mac_f32     v11, v12, v20                               // 00001364: 3E16290C
  ds_write_b32  v14, v13                                    // 00001368: D8340000 00000D0E
  v_add_i32     v13, vcc, 0x00001de8, v3                    // 00001370: 4A1A06FF 00001DE8
  v_mul_f32     v14, v42, v15                               // 00001378: 101C1F2A
  v_mac_f32     v16, v12, v22                               // 0000137C: 3E202D0C
  ds_write_b32  v13, v11                                    // 00001380: D8340000 00000B0D
  v_add_i32     v11, vcc, 0x00001ef0, v3                    // 00001388: 4A1606FF 00001EF0
  v_mac_f32     v14, v12, v21                               // 00001390: 3E1C2B0C
  ds_write_b32  v11, v16                                    // 00001394: D8340000 0000100B
  v_add_i32     v11, vcc, 0x00001ff8, v3                    // 0000139C: 4A1606FF 00001FF8
  ds_write_b32  v11, v14                                    // 000013A4: D8340000 00000E0B
  s_waitcnt     lgkmcnt(0)                                  // 000013AC: BF8C007F
  s_barrier                                                 // 000013B0: BF8A0000
  v_bfe_u32     v11, v0, 2, 2                               // 000013B4: D290000B 02090500
  s_movk_i32    s4, 0x0108                                  // 000013BC: B0040108
  v_and_b32     v12, 3, v0                                  // 000013C0: 36180083
  v_mul_i32_i24  v11, v11, s4                               // 000013C4: D212000B 0000090B
  v_lshrrev_b32  v13, 2, v0                                 // 000013CC: 2C1A0082
  v_or_b32      v11, v12, v11                               // 000013D0: 3816170C
  v_and_b32     v12, 12, v13                                // 000013D4: 36181A8C
  v_add_i32     v11, vcc, v11, v12                          // 000013D8: 4A16190B
  v_lshlrev_b32  v11, 2, v11                                // 000013DC: 34161682
  v_add_i32     v12, vcc, 0x000003d8, v11                   // 000013E0: 4A1816FF 000003D8
  v_add_i32     v13, vcc, 0x000000c0, v11                   // 000013E8: 4A1A16FF 000000C0
  v_add_i32     v14, vcc, 0x000002d0, v11                   // 000013F0: 4A1C16FF 000002D0
  v_add_i32     v15, vcc, 0x000001c8, v11                   // 000013F8: 4A1E16FF 000001C8
  v_add_i32     v16, vcc, 0x00000358, v11                   // 00001400: 4A2016FF 00000358
  v_add_i32     v17, vcc, 64, v11                           // 00001408: 4A2216C0
  v_add_i32     v18, vcc, 0x00000250, v11                   // 0000140C: 4A2416FF 00000250
  v_add_i32     v19, vcc, 0x00000148, v11                   // 00001414: 4A2616FF 00000148
  v_add_i32     v20, vcc, 0x00000318, v11                   // 0000141C: 4A2816FF 00000318
  v_add_i32     v21, vcc, 0x00000210, v11                   // 00001424: 4A2A16FF 00000210
  v_add_i32     v22, vcc, 0x00000108, v11                   // 0000142C: 4A2C16FF 00000108
  v_add_i32     v23, vcc, 0x00000398, v11                   // 00001434: 4A2E16FF 00000398
  v_add_i32     v24, vcc, 0x00000080, v11                   // 0000143C: 4A3016FF 00000080
  v_add_i32     v25, vcc, 0x00000290, v11                   // 00001444: 4A3216FF 00000290
  v_add_i32     v26, vcc, 0x00000188, v11                   // 0000144C: 4A3416FF 00000188
  v_and_b32     v27, 0x000000c0, v3                         // 00001454: 363606FF 000000C0
  v_mul_i32_i24  v28, v27, 3                                // 0000145C: D212001C 0001071B
  s_movk_i32    s4, 0x0200                                  // 00001464: B0040200
  v_or_b32      v29, 0xfffffc00, v28                        // 00001468: 383A38FF FFFFFC00
  v_cmp_lt_u32  vcc, s4, v28                                // 00001470: 7D823804
  ds_read_b32   v12, v12                                    // 00001474: D8D80000 0C00000C
  ds_read_b32   v13, v13                                    // 0000147C: D8D80000 0D00000D
  ds_read_b32   v14, v14                                    // 00001484: D8D80000 0E00000E
  ds_read_b32   v15, v15                                    // 0000148C: D8D80000 0F00000F
  ds_read_b32   v16, v16                                    // 00001494: D8D80000 10000010
  ds_read_b32   v17, v17                                    // 0000149C: D8D80000 11000011
  ds_read_b32   v18, v18                                    // 000014A4: D8D80000 12000012
  ds_read_b32   v19, v19                                    // 000014AC: D8D80000 13000013
  ds_read_b32   v20, v20                                    // 000014B4: D8D80000 14000014
  ds_read_b32   v30, v11                                    // 000014BC: D8D80000 1E00000B
  ds_read_b32   v21, v21                                    // 000014C4: D8D80000 15000015
  ds_read_b32   v22, v22                                    // 000014CC: D8D80000 16000016
  ds_read_b32   v23, v23                                    // 000014D4: D8D80000 17000017
  ds_read_b32   v24, v24                                    // 000014DC: D8D80000 18000018
  ds_read_b32   v25, v25                                    // 000014E4: D8D80000 19000019
  ds_read_b32   v26, v26                                    // 000014EC: D8D80000 1A00001A
  v_cndmask_b32  v28, v28, v29, vcc                         // 000014F4: 00383B1C
  v_lshlrev_b32  v29, 1, v27                                // 000014F8: 343A3681
  v_cvt_f32_i32  v28, v28                                   // 000014FC: 7E380B1C
  v_add_i32     v31, vcc, 0x000011c8, v11                   // 00001500: 4A3E16FF 000011C8
  v_add_i32     v32, vcc, 0x000012d0, v11                   // 00001508: 4A4016FF 000012D0
  v_add_i32     v33, vcc, 0x000013d8, v11                   // 00001510: 4A4216FF 000013D8
  v_add_i32     v34, vcc, 0x000010c0, v11                   // 00001518: 4A4416FF 000010C0
  v_add_i32     v35, vcc, 0x00001248, v11                   // 00001520: 4A4616FF 00001248
  v_add_i32     v36, vcc, 0x00001350, v11                   // 00001528: 4A4816FF 00001350
  v_add_i32     v37, vcc, 0x00001458, v11                   // 00001530: 4A4A16FF 00001458
  v_add_i32     v38, vcc, 0x00001140, v11                   // 00001538: 4A4C16FF 00001140
  v_add_i32     v39, vcc, 0x00001188, v11                   // 00001540: 4A4E16FF 00001188
  v_add_i32     v40, vcc, 0x00001290, v11                   // 00001548: 4A5016FF 00001290
  v_add_i32     v41, vcc, 0x00001398, v11                   // 00001550: 4A5216FF 00001398
  v_add_i32     v42, vcc, 0x00001080, v11                   // 00001558: 4A5416FF 00001080
  v_add_i32     v43, vcc, 0x00001208, v11                   // 00001560: 4A5616FF 00001208
  v_add_i32     v44, vcc, 0x00001310, v11                   // 00001568: 4A5816FF 00001310
  v_add_i32     v45, vcc, 0x00001418, v11                   // 00001570: 4A5A16FF 00001418
  v_add_i32     v11, vcc, 0x00001100, v11                   // 00001578: 4A1616FF 00001100
  v_cvt_f32_i32  v29, v29                                   // 00001580: 7E3A0B1D
  v_cvt_f32_i32  v27, v27                                   // 00001584: 7E360B1B
  v_mul_f32     v28, 0xbbc90fdb, v28                        // 00001588: 103838FF BBC90FDB
  v_mul_f32     v29, 0xbbc90fdb, v29                        // 00001590: 103A3AFF BBC90FDB
  v_mul_f32     v27, 0xbbc90fdb, v27                        // 00001598: 103636FF BBC90FDB
  v_mul_legacy_f32  v46, 0x3e22f983, v28                    // 000015A0: 0E5C38FF 3E22F983
  v_mul_legacy_f32  v47, 0x3e22f983, v29                    // 000015A8: 0E5E3AFF 3E22F983
  v_mul_legacy_f32  v48, 0x3e22f983, v27                    // 000015B0: 0E6036FF 3E22F983
  v_and_b32     v28, 0x80000000, v28                        // 000015B8: 363838FF 80000000
  v_fract_f32   v46, abs(v46)                               // 000015C0: D340012E 0000012E
  v_and_b32     v29, 0x80000000, v29                        // 000015C8: 363A3AFF 80000000
  v_fract_f32   v47, abs(v47)                               // 000015D0: D340012F 0000012F
  v_and_b32     v27, 0x80000000, v27                        // 000015D8: 363636FF 80000000
  v_fract_f32   v48, abs(v48)                               // 000015E0: D3400130 00000130
  s_waitcnt     lgkmcnt(10)                                 // 000015E8: BF8C0A7F
  v_add_f32     v49, v13, v17                               // 000015EC: 0662230D
  s_waitcnt     lgkmcnt(8)                                  // 000015F0: BF8C087F
  v_add_f32     v50, v15, v19                               // 000015F4: 0664270F
  v_add_f32     v51, v14, v18                               // 000015F8: 0666250E
  v_add_f32     v52, v12, v16                               // 000015FC: 0668210C
  s_waitcnt     lgkmcnt(2)                                  // 00001600: BF8C027F
  v_add_f32     v53, v30, v24                               // 00001604: 066A311E
  s_waitcnt     lgkmcnt(0)                                  // 00001608: BF8C007F
  v_add_f32     v54, v22, v26                               // 0000160C: 066C3516
  v_add_f32     v55, v21, v25                               // 00001610: 066E3315
  v_add_f32     v56, v20, v23                               // 00001614: 06702F14
  v_or_b32      v28, v28, v46                               // 00001618: 38385D1C
  v_or_b32      v29, v29, v47                               // 0000161C: 383A5F1D
  v_or_b32      v27, v27, v48                               // 00001620: 3836611B
  v_add_f32     v46, v49, v53                               // 00001624: 065C6B31
  v_add_f32     v47, v50, v54                               // 00001628: 065E6D32
  v_add_f32     v48, v51, v55                               // 0000162C: 06606F33
  v_add_f32     v57, v52, v56                               // 00001630: 06727134
  v_cos_f32     v58, v28                                    // 00001634: 7E746D1C
  v_sin_f32     v28, v28                                    // 00001638: 7E386B1C
  ds_read_b32   v31, v31                                    // 0000163C: D8D80000 1F00001F
  ds_read_b32   v32, v32                                    // 00001644: D8D80000 20000020
  ds_read_b32   v33, v33                                    // 0000164C: D8D80000 21000021
  ds_read_b32   v34, v34                                    // 00001654: D8D80000 22000022
  ds_read_b32   v35, v35                                    // 0000165C: D8D80000 23000023
  ds_read_b32   v36, v36                                    // 00001664: D8D80000 24000024
  ds_read_b32   v37, v37                                    // 0000166C: D8D80000 25000025
  ds_read_b32   v38, v38                                    // 00001674: D8D80000 26000026
  ds_read_b32   v39, v39                                    // 0000167C: D8D80000 27000027
  ds_read_b32   v40, v40                                    // 00001684: D8D80000 28000028
  ds_read_b32   v41, v41                                    // 0000168C: D8D80000 29000029
  ds_read_b32   v42, v42                                    // 00001694: D8D80000 2A00002A
  ds_read_b32   v43, v43                                    // 0000169C: D8D80000 2B00002B
  ds_read_b32   v44, v44                                    // 000016A4: D8D80000 2C00002C
  ds_read_b32   v45, v45                                    // 000016AC: D8D80000 2D00002D
  ds_read_b32   v11, v11                                    // 000016B4: D8D80000 0B00000B
  v_cos_f32     v59, v29                                    // 000016BC: 7E766D1D
  v_sin_f32     v29, v29                                    // 000016C0: 7E3A6B1D
  v_cos_f32     v60, v27                                    // 000016C4: 7E786D1B
  v_sin_f32     v27, v27                                    // 000016C8: 7E366B1B
  s_waitcnt     lgkmcnt(0)                                  // 000016CC: BF8C007F
  s_barrier                                                 // 000016D0: BF8A0000
  ds_write_b32  v3, v46                                     // 000016D4: D8340000 00002E03
  v_add_i32     v46, vcc, 0x00000110, v3                    // 000016DC: 4A5C06FF 00000110
  v_sub_f32     v61, v34, v38                               // 000016E4: 087A4D22
  v_sub_f32     v24, v30, v24                               // 000016E8: 0830311E
  ds_write_b32  v46, v47                                    // 000016EC: D8340000 00002F2E
  v_add_i32     v30, vcc, 0x00000220, v3                    // 000016F4: 4A3C06FF 00000220
  v_subrev_f32  v13, v13, v17                               // 000016FC: 0A1A230D
  v_sub_f32     v17, v42, v11                               // 00001700: 0822172A
  v_sub_f32     v46, v31, v35                               // 00001704: 085C471F
  v_sub_f32     v22, v22, v26                               // 00001708: 082C3516
  v_add_f32     v26, v61, v24                               // 0000170C: 0634313D
  ds_write_b32  v30, v48                                    // 00001710: D8340000 0000301E
  v_add_i32     v30, vcc, 0x00000330, v3                    // 00001718: 4A3C06FF 00000330
  v_subrev_f32  v15, v15, v19                               // 00001720: 0A1E270F
  v_sub_f32     v19, v39, v43                               // 00001724: 08265727
  v_subrev_f32  v47, v13, v17                               // 00001728: 0A5E230D
  v_sub_f32     v48, v32, v36                               // 0000172C: 08604920
  v_sub_f32     v21, v21, v25                               // 00001730: 082A3315
  v_add_f32     v25, v46, v22                               // 00001734: 06322D2E
  v_mul_f32     v62, v60, v26                               // 00001738: 107C353C
  ds_write_b32  v30, v57                                    // 0000173C: D8340000 0000391E
  v_subrev_f32  v14, v14, v18                               // 00001744: 0A1C250E
  v_sub_f32     v18, v40, v44                               // 00001748: 08245928
  v_subrev_f32  v30, v15, v19                               // 0000174C: 0A3C270F
  v_sub_f32     v57, v33, v37                               // 00001750: 08724B21
  v_sub_f32     v20, v20, v23                               // 00001754: 08282F14
  v_add_f32     v23, v48, v21                               // 00001758: 062E2B30
  v_mul_f32     v63, v60, v25                               // 0000175C: 107E333C
  v_mad_f32     v62, -v27, v47, v62                         // 00001760: D282003E 24FA5F1B
  v_add_i32     v64, vcc, 0x00000440, v3                    // 00001768: 4A8006FF 00000440
  v_subrev_f32  v12, v12, v16                               // 00001770: 0A18210C
  v_sub_f32     v16, v41, v45                               // 00001774: 08205B29
  v_subrev_f32  v65, v14, v18                               // 00001778: 0A82250E
  v_add_f32     v66, v57, v20                               // 0000177C: 06842939
  v_mul_f32     v67, v60, v23                               // 00001780: 10862F3C
  v_mad_f32     v63, -v27, v30, v63                         // 00001784: D282003F 24FE3D1B
  ds_write_b32  v64, v62                                    // 0000178C: D8340000 00003E40
  v_add_i32     v62, vcc, 0x00000550, v3                    // 00001794: 4A7C06FF 00000550
  v_subrev_f32  v64, v12, v16                               // 0000179C: 0A80210C
  v_mul_f32     v68, v60, v66                               // 000017A0: 1088853C
  v_mad_f32     v67, -v27, v65, v67                         // 000017A4: D2820043 250E831B
  ds_write_b32  v62, v63                                    // 000017AC: D8340000 00003F3E
  v_add_i32     v62, vcc, 0x00000660, v3                    // 000017B4: 4A7C06FF 00000660
  v_add_f32     v34, v34, v38                               // 000017BC: 06444D22
  v_add_f32     v11, v42, v11                               // 000017C0: 0616172A
  v_subrev_f32  v38, v49, v53                               // 000017C4: 0A4C6B31
  v_mad_f32     v68, -v27, v64, v68                         // 000017C8: D2820044 2512811B
  ds_write_b32  v62, v67                                    // 000017D0: D8340000 0000433E
  v_add_i32     v42, vcc, 0x00000770, v3                    // 000017D8: 4A5406FF 00000770
  v_add_f32     v31, v31, v35                               // 000017E0: 063E471F
  v_add_f32     v35, v39, v43                               // 000017E4: 06465727
  v_subrev_f32  v39, v34, v11                               // 000017E8: 0A4E1722
  v_subrev_f32  v43, v50, v54                               // 000017EC: 0A566D32
  v_mul_f32     v49, v59, v38                               // 000017F0: 10624D3B
  ds_write_b32  v42, v68                                    // 000017F4: D8340000 0000442A
  v_add_f32     v32, v32, v36                               // 000017FC: 06404920
  v_add_f32     v36, v40, v44                               // 00001800: 06485928
  v_subrev_f32  v40, v31, v35                               // 00001804: 0A50471F
  v_subrev_f32  v42, v51, v55                               // 00001808: 0A546F33
  v_mul_f32     v44, v59, v43                               // 0000180C: 1058573B
  v_mad_f32     v49, -v29, v39, v49                         // 00001810: D2820031 24C64F1D
  v_add_i32     v50, vcc, 0x00000880, v3                    // 00001818: 4A6406FF 00000880
  v_add_f32     v33, v33, v37                               // 00001820: 06424B21
  v_add_f32     v37, v41, v45                               // 00001824: 064A5B29
  v_subrev_f32  v41, v32, v36                               // 00001828: 0A524920
  v_subrev_f32  v45, v52, v56                               // 0000182C: 0A5A7134
  v_mul_f32     v51, v59, v42                               // 00001830: 1066553B
  v_mad_f32     v44, -v29, v40, v44                         // 00001834: D282002C 24B2511D
  ds_write_b32  v50, v49                                    // 0000183C: D8340000 00003132
  v_add_i32     v49, vcc, 0x00000990, v3                    // 00001844: 4A6206FF 00000990
  v_subrev_f32  v50, v33, v37                               // 0000184C: 0A644B21
  v_mul_f32     v52, v59, v45                               // 00001850: 10685B3B
  v_mad_f32     v51, -v29, v41, v51                         // 00001854: D2820033 24CE531D
  ds_write_b32  v49, v44                                    // 0000185C: D8340000 00002C31
  v_add_i32     v44, vcc, 0x00000aa0, v3                    // 00001864: 4A5806FF 00000AA0
  v_subrev_f32  v24, v61, v24                               // 0000186C: 0A30313D
  v_mad_f32     v52, -v29, v50, v52                         // 00001870: D2820034 24D2651D
  ds_write_b32  v44, v51                                    // 00001878: D8340000 0000332C
  v_add_i32     v44, vcc, 0x00000bb0, v3                    // 00001880: 4A5806FF 00000BB0
  v_add_f32     v13, v13, v17                               // 00001888: 061A230D
  v_subrev_f32  v17, v46, v22                               // 0000188C: 0A222D2E
  v_mul_f32     v22, v58, v24                               // 00001890: 102C313A
  ds_write_b32  v44, v52                                    // 00001894: D8340000 0000342C
  v_add_f32     v15, v15, v19                               // 0000189C: 061E270F
  v_subrev_f32  v19, v48, v21                               // 000018A0: 0A262B30
  v_mul_f32     v21, v58, v17                               // 000018A4: 102A233A
  v_mad_f32     v22, -v28, v13, v22                         // 000018A8: D2820016 245A1B1C
  v_add_i32     v44, vcc, 0x00000cc0, v3                    // 000018B0: 4A5806FF 00000CC0
  v_add_f32     v14, v14, v18                               // 000018B8: 061C250E
  v_subrev_f32  v18, v57, v20                               // 000018BC: 0A242939
  v_mul_f32     v20, v58, v19                               // 000018C0: 1028273A
  v_mad_f32     v21, -v28, v15, v21                         // 000018C4: D2820015 24561F1C
  ds_write_b32  v44, v22                                    // 000018CC: D8340000 0000162C
  v_add_i32     v22, vcc, 0x00000dd0, v3                    // 000018D4: 4A2C06FF 00000DD0
  v_add_f32     v12, v12, v16                               // 000018DC: 0618210C
  v_mul_f32     v16, v58, v18                               // 000018E0: 1020253A
  v_mad_f32     v20, -v28, v14, v20                         // 000018E4: D2820014 24521D1C
  ds_write_b32  v22, v21                                    // 000018EC: D8340000 00001516
  v_add_i32     v21, vcc, 0x00000ee0, v3                    // 000018F4: 4A2A06FF 00000EE0
  v_mad_f32     v16, -v28, v12, v16                         // 000018FC: D2820010 2442191C
  ds_write_b32  v21, v20                                    // 00001904: D8340000 00001415
  v_add_i32     v20, vcc, 0x00000ff0, v3                    // 0000190C: 4A2806FF 00000FF0
  v_or_b32      v21, 0x00000440, v1                         // 00001914: 382A02FF 00000440
  ds_write_b32  v20, v16                                    // 0000191C: D8340000 00001014
  v_add_f32     v11, v34, v11                               // 00001924: 06161722
  v_lshlrev_b32  v16, 2, v21                                // 00001928: 34202A82
  v_add_f32     v20, v31, v35                               // 0000192C: 0628471F
  ds_write_b32  v16, v11                                    // 00001930: D8340000 00000B10
  v_add_i32     v11, vcc, 0x00001210, v3                    // 00001938: 4A1606FF 00001210
  v_add_f32     v16, v32, v36                               // 00001940: 06204920
  ds_write_b32  v11, v20                                    // 00001944: D8340000 0000140B
  v_add_i32     v11, vcc, 0x00001320, v3                    // 0000194C: 4A1606FF 00001320
  v_add_f32     v20, v33, v37                               // 00001954: 06284B21
  ds_write_b32  v11, v16                                    // 00001958: D8340000 0000100B
  v_add_i32     v11, vcc, 0x00001430, v3                    // 00001960: 4A1606FF 00001430
  v_mul_f32     v16, v60, v47                               // 00001968: 10205F3C
  ds_write_b32  v11, v20                                    // 0000196C: D8340000 0000140B
  v_mul_f32     v11, v60, v30                               // 00001974: 10163D3C
  v_mac_f32     v16, v27, v26                               // 00001978: 3E20351B
  v_add_i32     v20, vcc, 0x00001540, v3                    // 0000197C: 4A2806FF 00001540
  v_mul_f32     v21, v60, v65                               // 00001984: 102A833C
  v_mac_f32     v11, v27, v25                               // 00001988: 3E16331B
  ds_write_b32  v20, v16                                    // 0000198C: D8340000 00001014
  v_add_i32     v16, vcc, 0x00001650, v3                    // 00001994: 4A2006FF 00001650
  v_mul_f32     v20, v60, v64                               // 0000199C: 1028813C
  v_mac_f32     v21, v27, v23                               // 000019A0: 3E2A2F1B
  ds_write_b32  v16, v11                                    // 000019A4: D8340000 00000B10
  v_add_i32     v11, vcc, 0x00001760, v3                    // 000019AC: 4A1606FF 00001760
  v_mac_f32     v20, v27, v66                               // 000019B4: 3E28851B
  ds_write_b32  v11, v21                                    // 000019B8: D8340000 0000150B
  v_add_i32     v11, vcc, 0x00001870, v3                    // 000019C0: 4A1606FF 00001870
  v_mul_f32     v16, v59, v39                               // 000019C8: 10204F3B
  ds_write_b32  v11, v20                                    // 000019CC: D8340000 0000140B
  v_mul_f32     v11, v59, v40                               // 000019D4: 1016513B
  v_mac_f32     v16, v29, v38                               // 000019D8: 3E204D1D
  v_add_i32     v20, vcc, 0x00001980, v3                    // 000019DC: 4A2806FF 00001980
  v_mul_f32     v21, v59, v41                               // 000019E4: 102A533B
  v_mac_f32     v11, v29, v43                               // 000019E8: 3E16571D
  ds_write_b32  v20, v16                                    // 000019EC: D8340000 00001014
  v_add_i32     v16, vcc, 0x00001a90, v3                    // 000019F4: 4A2006FF 00001A90
  v_mul_f32     v20, v59, v50                               // 000019FC: 1028653B
  v_mac_f32     v21, v29, v42                               // 00001A00: 3E2A551D
  ds_write_b32  v16, v11                                    // 00001A04: D8340000 00000B10
  v_add_i32     v11, vcc, 0x00001ba0, v3                    // 00001A0C: 4A1606FF 00001BA0
  v_mac_f32     v20, v29, v45                               // 00001A14: 3E285B1D
  ds_write_b32  v11, v21                                    // 00001A18: D8340000 0000150B
  v_add_i32     v11, vcc, 0x00001cb0, v3                    // 00001A20: 4A1606FF 00001CB0
  v_mul_f32     v13, v58, v13                               // 00001A28: 101A1B3A
  ds_write_b32  v11, v20                                    // 00001A2C: D8340000 0000140B
  v_mul_f32     v11, v58, v15                               // 00001A34: 10161F3A
  v_mac_f32     v13, v28, v24                               // 00001A38: 3E1A311C
  v_add_i32     v15, vcc, 0x00001dc0, v3                    // 00001A3C: 4A1E06FF 00001DC0
  v_mul_f32     v14, v58, v14                               // 00001A44: 101C1D3A
  v_mac_f32     v11, v28, v17                               // 00001A48: 3E16231C
  ds_write_b32  v15, v13                                    // 00001A4C: D8340000 00000D0F
  v_add_i32     v13, vcc, 0x00001ed0, v3                    // 00001A54: 4A1A06FF 00001ED0
  v_lshrrev_b32  v1, 4, v1                                  // 00001A5C: 2C020284
  s_movk_i32    s4, 0x0110                                  // 00001A60: B0040110
  v_mul_f32     v12, v58, v12                               // 00001A64: 1018193A
  v_mac_f32     v14, v28, v19                               // 00001A68: 3E1C271C
  ds_write_b32  v13, v11                                    // 00001A6C: D8340000 00000B0D
  v_add_i32     v11, vcc, 0x00001fe0, v3                    // 00001A74: 4A1606FF 00001FE0
  v_and_b32     v0, 15, v0                                  // 00001A7C: 3600008F
  v_mul_i32_i24  v1, v1, s4                                 // 00001A80: D2120001 00000901
  v_mac_f32     v12, v28, v18                               // 00001A88: 3E18251C
  ds_write_b32  v11, v14                                    // 00001A8C: D8340000 00000E0B
  v_add_i32     v3, vcc, 0x000020f0, v3                     // 00001A94: 4A0606FF 000020F0
  v_or_b32      v0, v0, v1                                  // 00001A9C: 38000300
  ds_write_b32  v3, v12                                     // 00001AA0: D8340000 00000C03
  v_lshlrev_b32  v0, 2, v0                                  // 00001AA8: 34000082
  s_waitcnt     lgkmcnt(0)                                  // 00001AAC: BF8C007F
  s_barrier                                                 // 00001AB0: BF8A0000
  v_add_i32     v1, vcc, 0x000003f0, v0                     // 00001AB4: 4A0200FF 000003F0
  v_add_i32     v3, vcc, 0x000000c0, v0                     // 00001ABC: 4A0600FF 000000C0
  v_add_i32     v11, vcc, 0x000002e0, v0                    // 00001AC4: 4A1600FF 000002E0
  v_add_i32     v12, vcc, 0x000001d0, v0                    // 00001ACC: 4A1800FF 000001D0
  v_add_i32     v13, vcc, 0x00000370, v0                    // 00001AD4: 4A1A00FF 00000370
  v_add_i32     v14, vcc, 64, v0                            // 00001ADC: 4A1C00C0
  v_add_i32     v15, vcc, 0x00000260, v0                    // 00001AE0: 4A1E00FF 00000260
  v_add_i32     v16, vcc, 0x00000150, v0                    // 00001AE8: 4A2000FF 00000150
  v_add_i32     v17, vcc, 0x000003b0, v0                    // 00001AF0: 4A2200FF 000003B0
  v_add_i32     v18, vcc, 0x00000080, v0                    // 00001AF8: 4A2400FF 00000080
  v_add_i32     v19, vcc, 0x000002a0, v0                    // 00001B00: 4A2600FF 000002A0
  v_add_i32     v20, vcc, 0x00000190, v0                    // 00001B08: 4A2800FF 00000190
  v_add_i32     v21, vcc, 0x00000330, v0                    // 00001B10: 4A2A00FF 00000330
  v_add_i32     v22, vcc, 0x00000220, v0                    // 00001B18: 4A2C00FF 00000220
  v_add_i32     v23, vcc, 0x00000110, v0                    // 00001B20: 4A2E00FF 00000110
  v_add_i32     v24, vcc, 0x00001250, v0                    // 00001B28: 4A3000FF 00001250
  v_add_i32     v25, vcc, 0x00001360, v0                    // 00001B30: 4A3200FF 00001360
  v_add_i32     v26, vcc, 0x00001470, v0                    // 00001B38: 4A3400FF 00001470
  v_add_i32     v27, vcc, 0x00001140, v0                    // 00001B40: 4A3600FF 00001140
  v_add_i32     v28, vcc, 0x000012d0, v0                    // 00001B48: 4A3800FF 000012D0
  v_add_i32     v29, vcc, 0x000013e0, v0                    // 00001B50: 4A3A00FF 000013E0
  v_add_i32     v30, vcc, 0x000014f0, v0                    // 00001B58: 4A3C00FF 000014F0
  v_add_i32     v31, vcc, 0x000011c0, v0                    // 00001B60: 4A3E00FF 000011C0
  v_add_i32     v32, vcc, 0x00001210, v0                    // 00001B68: 4A4000FF 00001210
  v_add_i32     v33, vcc, 0x00001320, v0                    // 00001B70: 4A4200FF 00001320
  v_add_i32     v34, vcc, 0x00001430, v0                    // 00001B78: 4A4400FF 00001430
  v_add_i32     v35, vcc, 0x00001100, v0                    // 00001B80: 4A4600FF 00001100
  v_add_i32     v36, vcc, 0x00001290, v0                    // 00001B88: 4A4800FF 00001290
  v_add_i32     v37, vcc, 0x000013a0, v0                    // 00001B90: 4A4A00FF 000013A0
  v_add_i32     v38, vcc, 0x000014b0, v0                    // 00001B98: 4A4C00FF 000014B0
  v_add_i32     v39, vcc, 0x00001180, v0                    // 00001BA0: 4A4E00FF 00001180
  ds_read_b32   v1, v1                                      // 00001BA8: D8D80000 01000001
  ds_read_b32   v3, v3                                      // 00001BB0: D8D80000 03000003
  ds_read_b32   v11, v11                                    // 00001BB8: D8D80000 0B00000B
  ds_read_b32   v12, v12                                    // 00001BC0: D8D80000 0C00000C
  ds_read_b32   v13, v13                                    // 00001BC8: D8D80000 0D00000D
  ds_read_b32   v14, v14                                    // 00001BD0: D8D80000 0E00000E
  ds_read_b32   v15, v15                                    // 00001BD8: D8D80000 0F00000F
  ds_read_b32   v16, v16                                    // 00001BE0: D8D80000 10000010
  ds_read_b32   v17, v17                                    // 00001BE8: D8D80000 11000011
  ds_read_b32   v18, v18                                    // 00001BF0: D8D80000 12000012
  ds_read_b32   v19, v19                                    // 00001BF8: D8D80000 13000013
  ds_read_b32   v20, v20                                    // 00001C00: D8D80000 14000014
  ds_read_b32   v21, v21                                    // 00001C08: D8D80000 15000015
  ds_read_b32   v0, v0                                      // 00001C10: D8D80000 00000000
  ds_read_b32   v22, v22                                    // 00001C18: D8D80000 16000016
  ds_read_b32   v23, v23                                    // 00001C20: D8D80000 17000017
  ds_read_b32   v24, v24                                    // 00001C28: D8D80000 18000018
  ds_read_b32   v25, v25                                    // 00001C30: D8D80000 19000019
  ds_read_b32   v26, v26                                    // 00001C38: D8D80000 1A00001A
  ds_read_b32   v27, v27                                    // 00001C40: D8D80000 1B00001B
  ds_read_b32   v28, v28                                    // 00001C48: D8D80000 1C00001C
  ds_read_b32   v29, v29                                    // 00001C50: D8D80000 1D00001D
  ds_read_b32   v30, v30                                    // 00001C58: D8D80000 1E00001E
  ds_read_b32   v31, v31                                    // 00001C60: D8D80000 1F00001F
  ds_read_b32   v32, v32                                    // 00001C68: D8D80000 20000020
  ds_read_b32   v33, v33                                    // 00001C70: D8D80000 21000021
  ds_read_b32   v34, v34                                    // 00001C78: D8D80000 22000022
  ds_read_b32   v35, v35                                    // 00001C80: D8D80000 23000023
  ds_read_b32   v36, v36                                    // 00001C88: D8D80000 24000024
  ds_read_b32   v37, v37                                    // 00001C90: D8D80000 25000025
  ds_read_b32   v38, v38                                    // 00001C98: D8D80000 26000026
  ds_read_b32   v39, v39                                    // 00001CA0: D8D80000 27000027
  s_waitcnt     lgkmcnt(26)                                 // 00001CA8: BF8C1A7F
  v_add_f32     v40, v3, v14                                // 00001CAC: 06501D03
  s_waitcnt     lgkmcnt(24)                                 // 00001CB0: BF8C187F
  v_add_f32     v41, v12, v16                               // 00001CB4: 0652210C
  v_add_f32     v42, v11, v15                               // 00001CB8: 06541F0B
  v_add_f32     v43, v1, v13                                // 00001CBC: 06561B01
  s_waitcnt     lgkmcnt(18)                                 // 00001CC0: BF8C127F
  v_add_f32     v44, v18, v0                                // 00001CC4: 06580112
  s_waitcnt     lgkmcnt(16)                                 // 00001CC8: BF8C107F
  v_add_f32     v45, v20, v23                               // 00001CCC: 065A2F14
  v_add_f32     v46, v19, v22                               // 00001CD0: 065C2D13
  v_add_f32     v47, v17, v21                               // 00001CD4: 065E2B11
  v_add_f32     v48, v40, v44                               // 00001CD8: 06605928
  v_add_f32     v49, v41, v45                               // 00001CDC: 06625B29
  v_add_f32     v50, v42, v46                               // 00001CE0: 06645D2A
  v_add_f32     v51, v43, v47                               // 00001CE4: 06665F2B
  s_waitcnt     lgkmcnt(8)                                  // 00001CE8: BF8C087F
  v_sub_f32     v52, v27, v31                               // 00001CEC: 08683F1B
  v_sub_f32     v53, v24, v28                               // 00001CF0: 086A3918
  v_sub_f32     v54, v25, v29                               // 00001CF4: 086C3B19
  v_sub_f32     v55, v26, v30                               // 00001CF8: 086E3D1A
  v_subrev_f32  v0, v18, v0                                 // 00001CFC: 0A000112
  v_subrev_f32  v18, v20, v23                               // 00001D00: 0A242F14
  v_subrev_f32  v19, v19, v22                               // 00001D04: 0A262D13
  v_subrev_f32  v17, v17, v21                               // 00001D08: 0A222B11
  v_add_f32     v20, v52, v0                                // 00001D0C: 06280134
  v_add_f32     v21, v53, v18                               // 00001D10: 062A2535
  v_add_f32     v22, v54, v19                               // 00001D14: 062C2736
  v_add_f32     v23, v55, v17                               // 00001D18: 062E2337
  tbuffer_store_format_xyzw  v[48:51], v9, s[8:11], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 00001D1C: EBF71000 80023009
  s_waitcnt     expcnt(0)                                   // 00001D24: BF8C1F0F
  v_subrev_f32  v48, v40, v44                               // 00001D28: 0A605928
  v_subrev_f32  v49, v41, v45                               // 00001D2C: 0A625B29
  v_subrev_f32  v50, v42, v46                               // 00001D30: 0A645D2A
  v_subrev_f32  v51, v43, v47                               // 00001D34: 0A665F2B
  tbuffer_store_format_xyzw  v[20:23], v8, s[8:11], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 00001D38: EBF71000 80021408
  v_subrev_f32  v40, v52, v0                                // 00001D40: 0A500134
  v_subrev_f32  v41, v53, v18                               // 00001D44: 0A522535
  v_subrev_f32  v42, v54, v19                               // 00001D48: 0A542736
  v_subrev_f32  v43, v55, v17                               // 00001D4C: 0A562337
  v_add_f32     v19, v27, v31                               // 00001D50: 06263F1B
  s_waitcnt     expcnt(0)                                   // 00001D54: BF8C1F0F
  v_add_f32     v20, v24, v28                               // 00001D58: 06283918
  v_add_f32     v21, v25, v29                               // 00001D5C: 062A3B19
  v_add_f32     v22, v26, v30                               // 00001D60: 062C3D1A
  s_waitcnt     lgkmcnt(0)                                  // 00001D64: BF8C007F
  v_add_f32     v23, v35, v39                               // 00001D68: 062E4F23
  v_add_f32     v24, v32, v36                               // 00001D6C: 06304920
  v_add_f32     v25, v33, v37                               // 00001D70: 06324B21
  v_add_f32     v26, v34, v38                               // 00001D74: 06344D22
  tbuffer_store_format_xyzw  v[48:51], v10, s[8:11], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 00001D78: EBF71000 8002300A
  v_add_f32     v27, v19, v23                               // 00001D80: 06362F13
  v_add_f32     v28, v20, v24                               // 00001D84: 06383114
  v_add_f32     v29, v21, v25                               // 00001D88: 063A3315
  v_add_f32     v30, v22, v26                               // 00001D8C: 063C3516
  v_subrev_f32  v3, v3, v14                                 // 00001D90: 0A061D03
  v_subrev_f32  v12, v12, v16                               // 00001D94: 0A18210C
  v_subrev_f32  v11, v11, v15                               // 00001D98: 0A161F0B
  v_subrev_f32  v1, v1, v13                                 // 00001D9C: 0A021B01
  v_sub_f32     v13, v35, v39                               // 00001DA0: 081A4F23
  v_sub_f32     v14, v32, v36                               // 00001DA4: 081C4920
  v_sub_f32     v15, v33, v37                               // 00001DA8: 081E4B21
  v_sub_f32     v16, v34, v38                               // 00001DAC: 08204D22
  tbuffer_store_format_xyzw  v[40:43], v7, s[8:11], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 00001DB0: EBF71000 80022807
  v_subrev_f32  v31, v3, v13                                // 00001DB8: 0A3E1B03
  v_subrev_f32  v32, v12, v14                               // 00001DBC: 0A401D0C
  v_subrev_f32  v33, v11, v15                               // 00001DC0: 0A421F0B
  v_subrev_f32  v34, v1, v16                                // 00001DC4: 0A442101
  tbuffer_store_format_xyzw  v[27:30], v2, s[0:3], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 00001DC8: EBF71000 80001B02
  v_subrev_f32  v7, v19, v23                                // 00001DD0: 0A0E2F13
  v_subrev_f32  v8, v20, v24                                // 00001DD4: 0A103114
  v_subrev_f32  v9, v21, v25                                // 00001DD8: 0A123315
  v_subrev_f32  v10, v22, v26                               // 00001DDC: 0A143516
  tbuffer_store_format_xyzw  v[31:34], v5, s[0:3], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 00001DE0: EBF71000 80001F05
  v_add_f32     v17, v3, v13                                // 00001DE8: 06221B03
  v_add_f32     v18, v12, v14                               // 00001DEC: 06241D0C
  v_add_f32     v19, v11, v15                               // 00001DF0: 06261F0B
  v_add_f32     v20, v1, v16                                // 00001DF4: 06282101
  tbuffer_store_format_xyzw  v[7:10], v6, s[0:3], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 00001DF8: EBF71000 80000706
  tbuffer_store_format_xyzw  v[17:20], v4, s[0:3], 0 offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT] // 00001E00: EBF71000 80001104
  s_endpgm                                                  // 00001E08: BF810000

.global histogram256

.metadata

	COMPUTE_PGM_RSRC2:USER_SGPR      = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN      = 1
	COMPUTE_PGM_RSRC2:LDS_SIZE       = 128

	userElements[0]    = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1]    = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2]    = IMM_CONST_BUFFER, 1, s[8:11]

	FloatMode            = 192
	IeeeMode             = 0
	rat_op = 0x0c00

.args

	u32* data 0 uav11 RO const
	u8* sharedArray 16 hl RW
	u32* binResult 32 uav10 RW

.text

  s_mov_b32     m0, 0x00008000                              // 00000000: BEFC03FF 00008000
  s_buffer_load_dword  s0, s[8:11], 0x04                    // 00000008: C2000904
  v_lshlrev_b32  v1, 8, v0                                  // 0000000C: 34020088
  s_waitcnt     lgkmcnt(0)                                  // 00000010: BF8C007F
  v_add_i32     v2, vcc, s0, v1                             // 00000014: 4A040200
  v_mov_b32     v3, 0                                       // 00000018: 7E060280
  ds_write_b8   v2, v3                                      // 0000001C: D8780000 00000302
  v_add_i32     v4, vcc, 1, v2                              // 00000024: 4A080481
  ds_write_b8   v4, v3                                      // 00000028: D8780000 00000304
  v_add_i32     v4, vcc, 2, v2                              // 00000030: 4A080482
  ds_write_b8   v4, v3                                      // 00000034: D8780000 00000304
  v_add_i32     v4, vcc, 3, v2                              // 0000003C: 4A080483
  ds_write_b8   v4, v3                                      // 00000040: D8780000 00000304
  v_add_i32     v4, vcc, 4, v2                              // 00000048: 4A080484
  ds_write_b8   v4, v3                                      // 0000004C: D8780000 00000304
  v_add_i32     v4, vcc, 5, v2                              // 00000054: 4A080485
  ds_write_b8   v4, v3                                      // 00000058: D8780000 00000304
  v_add_i32     v4, vcc, 6, v2                              // 00000060: 4A080486
  ds_write_b8   v4, v3                                      // 00000064: D8780000 00000304
  v_add_i32     v4, vcc, 7, v2                              // 0000006C: 4A080487
  v_add_i32     v5, vcc, 8, v2                              // 00000070: 4A0A0488
  ds_write_b8   v4, v3                                      // 00000074: D8780000 00000304
  ds_write_b8   v5, v3                                      // 0000007C: D8780000 00000305
  v_add_i32     v4, vcc, 9, v2                              // 00000084: 4A080489
  ds_write_b8   v4, v3                                      // 00000088: D8780000 00000304
  v_add_i32     v4, vcc, 10, v2                             // 00000090: 4A08048A
  ds_write_b8   v4, v3                                      // 00000094: D8780000 00000304
  v_add_i32     v4, vcc, 11, v2                             // 0000009C: 4A08048B
  ds_write_b8   v4, v3                                      // 000000A0: D8780000 00000304
  v_add_i32     v4, vcc, 12, v2                             // 000000A8: 4A08048C
  ds_write_b8   v4, v3                                      // 000000AC: D8780000 00000304
  v_add_i32     v4, vcc, 13, v2                             // 000000B4: 4A08048D
  ds_write_b8   v4, v3                                      // 000000B8: D8780000 00000304
  v_add_i32     v4, vcc, 14, v2                             // 000000C0: 4A08048E
  ds_write_b8   v4, v3                                      // 000000C4: D8780000 00000304
  v_add_i32     v4, vcc, 15, v2                             // 000000CC: 4A08048F
  ds_write_b8   v4, v3                                      // 000000D0: D8780000 00000304
  v_add_i32     v4, vcc, 16, v2                             // 000000D8: 4A080490
  ds_write_b8   v4, v3                                      // 000000DC: D8780000 00000304
  v_add_i32     v4, vcc, 17, v2                             // 000000E4: 4A080491
  ds_write_b8   v4, v3                                      // 000000E8: D8780000 00000304
  v_add_i32     v4, vcc, 18, v2                             // 000000F0: 4A080492
  ds_write_b8   v4, v3                                      // 000000F4: D8780000 00000304
  v_add_i32     v4, vcc, 19, v2                             // 000000FC: 4A080493
  ds_write_b8   v4, v3                                      // 00000100: D8780000 00000304
  v_add_i32     v4, vcc, 20, v2                             // 00000108: 4A080494
  ds_write_b8   v4, v3                                      // 0000010C: D8780000 00000304
  v_add_i32     v4, vcc, 21, v2                             // 00000114: 4A080495
  ds_write_b8   v4, v3                                      // 00000118: D8780000 00000304
  v_add_i32     v4, vcc, 22, v2                             // 00000120: 4A080496
  ds_write_b8   v4, v3                                      // 00000124: D8780000 00000304
  v_add_i32     v4, vcc, 23, v2                             // 0000012C: 4A080497
  v_add_i32     v5, vcc, 24, v2                             // 00000130: 4A0A0498
  ds_write_b8   v4, v3                                      // 00000134: D8780000 00000304
  ds_write_b8   v5, v3                                      // 0000013C: D8780000 00000305
  v_add_i32     v4, vcc, 25, v2                             // 00000144: 4A080499
  ds_write_b8   v4, v3                                      // 00000148: D8780000 00000304
  v_add_i32     v4, vcc, 26, v2                             // 00000150: 4A08049A
  ds_write_b8   v4, v3                                      // 00000154: D8780000 00000304
  v_add_i32     v4, vcc, 27, v2                             // 0000015C: 4A08049B
  ds_write_b8   v4, v3                                      // 00000160: D8780000 00000304
  v_add_i32     v4, vcc, 28, v2                             // 00000168: 4A08049C
  ds_write_b8   v4, v3                                      // 0000016C: D8780000 00000304
  v_add_i32     v4, vcc, 29, v2                             // 00000174: 4A08049D
  ds_write_b8   v4, v3                                      // 00000178: D8780000 00000304
  v_add_i32     v4, vcc, 30, v2                             // 00000180: 4A08049E
  ds_write_b8   v4, v3                                      // 00000184: D8780000 00000304
  v_add_i32     v4, vcc, 31, v2                             // 0000018C: 4A08049F
  ds_write_b8   v4, v3                                      // 00000190: D8780000 00000304
  v_add_i32     v4, vcc, 32, v2                             // 00000198: 4A0804A0
  ds_write_b8   v4, v3                                      // 0000019C: D8780000 00000304
  v_add_i32     v4, vcc, 33, v2                             // 000001A4: 4A0804A1
  ds_write_b8   v4, v3                                      // 000001A8: D8780000 00000304
  v_add_i32     v4, vcc, 34, v2                             // 000001B0: 4A0804A2
  ds_write_b8   v4, v3                                      // 000001B4: D8780000 00000304
  v_add_i32     v4, vcc, 35, v2                             // 000001BC: 4A0804A3
  ds_write_b8   v4, v3                                      // 000001C0: D8780000 00000304
  v_add_i32     v4, vcc, 36, v2                             // 000001C8: 4A0804A4
  ds_write_b8   v4, v3                                      // 000001CC: D8780000 00000304
  v_add_i32     v4, vcc, 37, v2                             // 000001D4: 4A0804A5
  ds_write_b8   v4, v3                                      // 000001D8: D8780000 00000304
  v_add_i32     v4, vcc, 38, v2                             // 000001E0: 4A0804A6
  ds_write_b8   v4, v3                                      // 000001E4: D8780000 00000304
  v_add_i32     v4, vcc, 39, v2                             // 000001EC: 4A0804A7
  v_add_i32     v5, vcc, 40, v2                             // 000001F0: 4A0A04A8
  ds_write_b8   v4, v3                                      // 000001F4: D8780000 00000304
  ds_write_b8   v5, v3                                      // 000001FC: D8780000 00000305
  v_add_i32     v4, vcc, 41, v2                             // 00000204: 4A0804A9
  ds_write_b8   v4, v3                                      // 00000208: D8780000 00000304
  v_add_i32     v4, vcc, 42, v2                             // 00000210: 4A0804AA
  ds_write_b8   v4, v3                                      // 00000214: D8780000 00000304
  v_add_i32     v4, vcc, 43, v2                             // 0000021C: 4A0804AB
  ds_write_b8   v4, v3                                      // 00000220: D8780000 00000304
  v_add_i32     v4, vcc, 44, v2                             // 00000228: 4A0804AC
  ds_write_b8   v4, v3                                      // 0000022C: D8780000 00000304
  v_add_i32     v4, vcc, 45, v2                             // 00000234: 4A0804AD
  ds_write_b8   v4, v3                                      // 00000238: D8780000 00000304
  v_add_i32     v4, vcc, 46, v2                             // 00000240: 4A0804AE
  ds_write_b8   v4, v3                                      // 00000244: D8780000 00000304
  v_add_i32     v4, vcc, 47, v2                             // 0000024C: 4A0804AF
  ds_write_b8   v4, v3                                      // 00000250: D8780000 00000304
  v_add_i32     v4, vcc, 48, v2                             // 00000258: 4A0804B0
  ds_write_b8   v4, v3                                      // 0000025C: D8780000 00000304
  v_add_i32     v4, vcc, 49, v2                             // 00000264: 4A0804B1
  ds_write_b8   v4, v3                                      // 00000268: D8780000 00000304
  v_add_i32     v4, vcc, 50, v2                             // 00000270: 4A0804B2
  ds_write_b8   v4, v3                                      // 00000274: D8780000 00000304
  v_add_i32     v4, vcc, 51, v2                             // 0000027C: 4A0804B3
  ds_write_b8   v4, v3                                      // 00000280: D8780000 00000304
  v_add_i32     v4, vcc, 52, v2                             // 00000288: 4A0804B4
  ds_write_b8   v4, v3                                      // 0000028C: D8780000 00000304
  v_add_i32     v4, vcc, 53, v2                             // 00000294: 4A0804B5
  ds_write_b8   v4, v3                                      // 00000298: D8780000 00000304
  v_add_i32     v4, vcc, 54, v2                             // 000002A0: 4A0804B6
  ds_write_b8   v4, v3                                      // 000002A4: D8780000 00000304
  v_add_i32     v4, vcc, 55, v2                             // 000002AC: 4A0804B7
  v_add_i32     v5, vcc, 56, v2                             // 000002B0: 4A0A04B8
  ds_write_b8   v4, v3                                      // 000002B4: D8780000 00000304
  ds_write_b8   v5, v3                                      // 000002BC: D8780000 00000305
  v_add_i32     v4, vcc, 57, v2                             // 000002C4: 4A0804B9
  ds_write_b8   v4, v3                                      // 000002C8: D8780000 00000304
  v_add_i32     v4, vcc, 58, v2                             // 000002D0: 4A0804BA
  ds_write_b8   v4, v3                                      // 000002D4: D8780000 00000304
  v_add_i32     v4, vcc, 59, v2                             // 000002DC: 4A0804BB
  ds_write_b8   v4, v3                                      // 000002E0: D8780000 00000304
  v_add_i32     v4, vcc, 60, v2                             // 000002E8: 4A0804BC
  ds_write_b8   v4, v3                                      // 000002EC: D8780000 00000304
  v_add_i32     v4, vcc, 61, v2                             // 000002F4: 4A0804BD
  ds_write_b8   v4, v3                                      // 000002F8: D8780000 00000304
  v_add_i32     v4, vcc, 62, v2                             // 00000300: 4A0804BE
  ds_write_b8   v4, v3                                      // 00000304: D8780000 00000304
  v_add_i32     v4, vcc, 63, v2                             // 0000030C: 4A0804BF
  ds_write_b8   v4, v3                                      // 00000310: D8780000 00000304
  v_add_i32     v4, vcc, 64, v2                             // 00000318: 4A0804C0
  ds_write_b8   v4, v3                                      // 0000031C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000041, v2                     // 00000324: 4A0804FF 00000041
  ds_write_b8   v4, v3                                      // 0000032C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000042, v2                     // 00000334: 4A0804FF 00000042
  ds_write_b8   v4, v3                                      // 0000033C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000043, v2                     // 00000344: 4A0804FF 00000043
  ds_write_b8   v4, v3                                      // 0000034C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000044, v2                     // 00000354: 4A0804FF 00000044
  ds_write_b8   v4, v3                                      // 0000035C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000045, v2                     // 00000364: 4A0804FF 00000045
  ds_write_b8   v4, v3                                      // 0000036C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000046, v2                     // 00000374: 4A0804FF 00000046
  ds_write_b8   v4, v3                                      // 0000037C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000047, v2                     // 00000384: 4A0804FF 00000047
  v_add_i32     v5, vcc, 0x00000048, v2                     // 0000038C: 4A0A04FF 00000048
  ds_write_b8   v4, v3                                      // 00000394: D8780000 00000304
  ds_write_b8   v5, v3                                      // 0000039C: D8780000 00000305
  v_add_i32     v4, vcc, 0x00000049, v2                     // 000003A4: 4A0804FF 00000049
  ds_write_b8   v4, v3                                      // 000003AC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000004a, v2                     // 000003B4: 4A0804FF 0000004A
  ds_write_b8   v4, v3                                      // 000003BC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000004b, v2                     // 000003C4: 4A0804FF 0000004B
  ds_write_b8   v4, v3                                      // 000003CC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000004c, v2                     // 000003D4: 4A0804FF 0000004C
  ds_write_b8   v4, v3                                      // 000003DC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000004d, v2                     // 000003E4: 4A0804FF 0000004D
  ds_write_b8   v4, v3                                      // 000003EC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000004e, v2                     // 000003F4: 4A0804FF 0000004E
  ds_write_b8   v4, v3                                      // 000003FC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000004f, v2                     // 00000404: 4A0804FF 0000004F
  ds_write_b8   v4, v3                                      // 0000040C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000050, v2                     // 00000414: 4A0804FF 00000050
  ds_write_b8   v4, v3                                      // 0000041C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000051, v2                     // 00000424: 4A0804FF 00000051
  ds_write_b8   v4, v3                                      // 0000042C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000052, v2                     // 00000434: 4A0804FF 00000052
  ds_write_b8   v4, v3                                      // 0000043C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000053, v2                     // 00000444: 4A0804FF 00000053
  ds_write_b8   v4, v3                                      // 0000044C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000054, v2                     // 00000454: 4A0804FF 00000054
  ds_write_b8   v4, v3                                      // 0000045C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000055, v2                     // 00000464: 4A0804FF 00000055
  ds_write_b8   v4, v3                                      // 0000046C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000056, v2                     // 00000474: 4A0804FF 00000056
  ds_write_b8   v4, v3                                      // 0000047C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000057, v2                     // 00000484: 4A0804FF 00000057
  v_add_i32     v5, vcc, 0x00000058, v2                     // 0000048C: 4A0A04FF 00000058
  ds_write_b8   v4, v3                                      // 00000494: D8780000 00000304
  ds_write_b8   v5, v3                                      // 0000049C: D8780000 00000305
  v_add_i32     v4, vcc, 0x00000059, v2                     // 000004A4: 4A0804FF 00000059
  ds_write_b8   v4, v3                                      // 000004AC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000005a, v2                     // 000004B4: 4A0804FF 0000005A
  ds_write_b8   v4, v3                                      // 000004BC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000005b, v2                     // 000004C4: 4A0804FF 0000005B
  ds_write_b8   v4, v3                                      // 000004CC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000005c, v2                     // 000004D4: 4A0804FF 0000005C
  ds_write_b8   v4, v3                                      // 000004DC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000005d, v2                     // 000004E4: 4A0804FF 0000005D
  ds_write_b8   v4, v3                                      // 000004EC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000005e, v2                     // 000004F4: 4A0804FF 0000005E
  ds_write_b8   v4, v3                                      // 000004FC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000005f, v2                     // 00000504: 4A0804FF 0000005F
  ds_write_b8   v4, v3                                      // 0000050C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000060, v2                     // 00000514: 4A0804FF 00000060
  ds_write_b8   v4, v3                                      // 0000051C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000061, v2                     // 00000524: 4A0804FF 00000061
  ds_write_b8   v4, v3                                      // 0000052C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000062, v2                     // 00000534: 4A0804FF 00000062
  ds_write_b8   v4, v3                                      // 0000053C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000063, v2                     // 00000544: 4A0804FF 00000063
  ds_write_b8   v4, v3                                      // 0000054C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000064, v2                     // 00000554: 4A0804FF 00000064
  ds_write_b8   v4, v3                                      // 0000055C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000065, v2                     // 00000564: 4A0804FF 00000065
  ds_write_b8   v4, v3                                      // 0000056C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000066, v2                     // 00000574: 4A0804FF 00000066
  ds_write_b8   v4, v3                                      // 0000057C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000067, v2                     // 00000584: 4A0804FF 00000067
  v_add_i32     v5, vcc, 0x00000068, v2                     // 0000058C: 4A0A04FF 00000068
  ds_write_b8   v4, v3                                      // 00000594: D8780000 00000304
  ds_write_b8   v5, v3                                      // 0000059C: D8780000 00000305
  v_add_i32     v4, vcc, 0x00000069, v2                     // 000005A4: 4A0804FF 00000069
  ds_write_b8   v4, v3                                      // 000005AC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000006a, v2                     // 000005B4: 4A0804FF 0000006A
  ds_write_b8   v4, v3                                      // 000005BC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000006b, v2                     // 000005C4: 4A0804FF 0000006B
  ds_write_b8   v4, v3                                      // 000005CC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000006c, v2                     // 000005D4: 4A0804FF 0000006C
  ds_write_b8   v4, v3                                      // 000005DC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000006d, v2                     // 000005E4: 4A0804FF 0000006D
  ds_write_b8   v4, v3                                      // 000005EC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000006e, v2                     // 000005F4: 4A0804FF 0000006E
  ds_write_b8   v4, v3                                      // 000005FC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000006f, v2                     // 00000604: 4A0804FF 0000006F
  ds_write_b8   v4, v3                                      // 0000060C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000070, v2                     // 00000614: 4A0804FF 00000070
  ds_write_b8   v4, v3                                      // 0000061C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000071, v2                     // 00000624: 4A0804FF 00000071
  ds_write_b8   v4, v3                                      // 0000062C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000072, v2                     // 00000634: 4A0804FF 00000072
  ds_write_b8   v4, v3                                      // 0000063C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000073, v2                     // 00000644: 4A0804FF 00000073
  ds_write_b8   v4, v3                                      // 0000064C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000074, v2                     // 00000654: 4A0804FF 00000074
  ds_write_b8   v4, v3                                      // 0000065C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000075, v2                     // 00000664: 4A0804FF 00000075
  ds_write_b8   v4, v3                                      // 0000066C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000076, v2                     // 00000674: 4A0804FF 00000076
  ds_write_b8   v4, v3                                      // 0000067C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000077, v2                     // 00000684: 4A0804FF 00000077
  v_add_i32     v5, vcc, 0x00000078, v2                     // 0000068C: 4A0A04FF 00000078
  ds_write_b8   v4, v3                                      // 00000694: D8780000 00000304
  ds_write_b8   v5, v3                                      // 0000069C: D8780000 00000305
  v_add_i32     v4, vcc, 0x00000079, v2                     // 000006A4: 4A0804FF 00000079
  ds_write_b8   v4, v3                                      // 000006AC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000007a, v2                     // 000006B4: 4A0804FF 0000007A
  ds_write_b8   v4, v3                                      // 000006BC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000007b, v2                     // 000006C4: 4A0804FF 0000007B
  ds_write_b8   v4, v3                                      // 000006CC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000007c, v2                     // 000006D4: 4A0804FF 0000007C
  ds_write_b8   v4, v3                                      // 000006DC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000007d, v2                     // 000006E4: 4A0804FF 0000007D
  ds_write_b8   v4, v3                                      // 000006EC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000007e, v2                     // 000006F4: 4A0804FF 0000007E
  ds_write_b8   v4, v3                                      // 000006FC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000007f, v2                     // 00000704: 4A0804FF 0000007F
  ds_write_b8   v4, v3                                      // 0000070C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000080, v2                     // 00000714: 4A0804FF 00000080
  ds_write_b8   v4, v3                                      // 0000071C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000081, v2                     // 00000724: 4A0804FF 00000081
  ds_write_b8   v4, v3                                      // 0000072C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000082, v2                     // 00000734: 4A0804FF 00000082
  ds_write_b8   v4, v3                                      // 0000073C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000083, v2                     // 00000744: 4A0804FF 00000083
  ds_write_b8   v4, v3                                      // 0000074C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000084, v2                     // 00000754: 4A0804FF 00000084
  ds_write_b8   v4, v3                                      // 0000075C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000085, v2                     // 00000764: 4A0804FF 00000085
  ds_write_b8   v4, v3                                      // 0000076C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000086, v2                     // 00000774: 4A0804FF 00000086
  ds_write_b8   v4, v3                                      // 0000077C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000087, v2                     // 00000784: 4A0804FF 00000087
  v_add_i32     v5, vcc, 0x00000088, v2                     // 0000078C: 4A0A04FF 00000088
  ds_write_b8   v4, v3                                      // 00000794: D8780000 00000304
  ds_write_b8   v5, v3                                      // 0000079C: D8780000 00000305
  v_add_i32     v4, vcc, 0x00000089, v2                     // 000007A4: 4A0804FF 00000089
  ds_write_b8   v4, v3                                      // 000007AC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000008a, v2                     // 000007B4: 4A0804FF 0000008A
  ds_write_b8   v4, v3                                      // 000007BC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000008b, v2                     // 000007C4: 4A0804FF 0000008B
  ds_write_b8   v4, v3                                      // 000007CC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000008c, v2                     // 000007D4: 4A0804FF 0000008C
  ds_write_b8   v4, v3                                      // 000007DC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000008d, v2                     // 000007E4: 4A0804FF 0000008D
  ds_write_b8   v4, v3                                      // 000007EC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000008e, v2                     // 000007F4: 4A0804FF 0000008E
  ds_write_b8   v4, v3                                      // 000007FC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000008f, v2                     // 00000804: 4A0804FF 0000008F
  ds_write_b8   v4, v3                                      // 0000080C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000090, v2                     // 00000814: 4A0804FF 00000090
  ds_write_b8   v4, v3                                      // 0000081C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000091, v2                     // 00000824: 4A0804FF 00000091
  ds_write_b8   v4, v3                                      // 0000082C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000092, v2                     // 00000834: 4A0804FF 00000092
  ds_write_b8   v4, v3                                      // 0000083C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000093, v2                     // 00000844: 4A0804FF 00000093
  ds_write_b8   v4, v3                                      // 0000084C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000094, v2                     // 00000854: 4A0804FF 00000094
  ds_write_b8   v4, v3                                      // 0000085C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000095, v2                     // 00000864: 4A0804FF 00000095
  ds_write_b8   v4, v3                                      // 0000086C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000096, v2                     // 00000874: 4A0804FF 00000096
  ds_write_b8   v4, v3                                      // 0000087C: D8780000 00000304
  v_add_i32     v4, vcc, 0x00000097, v2                     // 00000884: 4A0804FF 00000097
  v_add_i32     v5, vcc, 0x00000098, v2                     // 0000088C: 4A0A04FF 00000098
  ds_write_b8   v4, v3                                      // 00000894: D8780000 00000304
  ds_write_b8   v5, v3                                      // 0000089C: D8780000 00000305
  v_add_i32     v4, vcc, 0x00000099, v2                     // 000008A4: 4A0804FF 00000099
  ds_write_b8   v4, v3                                      // 000008AC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000009a, v2                     // 000008B4: 4A0804FF 0000009A
  ds_write_b8   v4, v3                                      // 000008BC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000009b, v2                     // 000008C4: 4A0804FF 0000009B
  ds_write_b8   v4, v3                                      // 000008CC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000009c, v2                     // 000008D4: 4A0804FF 0000009C
  ds_write_b8   v4, v3                                      // 000008DC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000009d, v2                     // 000008E4: 4A0804FF 0000009D
  ds_write_b8   v4, v3                                      // 000008EC: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000009e, v2                     // 000008F4: 4A0804FF 0000009E
  s_buffer_load_dword  s1, s[4:7], 0x1c                     // 000008FC: C200851C
  s_waitcnt     lgkmcnt(0)                                  // 00000900: BF8C007F
  ds_write_b8   v4, v3                                      // 00000904: D8780000 00000304
  v_add_i32     v4, vcc, 0x0000009f, v2                     // 0000090C: 4A0804FF 0000009F
  s_buffer_load_dword  s4, s[4:7], 0x04                     // 00000914: C2020504
  ds_write_b8   v4, v3                                      // 00000918: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000a0, v2                     // 00000920: 4A0804FF 000000A0
  s_buffer_load_dword  s5, s[8:11], 0x00                    // 00000928: C2028900
  ds_write_b8   v4, v3                                      // 0000092C: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000a1, v2                     // 00000934: 4A0804FF 000000A1
  ds_write_b8   v4, v3                                      // 0000093C: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000a2, v2                     // 00000944: 4A0804FF 000000A2
  ds_write_b8   v4, v3                                      // 0000094C: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000a3, v2                     // 00000954: 4A0804FF 000000A3
  s_add_i32     s1, s12, s1                                 // 0000095C: 8101010C
  ds_write_b8   v4, v3                                      // 00000960: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000a4, v2                     // 00000968: 4A0804FF 000000A4
  ds_write_b8   v4, v3                                      // 00000970: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000a5, v2                     // 00000978: 4A0804FF 000000A5
  v_lshlrev_b32  v5, 2, v0                                  // 00000980: 340A0082
  s_waitcnt     lgkmcnt(0)                                  // 00000984: BF8C007F
  s_mul_i32     s6, s1, s4                                  // 00000988: 93060401
  ds_write_b8   v4, v3                                      // 0000098C: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000a6, v2                     // 00000994: 4A0804FF 000000A6
  v_add_i32     v5, vcc, s5, v5                             // 0000099C: 4A0A0A05
  s_lshl_b32    s5, s6, 10                                  // 000009A0: 8F058A06
  ds_write_b8   v4, v3                                      // 000009A4: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000a7, v2                     // 000009AC: 4A0804FF 000000A7
  v_add_i32     v6, vcc, s5, v5                             // 000009B4: 4A0C0A05
  s_load_dwordx4  s[12:15], s[2:3], 0x58                    // 000009B8: C0860358
  v_add_i32     v7, vcc, 0x000000a8, v2                     // 000009BC: 4A0E04FF 000000A8
  ds_write_b8   v4, v3                                      // 000009C4: D8780000 00000304
  ds_write_b8   v7, v3                                      // 000009CC: D8780000 00000307
  v_add_i32     v4, vcc, 0x000000a9, v2                     // 000009D4: 4A0804FF 000000A9
  ds_write_b8   v4, v3                                      // 000009DC: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000aa, v2                     // 000009E4: 4A0804FF 000000AA
  s_lshl_b32    s5, s1, 8                                   // 000009EC: 8F058801
  ds_write_b8   v4, v3                                      // 000009F0: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000ab, v2                     // 000009F8: 4A0804FF 000000AB
  s_or_b32      s6, 1, s5                                   // 00000A00: 88060581
  ds_write_b8   v4, v3                                      // 00000A04: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000ac, v2                     // 00000A0C: 4A0804FF 000000AC
  s_mul_i32     s6, s4, s6                                  // 00000A14: 93060604
  s_waitcnt     lgkmcnt(0)                                  // 00000A18: BF8C007F
  tbuffer_load_format_x  v7, v6, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000A1C: EBA01000 80030706
  s_waitcnt     vmcnt(0)                                    // 00000A24: BF8C1F70
  ds_write_b8   v4, v3                                      // 00000A28: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000ad, v2                     // 00000A30: 4A0804FF 000000AD
  s_lshl_b32    s6, s6, 2                                   // 00000A38: 8F068206
  ds_write_b8   v4, v3                                      // 00000A3C: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000ae, v2                     // 00000A44: 4A0804FF 000000AE
  v_add_i32     v8, vcc, s6, v5                             // 00000A4C: 4A100A06
  ds_write_b8   v4, v3                                      // 00000A50: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000af, v2                     // 00000A58: 4A0804FF 000000AF
  ds_write_b8   v4, v3                                      // 00000A60: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000b0, v2                     // 00000A68: 4A0804FF 000000B0
  ds_write_b8   v4, v3                                      // 00000A70: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000b1, v2                     // 00000A78: 4A0804FF 000000B1
  ds_write_b8   v4, v3                                      // 00000A80: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000b2, v2                     // 00000A88: 4A0804FF 000000B2
  s_or_b32      s6, 2, s5                                   // 00000A90: 88060582
  ds_write_b8   v4, v3                                      // 00000A94: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000b3, v2                     // 00000A9C: 4A0804FF 000000B3
  s_mul_i32     s6, s4, s6                                  // 00000AA4: 93060604
  tbuffer_load_format_x  v9, v8, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000AA8: EBA01000 80030908
  ds_write_b8   v4, v3                                      // 00000AB0: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000b4, v2                     // 00000AB8: 4A0804FF 000000B4
  s_lshl_b32    s6, s6, 2                                   // 00000AC0: 8F068206
  ds_write_b8   v4, v3                                      // 00000AC4: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000b5, v2                     // 00000ACC: 4A0804FF 000000B5
  v_add_i32     v10, vcc, s6, v5                            // 00000AD4: 4A140A06
  ds_write_b8   v4, v3                                      // 00000AD8: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000b6, v2                     // 00000AE0: 4A0804FF 000000B6
  ds_write_b8   v4, v3                                      // 00000AE8: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000b7, v2                     // 00000AF0: 4A0804FF 000000B7
  v_add_i32     v11, vcc, 0x000000b8, v2                    // 00000AF8: 4A1604FF 000000B8
  ds_write_b8   v4, v3                                      // 00000B00: D8780000 00000304
  ds_write_b8   v11, v3                                     // 00000B08: D8780000 0000030B
  v_add_i32     v4, vcc, 0x000000b9, v2                     // 00000B10: 4A0804FF 000000B9
  s_or_b32      s6, 3, s5                                   // 00000B18: 88060583
  ds_write_b8   v4, v3                                      // 00000B1C: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000ba, v2                     // 00000B24: 4A0804FF 000000BA
  s_mul_i32     s6, s4, s6                                  // 00000B2C: 93060604
  tbuffer_load_format_x  v11, v10, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000B30: EBA01000 80030B0A
  ds_write_b8   v4, v3                                      // 00000B38: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000bb, v2                     // 00000B40: 4A0804FF 000000BB
  s_lshl_b32    s6, s6, 2                                   // 00000B48: 8F068206
  ds_write_b8   v4, v3                                      // 00000B4C: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000bc, v2                     // 00000B54: 4A0804FF 000000BC
  v_add_i32     v12, vcc, s6, v5                            // 00000B5C: 4A180A06
  ds_write_b8   v4, v3                                      // 00000B60: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000bd, v2                     // 00000B68: 4A0804FF 000000BD
  ds_write_b8   v4, v3                                      // 00000B70: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000be, v2                     // 00000B78: 4A0804FF 000000BE
  ds_write_b8   v4, v3                                      // 00000B80: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000bf, v2                     // 00000B88: 4A0804FF 000000BF
  ds_write_b8   v4, v3                                      // 00000B90: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000c0, v2                     // 00000B98: 4A0804FF 000000C0
  s_or_b32      s6, 4, s5                                   // 00000BA0: 88060584
  ds_write_b8   v4, v3                                      // 00000BA4: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000c1, v2                     // 00000BAC: 4A0804FF 000000C1
  s_mul_i32     s6, s4, s6                                  // 00000BB4: 93060604
  tbuffer_load_format_x  v13, v12, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000BB8: EBA01000 80030D0C
  ds_write_b8   v4, v3                                      // 00000BC0: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000c2, v2                     // 00000BC8: 4A0804FF 000000C2
  s_lshl_b32    s6, s6, 2                                   // 00000BD0: 8F068206
  ds_write_b8   v4, v3                                      // 00000BD4: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000c3, v2                     // 00000BDC: 4A0804FF 000000C3
  v_add_i32     v14, vcc, s6, v5                            // 00000BE4: 4A1C0A06
  ds_write_b8   v4, v3                                      // 00000BE8: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000c4, v2                     // 00000BF0: 4A0804FF 000000C4
  ds_write_b8   v4, v3                                      // 00000BF8: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000c5, v2                     // 00000C00: 4A0804FF 000000C5
  ds_write_b8   v4, v3                                      // 00000C08: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000c6, v2                     // 00000C10: 4A0804FF 000000C6
  ds_write_b8   v4, v3                                      // 00000C18: D8780000 00000304
  v_add_i32     v4, vcc, 0x000000c7, v2                     // 00000C20: 4A0804FF 000000C7
  s_or_b32      s6, 5, s5                                   // 00000C28: 88060585
  v_add_i32     v15, vcc, 0x000000c8, v2                    // 00000C2C: 4A1E04FF 000000C8
  ds_write_b8   v4, v3                                      // 00000C34: D8780000 00000304
  s_mul_i32     s6, s4, s6                                  // 00000C3C: 93060604
  tbuffer_load_format_x  v4, v14, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000C40: EBA01000 8003040E
  ds_write_b8   v15, v3                                     // 00000C48: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000c9, v2                    // 00000C50: 4A1E04FF 000000C9
  s_lshl_b32    s6, s6, 2                                   // 00000C58: 8F068206
  ds_write_b8   v15, v3                                     // 00000C5C: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000ca, v2                    // 00000C64: 4A1E04FF 000000CA
  v_add_i32     v16, vcc, s6, v5                            // 00000C6C: 4A200A06
  ds_write_b8   v15, v3                                     // 00000C70: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000cb, v2                    // 00000C78: 4A1E04FF 000000CB
  ds_write_b8   v15, v3                                     // 00000C80: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000cc, v2                    // 00000C88: 4A1E04FF 000000CC
  ds_write_b8   v15, v3                                     // 00000C90: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000cd, v2                    // 00000C98: 4A1E04FF 000000CD
  ds_write_b8   v15, v3                                     // 00000CA0: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000ce, v2                    // 00000CA8: 4A1E04FF 000000CE
  s_or_b32      s6, 6, s5                                   // 00000CB0: 88060586
  ds_write_b8   v15, v3                                     // 00000CB4: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000cf, v2                    // 00000CBC: 4A1E04FF 000000CF
  s_mul_i32     s6, s4, s6                                  // 00000CC4: 93060604
  tbuffer_load_format_x  v17, v16, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000CC8: EBA01000 80031110
  ds_write_b8   v15, v3                                     // 00000CD0: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000d0, v2                    // 00000CD8: 4A1E04FF 000000D0
  s_lshl_b32    s6, s6, 2                                   // 00000CE0: 8F068206
  ds_write_b8   v15, v3                                     // 00000CE4: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000d1, v2                    // 00000CEC: 4A1E04FF 000000D1
  v_add_i32     v18, vcc, s6, v5                            // 00000CF4: 4A240A06
  ds_write_b8   v15, v3                                     // 00000CF8: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000d2, v2                    // 00000D00: 4A1E04FF 000000D2
  ds_write_b8   v15, v3                                     // 00000D08: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000d3, v2                    // 00000D10: 4A1E04FF 000000D3
  ds_write_b8   v15, v3                                     // 00000D18: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000d4, v2                    // 00000D20: 4A1E04FF 000000D4
  ds_write_b8   v15, v3                                     // 00000D28: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000d5, v2                    // 00000D30: 4A1E04FF 000000D5
  s_or_b32      s5, 7, s5                                   // 00000D38: 88050587
  ds_write_b8   v15, v3                                     // 00000D3C: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000d6, v2                    // 00000D44: 4A1E04FF 000000D6
  s_mul_i32     s5, s4, s5                                  // 00000D4C: 93050504
  tbuffer_load_format_x  v19, v18, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000D50: EBA01000 80031312
  ds_write_b8   v15, v3                                     // 00000D58: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000d7, v2                    // 00000D60: 4A1E04FF 000000D7
  s_lshl_b32    s5, s5, 2                                   // 00000D68: 8F058205
  v_add_i32     v20, vcc, 0x000000d8, v2                    // 00000D6C: 4A2804FF 000000D8
  ds_write_b8   v15, v3                                     // 00000D74: D8780000 0000030F
  v_add_i32     v5, vcc, s5, v5                             // 00000D7C: 4A0A0A05
  ds_write_b8   v20, v3                                     // 00000D80: D8780000 00000314
  v_add_i32     v15, vcc, 0x000000d9, v2                    // 00000D88: 4A1E04FF 000000D9
  ds_write_b8   v15, v3                                     // 00000D90: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000da, v2                    // 00000D98: 4A1E04FF 000000DA
  ds_write_b8   v15, v3                                     // 00000DA0: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000db, v2                    // 00000DA8: 4A1E04FF 000000DB
  ds_write_b8   v15, v3                                     // 00000DB0: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000dc, v2                    // 00000DB8: 4A1E04FF 000000DC
  ds_write_b8   v15, v3                                     // 00000DC0: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000dd, v2                    // 00000DC8: 4A1E04FF 000000DD
  tbuffer_load_format_x  v20, v5, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000DD0: EBA01000 80031405
  ds_write_b8   v15, v3                                     // 00000DD8: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000de, v2                    // 00000DE0: 4A1E04FF 000000DE
  s_lshl_b32    s5, s4, 5                                   // 00000DE8: 8F058504
  ds_write_b8   v15, v3                                     // 00000DEC: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000df, v2                    // 00000DF4: 4A1E04FF 000000DF
  v_add_i32     v21, vcc, s5, v6                            // 00000DFC: 4A2A0C05
  ds_write_b8   v15, v3                                     // 00000E00: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000e0, v2                    // 00000E08: 4A1E04FF 000000E0
  ds_write_b8   v15, v3                                     // 00000E10: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000e1, v2                    // 00000E18: 4A1E04FF 000000E1
  ds_write_b8   v15, v3                                     // 00000E20: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000e2, v2                    // 00000E28: 4A1E04FF 000000E2
  ds_write_b8   v15, v3                                     // 00000E30: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000e3, v2                    // 00000E38: 4A1E04FF 000000E3
  ds_write_b8   v15, v3                                     // 00000E40: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000e4, v2                    // 00000E48: 4A1E04FF 000000E4
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000E50: EBA01000 80031515
  ds_write_b8   v15, v3                                     // 00000E58: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000e5, v2                    // 00000E60: 4A1E04FF 000000E5
  ds_write_b8   v15, v3                                     // 00000E68: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000e6, v2                    // 00000E70: 4A1E04FF 000000E6
  v_add_i32     v22, vcc, s5, v8                            // 00000E78: 4A2C1005
  ds_write_b8   v15, v3                                     // 00000E7C: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000e7, v2                    // 00000E84: 4A1E04FF 000000E7
  v_add_i32     v23, vcc, 0x000000e8, v2                    // 00000E8C: 4A2E04FF 000000E8
  ds_write_b8   v15, v3                                     // 00000E94: D8780000 0000030F
  ds_write_b8   v23, v3                                     // 00000E9C: D8780000 00000317
  v_add_i32     v15, vcc, 0x000000e9, v2                    // 00000EA4: 4A1E04FF 000000E9
  ds_write_b8   v15, v3                                     // 00000EAC: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000ea, v2                    // 00000EB4: 4A1E04FF 000000EA
  ds_write_b8   v15, v3                                     // 00000EBC: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000eb, v2                    // 00000EC4: 4A1E04FF 000000EB
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000ECC: EBA01000 80031616
  ds_write_b8   v15, v3                                     // 00000ED4: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000ec, v2                    // 00000EDC: 4A1E04FF 000000EC
  ds_write_b8   v15, v3                                     // 00000EE4: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000ed, v2                    // 00000EEC: 4A1E04FF 000000ED
  v_add_i32     v23, vcc, s5, v10                           // 00000EF4: 4A2E1405
  ds_write_b8   v15, v3                                     // 00000EF8: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000ee, v2                    // 00000F00: 4A1E04FF 000000EE
  ds_write_b8   v15, v3                                     // 00000F08: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000ef, v2                    // 00000F10: 4A1E04FF 000000EF
  ds_write_b8   v15, v3                                     // 00000F18: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000f0, v2                    // 00000F20: 4A1E04FF 000000F0
  ds_write_b8   v15, v3                                     // 00000F28: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000f1, v2                    // 00000F30: 4A1E04FF 000000F1
  ds_write_b8   v15, v3                                     // 00000F38: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000f2, v2                    // 00000F40: 4A1E04FF 000000F2
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000F48: EBA01000 80031717
  ds_write_b8   v15, v3                                     // 00000F50: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000f3, v2                    // 00000F58: 4A1E04FF 000000F3
  ds_write_b8   v15, v3                                     // 00000F60: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000f4, v2                    // 00000F68: 4A1E04FF 000000F4
  v_add_i32     v24, vcc, s5, v12                           // 00000F70: 4A301805
  ds_write_b8   v15, v3                                     // 00000F74: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000f5, v2                    // 00000F7C: 4A1E04FF 000000F5
  ds_write_b8   v15, v3                                     // 00000F84: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000f6, v2                    // 00000F8C: 4A1E04FF 000000F6
  ds_write_b8   v15, v3                                     // 00000F94: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000f7, v2                    // 00000F9C: 4A1E04FF 000000F7
  v_add_i32     v25, vcc, 0x000000f8, v2                    // 00000FA4: 4A3204FF 000000F8
  ds_write_b8   v15, v3                                     // 00000FAC: D8780000 0000030F
  ds_write_b8   v25, v3                                     // 00000FB4: D8780000 00000319
  v_add_i32     v15, vcc, 0x000000f9, v2                    // 00000FBC: 4A1E04FF 000000F9
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00000FC4: EBA01000 80031818
  ds_write_b8   v15, v3                                     // 00000FCC: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000fa, v2                    // 00000FD4: 4A1E04FF 000000FA
  ds_write_b8   v15, v3                                     // 00000FDC: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000fb, v2                    // 00000FE4: 4A1E04FF 000000FB
  v_add_i32     v25, vcc, s5, v14                           // 00000FEC: 4A321C05
  ds_write_b8   v15, v3                                     // 00000FF0: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000fc, v2                    // 00000FF8: 4A1E04FF 000000FC
  v_add_i32     v7, vcc, v1, v7                             // 00001000: 4A0E0F01
  ds_write_b8   v15, v3                                     // 00001004: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000fd, v2                    // 0000100C: 4A1E04FF 000000FD
  v_add_i32     v7, vcc, s0, v7                             // 00001014: 4A0E0E00
  ds_write_b8   v15, v3                                     // 00001018: D8780000 0000030F
  v_add_i32     v15, vcc, 0x000000fe, v2                    // 00001020: 4A1E04FF 000000FE
  ds_write_b8   v15, v3                                     // 00001028: D8780000 0000030F
  v_add_i32     v2, vcc, 0x000000ff, v2                     // 00001030: 4A0404FF 000000FF
  ds_write_b8   v2, v3                                      // 00001038: D8780000 00000302
  tbuffer_load_format_x  v2, v25, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001040: EBA01000 80030219
  s_waitcnt     vmcnt(0) & lgkmcnt(0)                       // 00001048: BF8C0070
  s_barrier                                                 // 0000104C: BF8A0000
  ds_read_i8    v3, v7                                      // 00001050: D8E40000 03000007
  v_add_i32     v15, vcc, s5, v16                           // 00001058: 4A1E2005
  v_add_i32     v9, vcc, v1, v9                             // 0000105C: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00001060: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00001064: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 00001068: 4A060681
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000106C: EBA01000 80030F0F
  ds_write_b8   v7, v3                                      // 00001074: D8780000 00000307
  ds_read_i8    v3, v9                                      // 0000107C: D8E40000 03000009
  v_add_i32     v7, vcc, s5, v18                            // 00001084: 4A0E2405
  v_add_i32     v11, vcc, v1, v11                           // 00001088: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 0000108C: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00001090: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 00001094: 4A060681
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001098: EBA01000 80030707
  ds_write_b8   v9, v3                                      // 000010A0: D8780000 00000309
  ds_read_i8    v3, v11                                     // 000010A8: D8E40000 0300000B
  v_add_i32     v9, vcc, s5, v5                             // 000010B0: 4A120A05
  v_add_i32     v13, vcc, v1, v13                           // 000010B4: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 000010B8: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 000010BC: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 000010C0: 4A060681
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000010C4: EBA01000 80030909
  ds_write_b8   v11, v3                                     // 000010CC: D8780000 0000030B
  s_add_i32     s6, s5, s5                                  // 000010D4: 81060505
  ds_read_i8    v3, v13                                     // 000010D8: D8E40000 0300000D
  v_add_i32     v11, vcc, s6, v6                            // 000010E0: 4A160C06
  v_add_i32     v4, vcc, v1, v4                             // 000010E4: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 000010E8: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 000010EC: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 000010F0: 4A060681
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000010F4: EBA01000 80030B0B
  ds_write_b8   v13, v3                                     // 000010FC: D8780000 0000030D
  ds_read_i8    v3, v4                                      // 00001104: D8E40000 03000004
  v_add_i32     v13, vcc, s6, v8                            // 0000110C: 4A1A1006
  v_add_i32     v17, vcc, v1, v17                           // 00001110: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00001114: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 00001118: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 0000111C: 4A060681
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001120: EBA01000 80030D0D
  ds_write_b8   v4, v3                                      // 00001128: D8780000 00000304
  ds_read_i8    v3, v17                                     // 00001130: D8E40000 03000011
  v_add_i32     v4, vcc, s6, v10                            // 00001138: 4A081406
  v_add_i32     v19, vcc, v1, v19                           // 0000113C: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00001140: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00001144: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 00001148: 4A060681
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000114C: EBA01000 80030404
  ds_write_b8   v17, v3                                     // 00001154: D8780000 00000311
  ds_read_i8    v3, v19                                     // 0000115C: D8E40000 03000013
  v_add_i32     v17, vcc, s6, v12                           // 00001164: 4A221806
  v_add_i32     v20, vcc, v1, v20                           // 00001168: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 0000116C: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00001170: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 00001174: 4A060681
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001178: EBA01000 80031111
  ds_write_b8   v19, v3                                     // 00001180: D8780000 00000313
  ds_read_i8    v3, v20                                     // 00001188: D8E40000 03000014
  v_add_i32     v19, vcc, s6, v14                           // 00001190: 4A261C06
  v_add_i32     v21, vcc, v1, v21                           // 00001194: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00001198: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 0000119C: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 000011A0: 4A060681
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000011A4: EBA01000 80031313
  ds_write_b8   v20, v3                                     // 000011AC: D8780000 00000314
  ds_read_i8    v3, v21                                     // 000011B4: D8E40000 03000015
  v_add_i32     v20, vcc, s6, v16                           // 000011BC: 4A282006
  v_add_i32     v22, vcc, v1, v22                           // 000011C0: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 000011C4: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 000011C8: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 000011CC: 4A060681
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000011D0: EBA01000 80031414
  ds_write_b8   v21, v3                                     // 000011D8: D8780000 00000315
  ds_read_i8    v3, v22                                     // 000011E0: D8E40000 03000016
  v_add_i32     v21, vcc, s6, v18                           // 000011E8: 4A2A2406
  v_add_i32     v23, vcc, v1, v23                           // 000011EC: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 000011F0: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 000011F4: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 000011F8: 4A060681
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000011FC: EBA01000 80031515
  ds_write_b8   v22, v3                                     // 00001204: D8780000 00000316
  ds_read_i8    v3, v23                                     // 0000120C: D8E40000 03000017
  v_add_i32     v22, vcc, s6, v5                            // 00001214: 4A2C0A06
  v_add_i32     v24, vcc, v1, v24                           // 00001218: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 0000121C: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 00001220: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 00001224: 4A060681
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001228: EBA01000 80031616
  ds_write_b8   v23, v3                                     // 00001230: D8780000 00000317
  s_add_i32     s6, s5, s6                                  // 00001238: 81060605
  ds_read_i8    v3, v24                                     // 0000123C: D8E40000 03000018
  v_add_i32     v23, vcc, s6, v6                            // 00001244: 4A2E0C06
  v_add_i32     v2, vcc, v1, v2                             // 00001248: 4A040501
  v_add_i32     v2, vcc, s0, v2                             // 0000124C: 4A040400
  s_waitcnt     lgkmcnt(0)                                  // 00001250: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 00001254: 4A060681
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001258: EBA01000 80031717
  ds_write_b8   v24, v3                                     // 00001260: D8780000 00000318
  ds_read_i8    v3, v2                                      // 00001268: D8E40000 03000002
  v_add_i32     v24, vcc, s6, v8                            // 00001270: 4A301006
  s_waitcnt     vmcnt(11)                                   // 00001274: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00001278: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 0000127C: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00001280: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 00001284: 4A060681
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001288: EBA01000 80031818
  ds_write_b8   v2, v3                                      // 00001290: D8780000 00000302
  ds_read_i8    v2, v15                                     // 00001298: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v10                            // 000012A0: 4A061406
  s_waitcnt     vmcnt(11)                                   // 000012A4: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 000012A8: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 000012AC: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 000012B0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000012B4: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000012B8: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 000012C0: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 000012C8: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v12                           // 000012D0: 4A1E1806
  s_waitcnt     vmcnt(11)                                   // 000012D4: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 000012D8: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 000012DC: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 000012E0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000012E4: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000012E8: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 000012F0: D8780000 00000207
  ds_read_i8    v2, v9                                      // 000012F8: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v14                            // 00001300: 4A0E1C06
  s_waitcnt     vmcnt(11)                                   // 00001304: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00001308: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 0000130C: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00001310: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001314: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001318: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00001320: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00001328: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v16                            // 00001330: 4A122006
  s_waitcnt     vmcnt(11)                                   // 00001334: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00001338: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 0000133C: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00001340: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001344: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001348: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00001350: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 00001358: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v18                           // 00001360: 4A162406
  s_waitcnt     vmcnt(11)                                   // 00001364: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 00001368: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 0000136C: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00001370: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001374: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001378: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00001380: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 00001388: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v5                            // 00001390: 4A1A0A06
  s_waitcnt     vmcnt(11)                                   // 00001394: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 00001398: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 0000139C: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 000013A0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000013A4: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000013A8: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 000013B0: D8780000 00000204
  s_add_i32     s6, s5, s6                                  // 000013B8: 81060605
  ds_read_i8    v2, v17                                     // 000013BC: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v6                             // 000013C4: 4A080C06
  s_waitcnt     vmcnt(11)                                   // 000013C8: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 000013CC: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 000013D0: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 000013D4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000013D8: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000013DC: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 000013E4: D8780000 00000211
  ds_read_i8    v2, v19                                     // 000013EC: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v8                            // 000013F4: 4A221006
  s_waitcnt     vmcnt(11)                                   // 000013F8: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 000013FC: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 00001400: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00001404: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001408: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000140C: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 00001414: D8780000 00000213
  ds_read_i8    v2, v20                                     // 0000141C: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v10                           // 00001424: 4A261406
  s_waitcnt     vmcnt(11)                                   // 00001428: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 0000142C: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00001430: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00001434: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001438: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000143C: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00001444: D8780000 00000214
  ds_read_i8    v2, v21                                     // 0000144C: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v12                           // 00001454: 4A281806
  s_waitcnt     vmcnt(11)                                   // 00001458: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 0000145C: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00001460: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 00001464: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001468: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000146C: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 00001474: D8780000 00000215
  ds_read_i8    v2, v22                                     // 0000147C: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v14                           // 00001484: 4A2A1C06
  s_waitcnt     vmcnt(11)                                   // 00001488: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 0000148C: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00001490: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 00001494: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001498: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000149C: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 000014A4: D8780000 00000216
  ds_read_i8    v2, v23                                     // 000014AC: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v16                           // 000014B4: 4A2C2006
  s_waitcnt     vmcnt(11)                                   // 000014B8: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 000014BC: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 000014C0: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 000014C4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000014C8: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000014CC: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 000014D4: D8780000 00000217
  ds_read_i8    v2, v24                                     // 000014DC: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v18                           // 000014E4: 4A2E2406
  s_waitcnt     vmcnt(11)                                   // 000014E8: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 000014EC: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 000014F0: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 000014F4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000014F8: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000014FC: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00001504: D8780000 00000218
  ds_read_i8    v2, v3                                      // 0000150C: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v5                            // 00001514: 4A300A06
  s_waitcnt     vmcnt(11)                                   // 00001518: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 0000151C: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00001520: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00001524: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001528: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000152C: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00001534: D8780000 00000203
  s_add_i32     s6, s5, s6                                  // 0000153C: 81060605
  ds_read_i8    v2, v15                                     // 00001540: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v6                             // 00001548: 4A060C06
  s_waitcnt     vmcnt(11)                                   // 0000154C: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00001550: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00001554: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00001558: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000155C: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001560: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00001568: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00001570: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v8                            // 00001578: 4A1E1006
  s_waitcnt     vmcnt(11)                                   // 0000157C: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00001580: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00001584: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00001588: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000158C: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001590: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00001598: D8780000 00000207
  ds_read_i8    v2, v9                                      // 000015A0: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v10                            // 000015A8: 4A0E1406
  s_waitcnt     vmcnt(11)                                   // 000015AC: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 000015B0: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 000015B4: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 000015B8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000015BC: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000015C0: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 000015C8: D8780000 00000209
  ds_read_i8    v2, v11                                     // 000015D0: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v12                            // 000015D8: 4A121806
  s_waitcnt     vmcnt(11)                                   // 000015DC: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 000015E0: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 000015E4: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 000015E8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000015EC: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000015F0: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 000015F8: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 00001600: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v14                           // 00001608: 4A161C06
  s_waitcnt     vmcnt(11)                                   // 0000160C: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 00001610: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00001614: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00001618: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000161C: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001620: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00001628: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 00001630: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v16                           // 00001638: 4A1A2006
  s_waitcnt     vmcnt(11)                                   // 0000163C: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 00001640: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00001644: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 00001648: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000164C: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001650: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 00001658: D8780000 00000204
  ds_read_i8    v2, v17                                     // 00001660: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v18                            // 00001668: 4A082406
  s_waitcnt     vmcnt(11)                                   // 0000166C: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 00001670: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00001674: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00001678: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000167C: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001680: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 00001688: D8780000 00000211
  ds_read_i8    v2, v19                                     // 00001690: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v5                            // 00001698: 4A220A06
  s_waitcnt     vmcnt(11)                                   // 0000169C: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 000016A0: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 000016A4: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 000016A8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000016AC: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000016B0: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 000016B8: D8780000 00000213
  s_add_i32     s6, s5, s6                                  // 000016C0: 81060605
  ds_read_i8    v2, v20                                     // 000016C4: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v6                            // 000016CC: 4A260C06
  s_waitcnt     vmcnt(11)                                   // 000016D0: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 000016D4: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 000016D8: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 000016DC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000016E0: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000016E4: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 000016EC: D8780000 00000214
  ds_read_i8    v2, v21                                     // 000016F4: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v8                            // 000016FC: 4A281006
  s_waitcnt     vmcnt(11)                                   // 00001700: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 00001704: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00001708: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 0000170C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001710: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001714: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 0000171C: D8780000 00000215
  ds_read_i8    v2, v22                                     // 00001724: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v10                           // 0000172C: 4A2A1406
  s_waitcnt     vmcnt(11)                                   // 00001730: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 00001734: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00001738: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 0000173C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001740: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001744: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 0000174C: D8780000 00000216
  ds_read_i8    v2, v23                                     // 00001754: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v12                           // 0000175C: 4A2C1806
  s_waitcnt     vmcnt(11)                                   // 00001760: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 00001764: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00001768: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 0000176C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001770: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001774: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 0000177C: D8780000 00000217
  ds_read_i8    v2, v24                                     // 00001784: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v14                           // 0000178C: 4A2E1C06
  s_waitcnt     vmcnt(11)                                   // 00001790: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 00001794: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00001798: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 0000179C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000017A0: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000017A4: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 000017AC: D8780000 00000218
  ds_read_i8    v2, v3                                      // 000017B4: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v16                           // 000017BC: 4A302006
  s_waitcnt     vmcnt(11)                                   // 000017C0: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 000017C4: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 000017C8: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 000017CC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000017D0: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000017D4: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 000017DC: D8780000 00000203
  ds_read_i8    v2, v15                                     // 000017E4: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v18                            // 000017EC: 4A062406
  s_waitcnt     vmcnt(11)                                   // 000017F0: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 000017F4: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 000017F8: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 000017FC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001800: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001804: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 0000180C: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00001814: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v5                            // 0000181C: 4A1E0A06
  s_waitcnt     vmcnt(11)                                   // 00001820: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00001824: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00001828: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 0000182C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001830: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001834: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 0000183C: D8780000 00000207
  s_add_i32     s6, s5, s6                                  // 00001844: 81060605
  ds_read_i8    v2, v9                                      // 00001848: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v6                             // 00001850: 4A0E0C06
  s_waitcnt     vmcnt(11)                                   // 00001854: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00001858: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 0000185C: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00001860: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001864: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001868: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00001870: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00001878: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v8                             // 00001880: 4A121006
  s_waitcnt     vmcnt(11)                                   // 00001884: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00001888: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 0000188C: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00001890: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001894: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001898: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 000018A0: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 000018A8: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v10                           // 000018B0: 4A161406
  s_waitcnt     vmcnt(11)                                   // 000018B4: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 000018B8: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 000018BC: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 000018C0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000018C4: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000018C8: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 000018D0: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 000018D8: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v12                           // 000018E0: 4A1A1806
  s_waitcnt     vmcnt(11)                                   // 000018E4: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 000018E8: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 000018EC: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 000018F0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000018F4: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000018F8: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 00001900: D8780000 00000204
  ds_read_i8    v2, v17                                     // 00001908: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v14                            // 00001910: 4A081C06
  s_waitcnt     vmcnt(11)                                   // 00001914: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 00001918: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 0000191C: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00001920: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001924: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001928: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 00001930: D8780000 00000211
  ds_read_i8    v2, v19                                     // 00001938: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v16                           // 00001940: 4A222006
  s_waitcnt     vmcnt(11)                                   // 00001944: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 00001948: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 0000194C: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00001950: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001954: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001958: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 00001960: D8780000 00000213
  ds_read_i8    v2, v20                                     // 00001968: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v18                           // 00001970: 4A262406
  s_waitcnt     vmcnt(11)                                   // 00001974: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 00001978: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 0000197C: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00001980: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001984: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001988: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00001990: D8780000 00000214
  ds_read_i8    v2, v21                                     // 00001998: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v5                            // 000019A0: 4A280A06
  s_waitcnt     vmcnt(11)                                   // 000019A4: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 000019A8: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 000019AC: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 000019B0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000019B4: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000019B8: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 000019C0: D8780000 00000215
  s_add_i32     s6, s5, s6                                  // 000019C8: 81060605
  ds_read_i8    v2, v22                                     // 000019CC: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v6                            // 000019D4: 4A2A0C06
  s_waitcnt     vmcnt(11)                                   // 000019D8: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 000019DC: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 000019E0: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 000019E4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000019E8: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000019EC: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 000019F4: D8780000 00000216
  ds_read_i8    v2, v23                                     // 000019FC: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v8                            // 00001A04: 4A2C1006
  s_waitcnt     vmcnt(11)                                   // 00001A08: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 00001A0C: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00001A10: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 00001A14: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001A18: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001A1C: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 00001A24: D8780000 00000217
  ds_read_i8    v2, v24                                     // 00001A2C: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v10                           // 00001A34: 4A2E1406
  s_waitcnt     vmcnt(11)                                   // 00001A38: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 00001A3C: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00001A40: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00001A44: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001A48: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001A4C: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00001A54: D8780000 00000218
  ds_read_i8    v2, v3                                      // 00001A5C: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v12                           // 00001A64: 4A301806
  s_waitcnt     vmcnt(11)                                   // 00001A68: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00001A6C: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00001A70: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00001A74: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001A78: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001A7C: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00001A84: D8780000 00000203
  ds_read_i8    v2, v15                                     // 00001A8C: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v14                            // 00001A94: 4A061C06
  s_waitcnt     vmcnt(11)                                   // 00001A98: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00001A9C: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00001AA0: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00001AA4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001AA8: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001AAC: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00001AB4: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00001ABC: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v16                           // 00001AC4: 4A1E2006
  s_waitcnt     vmcnt(11)                                   // 00001AC8: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00001ACC: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00001AD0: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00001AD4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001AD8: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001ADC: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00001AE4: D8780000 00000207
  ds_read_i8    v2, v9                                      // 00001AEC: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v18                            // 00001AF4: 4A0E2406
  s_waitcnt     vmcnt(11)                                   // 00001AF8: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00001AFC: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 00001B00: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00001B04: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001B08: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001B0C: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00001B14: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00001B1C: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v5                             // 00001B24: 4A120A06
  s_waitcnt     vmcnt(11)                                   // 00001B28: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00001B2C: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 00001B30: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00001B34: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001B38: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001B3C: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00001B44: D8780000 0000020B
  s_add_i32     s6, s5, s6                                  // 00001B4C: 81060605
  ds_read_i8    v2, v13                                     // 00001B50: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v6                            // 00001B58: 4A160C06
  s_waitcnt     vmcnt(11)                                   // 00001B5C: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 00001B60: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00001B64: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00001B68: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001B6C: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001B70: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00001B78: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 00001B80: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v8                            // 00001B88: 4A1A1006
  s_waitcnt     vmcnt(11)                                   // 00001B8C: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 00001B90: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00001B94: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 00001B98: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001B9C: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001BA0: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 00001BA8: D8780000 00000204
  ds_read_i8    v2, v17                                     // 00001BB0: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v10                            // 00001BB8: 4A081406
  s_waitcnt     vmcnt(11)                                   // 00001BBC: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 00001BC0: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00001BC4: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00001BC8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001BCC: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001BD0: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 00001BD8: D8780000 00000211
  ds_read_i8    v2, v19                                     // 00001BE0: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v12                           // 00001BE8: 4A221806
  s_waitcnt     vmcnt(11)                                   // 00001BEC: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 00001BF0: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 00001BF4: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00001BF8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001BFC: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001C00: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 00001C08: D8780000 00000213
  ds_read_i8    v2, v20                                     // 00001C10: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v14                           // 00001C18: 4A261C06
  s_waitcnt     vmcnt(11)                                   // 00001C1C: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 00001C20: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00001C24: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00001C28: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001C2C: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001C30: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00001C38: D8780000 00000214
  ds_read_i8    v2, v21                                     // 00001C40: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v16                           // 00001C48: 4A282006
  s_waitcnt     vmcnt(11)                                   // 00001C4C: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 00001C50: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00001C54: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 00001C58: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001C5C: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001C60: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 00001C68: D8780000 00000215
  ds_read_i8    v2, v22                                     // 00001C70: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v18                           // 00001C78: 4A2A2406
  s_waitcnt     vmcnt(11)                                   // 00001C7C: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 00001C80: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00001C84: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 00001C88: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001C8C: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001C90: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 00001C98: D8780000 00000216
  ds_read_i8    v2, v23                                     // 00001CA0: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v5                            // 00001CA8: 4A2C0A06
  s_waitcnt     vmcnt(11)                                   // 00001CAC: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 00001CB0: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00001CB4: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 00001CB8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001CBC: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001CC0: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 00001CC8: D8780000 00000217
  s_add_i32     s6, s5, s6                                  // 00001CD0: 81060605
  ds_read_i8    v2, v24                                     // 00001CD4: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v6                            // 00001CDC: 4A2E0C06
  s_waitcnt     vmcnt(11)                                   // 00001CE0: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 00001CE4: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00001CE8: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00001CEC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001CF0: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001CF4: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00001CFC: D8780000 00000218
  ds_read_i8    v2, v3                                      // 00001D04: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v8                            // 00001D0C: 4A301006
  s_waitcnt     vmcnt(11)                                   // 00001D10: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00001D14: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00001D18: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00001D1C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001D20: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001D24: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00001D2C: D8780000 00000203
  ds_read_i8    v2, v15                                     // 00001D34: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v10                            // 00001D3C: 4A061406
  s_waitcnt     vmcnt(11)                                   // 00001D40: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00001D44: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00001D48: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00001D4C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001D50: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001D54: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00001D5C: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00001D64: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v12                           // 00001D6C: 4A1E1806
  s_waitcnt     vmcnt(11)                                   // 00001D70: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00001D74: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00001D78: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00001D7C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001D80: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001D84: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00001D8C: D8780000 00000207
  ds_read_i8    v2, v9                                      // 00001D94: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v14                            // 00001D9C: 4A0E1C06
  s_waitcnt     vmcnt(11)                                   // 00001DA0: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00001DA4: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 00001DA8: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00001DAC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001DB0: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001DB4: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00001DBC: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00001DC4: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v16                            // 00001DCC: 4A122006
  s_waitcnt     vmcnt(11)                                   // 00001DD0: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00001DD4: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 00001DD8: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00001DDC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001DE0: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001DE4: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00001DEC: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 00001DF4: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v18                           // 00001DFC: 4A162406
  s_waitcnt     vmcnt(11)                                   // 00001E00: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 00001E04: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00001E08: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00001E0C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001E10: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001E14: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00001E1C: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 00001E24: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v5                            // 00001E2C: 4A1A0A06
  s_waitcnt     vmcnt(11)                                   // 00001E30: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 00001E34: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00001E38: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 00001E3C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001E40: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001E44: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 00001E4C: D8780000 00000204
  s_add_i32     s6, s5, s6                                  // 00001E54: 81060605
  ds_read_i8    v2, v17                                     // 00001E58: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v6                             // 00001E60: 4A080C06
  s_waitcnt     vmcnt(11)                                   // 00001E64: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 00001E68: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00001E6C: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00001E70: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001E74: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001E78: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 00001E80: D8780000 00000211
  ds_read_i8    v2, v19                                     // 00001E88: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v8                            // 00001E90: 4A221006
  s_waitcnt     vmcnt(11)                                   // 00001E94: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 00001E98: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 00001E9C: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00001EA0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001EA4: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001EA8: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 00001EB0: D8780000 00000213
  ds_read_i8    v2, v20                                     // 00001EB8: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v10                           // 00001EC0: 4A261406
  s_waitcnt     vmcnt(11)                                   // 00001EC4: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 00001EC8: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00001ECC: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00001ED0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001ED4: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001ED8: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00001EE0: D8780000 00000214
  ds_read_i8    v2, v21                                     // 00001EE8: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v12                           // 00001EF0: 4A281806
  s_waitcnt     vmcnt(11)                                   // 00001EF4: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 00001EF8: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00001EFC: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 00001F00: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001F04: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001F08: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 00001F10: D8780000 00000215
  ds_read_i8    v2, v22                                     // 00001F18: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v14                           // 00001F20: 4A2A1C06
  s_waitcnt     vmcnt(11)                                   // 00001F24: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 00001F28: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00001F2C: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 00001F30: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001F34: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001F38: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 00001F40: D8780000 00000216
  ds_read_i8    v2, v23                                     // 00001F48: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v16                           // 00001F50: 4A2C2006
  s_waitcnt     vmcnt(11)                                   // 00001F54: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 00001F58: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00001F5C: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 00001F60: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001F64: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001F68: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 00001F70: D8780000 00000217
  ds_read_i8    v2, v24                                     // 00001F78: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v18                           // 00001F80: 4A2E2406
  s_waitcnt     vmcnt(11)                                   // 00001F84: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 00001F88: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00001F8C: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00001F90: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001F94: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001F98: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00001FA0: D8780000 00000218
  ds_read_i8    v2, v3                                      // 00001FA8: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v5                            // 00001FB0: 4A300A06
  s_waitcnt     vmcnt(11)                                   // 00001FB4: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00001FB8: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00001FBC: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00001FC0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001FC4: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001FC8: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00001FD0: D8780000 00000203
  s_add_i32     s6, s5, s6                                  // 00001FD8: 81060605
  ds_read_i8    v2, v15                                     // 00001FDC: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v6                             // 00001FE4: 4A060C06
  s_waitcnt     vmcnt(11)                                   // 00001FE8: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00001FEC: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00001FF0: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00001FF4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00001FF8: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00001FFC: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00002004: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 0000200C: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v8                            // 00002014: 4A1E1006
  s_waitcnt     vmcnt(11)                                   // 00002018: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 0000201C: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00002020: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00002024: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002028: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000202C: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00002034: D8780000 00000207
  ds_read_i8    v2, v9                                      // 0000203C: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v10                            // 00002044: 4A0E1406
  s_waitcnt     vmcnt(11)                                   // 00002048: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 0000204C: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 00002050: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00002054: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002058: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000205C: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00002064: D8780000 00000209
  ds_read_i8    v2, v11                                     // 0000206C: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v12                            // 00002074: 4A121806
  s_waitcnt     vmcnt(11)                                   // 00002078: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 0000207C: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 00002080: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00002084: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002088: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000208C: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00002094: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 0000209C: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v14                           // 000020A4: 4A161C06
  s_waitcnt     vmcnt(11)                                   // 000020A8: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 000020AC: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 000020B0: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 000020B4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000020B8: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000020BC: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 000020C4: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 000020CC: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v16                           // 000020D4: 4A1A2006
  s_waitcnt     vmcnt(11)                                   // 000020D8: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 000020DC: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 000020E0: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 000020E4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000020E8: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000020EC: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 000020F4: D8780000 00000204
  ds_read_i8    v2, v17                                     // 000020FC: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v18                            // 00002104: 4A082406
  s_waitcnt     vmcnt(11)                                   // 00002108: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 0000210C: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00002110: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00002114: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002118: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000211C: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 00002124: D8780000 00000211
  ds_read_i8    v2, v19                                     // 0000212C: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v5                            // 00002134: 4A220A06
  s_waitcnt     vmcnt(11)                                   // 00002138: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 0000213C: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 00002140: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00002144: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002148: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000214C: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 00002154: D8780000 00000213
  s_add_i32     s6, s5, s6                                  // 0000215C: 81060605
  ds_read_i8    v2, v20                                     // 00002160: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v6                            // 00002168: 4A260C06
  s_waitcnt     vmcnt(11)                                   // 0000216C: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 00002170: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00002174: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00002178: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000217C: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002180: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00002188: D8780000 00000214
  ds_read_i8    v2, v21                                     // 00002190: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v8                            // 00002198: 4A281006
  s_waitcnt     vmcnt(11)                                   // 0000219C: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 000021A0: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 000021A4: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 000021A8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000021AC: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000021B0: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 000021B8: D8780000 00000215
  ds_read_i8    v2, v22                                     // 000021C0: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v10                           // 000021C8: 4A2A1406
  s_waitcnt     vmcnt(11)                                   // 000021CC: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 000021D0: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 000021D4: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 000021D8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000021DC: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000021E0: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 000021E8: D8780000 00000216
  ds_read_i8    v2, v23                                     // 000021F0: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v12                           // 000021F8: 4A2C1806
  s_waitcnt     vmcnt(11)                                   // 000021FC: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 00002200: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00002204: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 00002208: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000220C: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002210: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 00002218: D8780000 00000217
  ds_read_i8    v2, v24                                     // 00002220: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v14                           // 00002228: 4A2E1C06
  s_waitcnt     vmcnt(11)                                   // 0000222C: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 00002230: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00002234: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00002238: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000223C: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002240: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00002248: D8780000 00000218
  ds_read_i8    v2, v3                                      // 00002250: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v16                           // 00002258: 4A302006
  s_waitcnt     vmcnt(11)                                   // 0000225C: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00002260: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00002264: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00002268: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000226C: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002270: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00002278: D8780000 00000203
  ds_read_i8    v2, v15                                     // 00002280: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v18                            // 00002288: 4A062406
  s_waitcnt     vmcnt(11)                                   // 0000228C: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00002290: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00002294: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00002298: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000229C: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000022A0: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 000022A8: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 000022B0: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v5                            // 000022B8: 4A1E0A06
  s_waitcnt     vmcnt(11)                                   // 000022BC: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 000022C0: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 000022C4: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 000022C8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000022CC: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000022D0: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 000022D8: D8780000 00000207
  s_add_i32     s6, s5, s6                                  // 000022E0: 81060605
  ds_read_i8    v2, v9                                      // 000022E4: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v6                             // 000022EC: 4A0E0C06
  s_waitcnt     vmcnt(11)                                   // 000022F0: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 000022F4: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 000022F8: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 000022FC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002300: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002304: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 0000230C: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00002314: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v8                             // 0000231C: 4A121006
  s_waitcnt     vmcnt(11)                                   // 00002320: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00002324: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 00002328: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 0000232C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002330: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002334: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 0000233C: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 00002344: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v10                           // 0000234C: 4A161406
  s_waitcnt     vmcnt(11)                                   // 00002350: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 00002354: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00002358: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 0000235C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002360: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002364: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 0000236C: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 00002374: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v12                           // 0000237C: 4A1A1806
  s_waitcnt     vmcnt(11)                                   // 00002380: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 00002384: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00002388: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 0000238C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002390: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002394: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 0000239C: D8780000 00000204
  ds_read_i8    v2, v17                                     // 000023A4: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v14                            // 000023AC: 4A081C06
  s_waitcnt     vmcnt(11)                                   // 000023B0: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 000023B4: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 000023B8: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 000023BC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000023C0: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000023C4: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 000023CC: D8780000 00000211
  ds_read_i8    v2, v19                                     // 000023D4: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v16                           // 000023DC: 4A222006
  s_waitcnt     vmcnt(11)                                   // 000023E0: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 000023E4: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 000023E8: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 000023EC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000023F0: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000023F4: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 000023FC: D8780000 00000213
  ds_read_i8    v2, v20                                     // 00002404: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v18                           // 0000240C: 4A262406
  s_waitcnt     vmcnt(11)                                   // 00002410: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 00002414: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00002418: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 0000241C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002420: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002424: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 0000242C: D8780000 00000214
  ds_read_i8    v2, v21                                     // 00002434: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v5                            // 0000243C: 4A280A06
  s_waitcnt     vmcnt(11)                                   // 00002440: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 00002444: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00002448: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 0000244C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002450: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002454: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 0000245C: D8780000 00000215
  s_add_i32     s6, s5, s6                                  // 00002464: 81060605
  ds_read_i8    v2, v22                                     // 00002468: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v6                            // 00002470: 4A2A0C06
  s_waitcnt     vmcnt(11)                                   // 00002474: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 00002478: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 0000247C: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 00002480: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002484: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002488: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 00002490: D8780000 00000216
  ds_read_i8    v2, v23                                     // 00002498: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v8                            // 000024A0: 4A2C1006
  s_waitcnt     vmcnt(11)                                   // 000024A4: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 000024A8: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 000024AC: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 000024B0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000024B4: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000024B8: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 000024C0: D8780000 00000217
  ds_read_i8    v2, v24                                     // 000024C8: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v10                           // 000024D0: 4A2E1406
  s_waitcnt     vmcnt(11)                                   // 000024D4: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 000024D8: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 000024DC: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 000024E0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000024E4: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000024E8: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 000024F0: D8780000 00000218
  ds_read_i8    v2, v3                                      // 000024F8: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v12                           // 00002500: 4A301806
  s_waitcnt     vmcnt(11)                                   // 00002504: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00002508: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 0000250C: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00002510: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002514: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002518: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00002520: D8780000 00000203
  ds_read_i8    v2, v15                                     // 00002528: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v14                            // 00002530: 4A061C06
  s_waitcnt     vmcnt(11)                                   // 00002534: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00002538: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 0000253C: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00002540: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002544: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002548: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00002550: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00002558: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v16                           // 00002560: 4A1E2006
  s_waitcnt     vmcnt(11)                                   // 00002564: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00002568: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 0000256C: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00002570: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002574: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002578: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00002580: D8780000 00000207
  ds_read_i8    v2, v9                                      // 00002588: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v18                            // 00002590: 4A0E2406
  s_waitcnt     vmcnt(11)                                   // 00002594: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00002598: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 0000259C: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 000025A0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000025A4: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000025A8: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 000025B0: D8780000 00000209
  ds_read_i8    v2, v11                                     // 000025B8: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v5                             // 000025C0: 4A120A06
  s_waitcnt     vmcnt(11)                                   // 000025C4: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 000025C8: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 000025CC: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 000025D0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000025D4: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000025D8: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 000025E0: D8780000 0000020B
  s_add_i32     s6, s5, s6                                  // 000025E8: 81060605
  ds_read_i8    v2, v13                                     // 000025EC: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v6                            // 000025F4: 4A160C06
  s_waitcnt     vmcnt(11)                                   // 000025F8: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 000025FC: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00002600: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00002604: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002608: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000260C: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00002614: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 0000261C: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v8                            // 00002624: 4A1A1006
  s_waitcnt     vmcnt(11)                                   // 00002628: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 0000262C: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00002630: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 00002634: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002638: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000263C: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 00002644: D8780000 00000204
  ds_read_i8    v2, v17                                     // 0000264C: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v10                            // 00002654: 4A081406
  s_waitcnt     vmcnt(11)                                   // 00002658: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 0000265C: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00002660: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00002664: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002668: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000266C: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 00002674: D8780000 00000211
  ds_read_i8    v2, v19                                     // 0000267C: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v12                           // 00002684: 4A221806
  s_waitcnt     vmcnt(11)                                   // 00002688: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 0000268C: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 00002690: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00002694: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002698: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000269C: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 000026A4: D8780000 00000213
  ds_read_i8    v2, v20                                     // 000026AC: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v14                           // 000026B4: 4A261C06
  s_waitcnt     vmcnt(11)                                   // 000026B8: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 000026BC: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 000026C0: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 000026C4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000026C8: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000026CC: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 000026D4: D8780000 00000214
  ds_read_i8    v2, v21                                     // 000026DC: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v16                           // 000026E4: 4A282006
  s_waitcnt     vmcnt(11)                                   // 000026E8: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 000026EC: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 000026F0: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 000026F4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000026F8: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000026FC: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 00002704: D8780000 00000215
  ds_read_i8    v2, v22                                     // 0000270C: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v18                           // 00002714: 4A2A2406
  s_waitcnt     vmcnt(11)                                   // 00002718: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 0000271C: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00002720: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 00002724: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002728: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000272C: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 00002734: D8780000 00000216
  ds_read_i8    v2, v23                                     // 0000273C: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v5                            // 00002744: 4A2C0A06
  s_waitcnt     vmcnt(11)                                   // 00002748: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 0000274C: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00002750: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 00002754: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002758: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000275C: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 00002764: D8780000 00000217
  s_add_i32     s6, s5, s6                                  // 0000276C: 81060605
  ds_read_i8    v2, v24                                     // 00002770: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v6                            // 00002778: 4A2E0C06
  s_waitcnt     vmcnt(11)                                   // 0000277C: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 00002780: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00002784: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00002788: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000278C: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002790: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00002798: D8780000 00000218
  ds_read_i8    v2, v3                                      // 000027A0: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v8                            // 000027A8: 4A301006
  s_waitcnt     vmcnt(11)                                   // 000027AC: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 000027B0: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 000027B4: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 000027B8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000027BC: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000027C0: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 000027C8: D8780000 00000203
  ds_read_i8    v2, v15                                     // 000027D0: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v10                            // 000027D8: 4A061406
  s_waitcnt     vmcnt(11)                                   // 000027DC: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 000027E0: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 000027E4: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 000027E8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000027EC: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000027F0: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 000027F8: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00002800: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v12                           // 00002808: 4A1E1806
  s_waitcnt     vmcnt(11)                                   // 0000280C: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00002810: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00002814: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00002818: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000281C: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002820: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00002828: D8780000 00000207
  ds_read_i8    v2, v9                                      // 00002830: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v14                            // 00002838: 4A0E1C06
  s_waitcnt     vmcnt(11)                                   // 0000283C: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00002840: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 00002844: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00002848: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000284C: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002850: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00002858: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00002860: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v16                            // 00002868: 4A122006
  s_waitcnt     vmcnt(11)                                   // 0000286C: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00002870: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 00002874: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00002878: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000287C: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002880: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00002888: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 00002890: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v18                           // 00002898: 4A162406
  s_waitcnt     vmcnt(11)                                   // 0000289C: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 000028A0: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 000028A4: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 000028A8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000028AC: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000028B0: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 000028B8: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 000028C0: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v5                            // 000028C8: 4A1A0A06
  s_waitcnt     vmcnt(11)                                   // 000028CC: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 000028D0: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 000028D4: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 000028D8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000028DC: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000028E0: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 000028E8: D8780000 00000204
  s_add_i32     s6, s5, s6                                  // 000028F0: 81060605
  ds_read_i8    v2, v17                                     // 000028F4: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v6                             // 000028FC: 4A080C06
  s_waitcnt     vmcnt(11)                                   // 00002900: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 00002904: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00002908: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 0000290C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002910: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002914: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 0000291C: D8780000 00000211
  ds_read_i8    v2, v19                                     // 00002924: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v8                            // 0000292C: 4A221006
  s_waitcnt     vmcnt(11)                                   // 00002930: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 00002934: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 00002938: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 0000293C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002940: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002944: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 0000294C: D8780000 00000213
  ds_read_i8    v2, v20                                     // 00002954: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v10                           // 0000295C: 4A261406
  s_waitcnt     vmcnt(11)                                   // 00002960: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 00002964: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00002968: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 0000296C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002970: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002974: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 0000297C: D8780000 00000214
  ds_read_i8    v2, v21                                     // 00002984: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v12                           // 0000298C: 4A281806
  s_waitcnt     vmcnt(11)                                   // 00002990: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 00002994: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00002998: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 0000299C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000029A0: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000029A4: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 000029AC: D8780000 00000215
  ds_read_i8    v2, v22                                     // 000029B4: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v14                           // 000029BC: 4A2A1C06
  s_waitcnt     vmcnt(11)                                   // 000029C0: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 000029C4: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 000029C8: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 000029CC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000029D0: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000029D4: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 000029DC: D8780000 00000216
  ds_read_i8    v2, v23                                     // 000029E4: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v16                           // 000029EC: 4A2C2006
  s_waitcnt     vmcnt(11)                                   // 000029F0: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 000029F4: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 000029F8: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 000029FC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002A00: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002A04: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 00002A0C: D8780000 00000217
  ds_read_i8    v2, v24                                     // 00002A14: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v18                           // 00002A1C: 4A2E2406
  s_waitcnt     vmcnt(11)                                   // 00002A20: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 00002A24: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00002A28: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00002A2C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002A30: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002A34: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00002A3C: D8780000 00000218
  ds_read_i8    v2, v3                                      // 00002A44: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v5                            // 00002A4C: 4A300A06
  s_waitcnt     vmcnt(11)                                   // 00002A50: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00002A54: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00002A58: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00002A5C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002A60: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002A64: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00002A6C: D8780000 00000203
  s_add_i32     s6, s5, s6                                  // 00002A74: 81060605
  ds_read_i8    v2, v15                                     // 00002A78: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v6                             // 00002A80: 4A060C06
  s_waitcnt     vmcnt(11)                                   // 00002A84: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00002A88: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00002A8C: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00002A90: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002A94: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002A98: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00002AA0: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00002AA8: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v8                            // 00002AB0: 4A1E1006
  s_waitcnt     vmcnt(11)                                   // 00002AB4: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00002AB8: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00002ABC: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00002AC0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002AC4: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002AC8: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00002AD0: D8780000 00000207
  ds_read_i8    v2, v9                                      // 00002AD8: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v10                            // 00002AE0: 4A0E1406
  s_waitcnt     vmcnt(11)                                   // 00002AE4: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00002AE8: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 00002AEC: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00002AF0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002AF4: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002AF8: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00002B00: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00002B08: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v12                            // 00002B10: 4A121806
  s_waitcnt     vmcnt(11)                                   // 00002B14: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00002B18: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 00002B1C: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00002B20: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002B24: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002B28: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00002B30: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 00002B38: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v14                           // 00002B40: 4A161C06
  s_waitcnt     vmcnt(11)                                   // 00002B44: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 00002B48: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00002B4C: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00002B50: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002B54: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002B58: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00002B60: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 00002B68: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v16                           // 00002B70: 4A1A2006
  s_waitcnt     vmcnt(11)                                   // 00002B74: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 00002B78: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00002B7C: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 00002B80: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002B84: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002B88: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 00002B90: D8780000 00000204
  ds_read_i8    v2, v17                                     // 00002B98: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v18                            // 00002BA0: 4A082406
  s_waitcnt     vmcnt(11)                                   // 00002BA4: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 00002BA8: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00002BAC: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00002BB0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002BB4: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002BB8: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 00002BC0: D8780000 00000211
  ds_read_i8    v2, v19                                     // 00002BC8: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v5                            // 00002BD0: 4A220A06
  s_waitcnt     vmcnt(11)                                   // 00002BD4: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 00002BD8: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 00002BDC: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00002BE0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002BE4: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002BE8: EBA01000 80031111
  s_waitcnt     vmcnt(0)                                    // 00002BF0: BF8C1F70
  ds_write_b8   v19, v2                                     // 00002BF4: D8780000 00000213
  s_add_i32     s6, s5, s6                                  // 00002BFC: 81060605
  ds_read_i8    v2, v20                                     // 00002C00: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v6                            // 00002C08: 4A260C06
  v_add_i32     v21, vcc, v1, v21                           // 00002C0C: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00002C10: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00002C14: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002C18: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002C1C: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00002C24: D8780000 00000214
  ds_read_i8    v2, v21                                     // 00002C2C: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v8                            // 00002C34: 4A281006
  v_add_i32     v22, vcc, v1, v22                           // 00002C38: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00002C3C: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 00002C40: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002C44: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002C48: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 00002C50: D8780000 00000215
  ds_read_i8    v2, v22                                     // 00002C58: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v10                           // 00002C60: 4A2A1406
  v_add_i32     v23, vcc, v1, v23                           // 00002C64: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00002C68: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 00002C6C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002C70: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002C74: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 00002C7C: D8780000 00000216
  ds_read_i8    v2, v23                                     // 00002C84: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v12                           // 00002C8C: 4A2C1806
  v_add_i32     v24, vcc, v1, v24                           // 00002C90: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00002C94: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 00002C98: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002C9C: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002CA0: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 00002CA8: D8780000 00000217
  ds_read_i8    v2, v24                                     // 00002CB0: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v14                           // 00002CB8: 4A2E1C06
  v_add_i32     v3, vcc, v1, v3                             // 00002CBC: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00002CC0: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00002CC4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002CC8: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002CCC: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00002CD4: D8780000 00000218
  ds_read_i8    v2, v3                                      // 00002CDC: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v16                           // 00002CE4: 4A302006
  v_add_i32     v15, vcc, v1, v15                           // 00002CE8: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00002CEC: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00002CF0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002CF4: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002CF8: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00002D00: D8780000 00000203
  ds_read_i8    v2, v15                                     // 00002D08: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v18                            // 00002D10: 4A062406
  v_add_i32     v7, vcc, v1, v7                             // 00002D14: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00002D18: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00002D1C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002D20: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002D24: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00002D2C: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00002D34: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v5                            // 00002D3C: 4A1E0A06
  v_add_i32     v9, vcc, v1, v9                             // 00002D40: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00002D44: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00002D48: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002D4C: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002D50: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00002D58: D8780000 00000207
  s_add_i32     s6, s5, s6                                  // 00002D60: 81060605
  ds_read_i8    v2, v9                                      // 00002D64: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v6                             // 00002D6C: 4A0E0C06
  v_add_i32     v11, vcc, v1, v11                           // 00002D70: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 00002D74: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00002D78: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002D7C: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002D80: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00002D88: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00002D90: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v8                             // 00002D98: 4A121006
  v_add_i32     v13, vcc, v1, v13                           // 00002D9C: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 00002DA0: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00002DA4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002DA8: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002DAC: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00002DB4: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 00002DBC: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v10                           // 00002DC4: 4A161406
  v_add_i32     v4, vcc, v1, v4                             // 00002DC8: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00002DCC: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00002DD0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002DD4: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002DD8: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00002DE0: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 00002DE8: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v12                           // 00002DF0: 4A1A1806
  v_add_i32     v17, vcc, v1, v17                           // 00002DF4: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00002DF8: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 00002DFC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002E00: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002E04: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 00002E0C: D8780000 00000204
  ds_read_i8    v2, v17                                     // 00002E14: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v14                            // 00002E1C: 4A081C06
  s_waitcnt     vmcnt(11)                                   // 00002E20: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 00002E24: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00002E28: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00002E2C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002E30: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002E34: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 00002E3C: D8780000 00000211
  ds_read_i8    v2, v19                                     // 00002E44: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v16                           // 00002E4C: 4A222006
  s_waitcnt     vmcnt(11)                                   // 00002E50: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 00002E54: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 00002E58: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00002E5C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002E60: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002E64: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 00002E6C: D8780000 00000213
  ds_read_i8    v2, v20                                     // 00002E74: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v18                           // 00002E7C: 4A262406
  s_waitcnt     vmcnt(11)                                   // 00002E80: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 00002E84: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00002E88: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00002E8C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002E90: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002E94: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00002E9C: D8780000 00000214
  ds_read_i8    v2, v21                                     // 00002EA4: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v5                            // 00002EAC: 4A280A06
  s_waitcnt     vmcnt(11)                                   // 00002EB0: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 00002EB4: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00002EB8: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 00002EBC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002EC0: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002EC4: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 00002ECC: D8780000 00000215
  s_add_i32     s6, s5, s6                                  // 00002ED4: 81060605
  ds_read_i8    v2, v22                                     // 00002ED8: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v6                            // 00002EE0: 4A2A0C06
  s_waitcnt     vmcnt(11)                                   // 00002EE4: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 00002EE8: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00002EEC: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 00002EF0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002EF4: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002EF8: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 00002F00: D8780000 00000216
  ds_read_i8    v2, v23                                     // 00002F08: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v8                            // 00002F10: 4A2C1006
  s_waitcnt     vmcnt(11)                                   // 00002F14: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 00002F18: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00002F1C: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 00002F20: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002F24: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002F28: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 00002F30: D8780000 00000217
  ds_read_i8    v2, v24                                     // 00002F38: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v10                           // 00002F40: 4A2E1406
  s_waitcnt     vmcnt(11)                                   // 00002F44: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 00002F48: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00002F4C: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00002F50: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002F54: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002F58: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00002F60: D8780000 00000218
  ds_read_i8    v2, v3                                      // 00002F68: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v12                           // 00002F70: 4A301806
  s_waitcnt     vmcnt(11)                                   // 00002F74: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00002F78: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00002F7C: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00002F80: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002F84: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002F88: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00002F90: D8780000 00000203
  ds_read_i8    v2, v15                                     // 00002F98: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v14                            // 00002FA0: 4A061C06
  s_waitcnt     vmcnt(11)                                   // 00002FA4: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00002FA8: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00002FAC: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00002FB0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002FB4: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002FB8: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00002FC0: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00002FC8: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v16                           // 00002FD0: 4A1E2006
  s_waitcnt     vmcnt(11)                                   // 00002FD4: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00002FD8: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00002FDC: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00002FE0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00002FE4: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00002FE8: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00002FF0: D8780000 00000207
  ds_read_i8    v2, v9                                      // 00002FF8: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v18                            // 00003000: 4A0E2406
  s_waitcnt     vmcnt(11)                                   // 00003004: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00003008: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 0000300C: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00003010: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003014: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003018: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00003020: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00003028: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v5                             // 00003030: 4A120A06
  s_waitcnt     vmcnt(11)                                   // 00003034: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00003038: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 0000303C: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00003040: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003044: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003048: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00003050: D8780000 0000020B
  s_add_i32     s6, s5, s6                                  // 00003058: 81060605
  ds_read_i8    v2, v13                                     // 0000305C: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v6                            // 00003064: 4A160C06
  s_waitcnt     vmcnt(11)                                   // 00003068: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 0000306C: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00003070: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00003074: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003078: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000307C: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00003084: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 0000308C: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v8                            // 00003094: 4A1A1006
  s_waitcnt     vmcnt(11)                                   // 00003098: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 0000309C: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 000030A0: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 000030A4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000030A8: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000030AC: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 000030B4: D8780000 00000204
  ds_read_i8    v2, v17                                     // 000030BC: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v10                            // 000030C4: 4A081406
  s_waitcnt     vmcnt(11)                                   // 000030C8: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 000030CC: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 000030D0: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 000030D4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000030D8: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000030DC: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 000030E4: D8780000 00000211
  ds_read_i8    v2, v19                                     // 000030EC: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v12                           // 000030F4: 4A221806
  s_waitcnt     vmcnt(11)                                   // 000030F8: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 000030FC: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 00003100: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00003104: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003108: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000310C: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 00003114: D8780000 00000213
  ds_read_i8    v2, v20                                     // 0000311C: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v14                           // 00003124: 4A261C06
  s_waitcnt     vmcnt(11)                                   // 00003128: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 0000312C: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00003130: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00003134: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003138: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000313C: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00003144: D8780000 00000214
  ds_read_i8    v2, v21                                     // 0000314C: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v16                           // 00003154: 4A282006
  s_waitcnt     vmcnt(11)                                   // 00003158: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 0000315C: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00003160: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 00003164: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003168: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000316C: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 00003174: D8780000 00000215
  ds_read_i8    v2, v22                                     // 0000317C: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v18                           // 00003184: 4A2A2406
  s_waitcnt     vmcnt(11)                                   // 00003188: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 0000318C: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00003190: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 00003194: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003198: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000319C: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 000031A4: D8780000 00000216
  ds_read_i8    v2, v23                                     // 000031AC: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v5                            // 000031B4: 4A2C0A06
  s_waitcnt     vmcnt(11)                                   // 000031B8: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 000031BC: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 000031C0: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 000031C4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000031C8: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000031CC: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 000031D4: D8780000 00000217
  s_add_i32     s6, s5, s6                                  // 000031DC: 81060605
  ds_read_i8    v2, v24                                     // 000031E0: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v6                            // 000031E8: 4A2E0C06
  s_waitcnt     vmcnt(11)                                   // 000031EC: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 000031F0: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 000031F4: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 000031F8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000031FC: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003200: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00003208: D8780000 00000218
  ds_read_i8    v2, v3                                      // 00003210: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v8                            // 00003218: 4A301006
  s_waitcnt     vmcnt(11)                                   // 0000321C: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00003220: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00003224: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00003228: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000322C: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003230: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00003238: D8780000 00000203
  ds_read_i8    v2, v15                                     // 00003240: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v10                            // 00003248: 4A061406
  s_waitcnt     vmcnt(11)                                   // 0000324C: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00003250: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00003254: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00003258: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000325C: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003260: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00003268: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00003270: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v12                           // 00003278: 4A1E1806
  s_waitcnt     vmcnt(11)                                   // 0000327C: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00003280: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00003284: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00003288: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000328C: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003290: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00003298: D8780000 00000207
  ds_read_i8    v2, v9                                      // 000032A0: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v14                            // 000032A8: 4A0E1C06
  s_waitcnt     vmcnt(11)                                   // 000032AC: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 000032B0: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 000032B4: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 000032B8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000032BC: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000032C0: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 000032C8: D8780000 00000209
  ds_read_i8    v2, v11                                     // 000032D0: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v16                            // 000032D8: 4A122006
  s_waitcnt     vmcnt(11)                                   // 000032DC: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 000032E0: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 000032E4: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 000032E8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000032EC: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000032F0: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 000032F8: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 00003300: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v18                           // 00003308: 4A162406
  s_waitcnt     vmcnt(11)                                   // 0000330C: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 00003310: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00003314: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00003318: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000331C: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003320: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00003328: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 00003330: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v5                            // 00003338: 4A1A0A06
  s_waitcnt     vmcnt(11)                                   // 0000333C: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 00003340: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00003344: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 00003348: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000334C: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003350: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 00003358: D8780000 00000204
  s_add_i32     s6, s5, s6                                  // 00003360: 81060605
  ds_read_i8    v2, v17                                     // 00003364: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v6                             // 0000336C: 4A080C06
  s_waitcnt     vmcnt(11)                                   // 00003370: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 00003374: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00003378: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 0000337C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003380: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003384: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 0000338C: D8780000 00000211
  ds_read_i8    v2, v19                                     // 00003394: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v8                            // 0000339C: 4A221006
  s_waitcnt     vmcnt(11)                                   // 000033A0: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 000033A4: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 000033A8: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 000033AC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000033B0: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000033B4: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 000033BC: D8780000 00000213
  ds_read_i8    v2, v20                                     // 000033C4: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v10                           // 000033CC: 4A261406
  s_waitcnt     vmcnt(11)                                   // 000033D0: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 000033D4: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 000033D8: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 000033DC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000033E0: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000033E4: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 000033EC: D8780000 00000214
  ds_read_i8    v2, v21                                     // 000033F4: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v12                           // 000033FC: 4A281806
  s_waitcnt     vmcnt(11)                                   // 00003400: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 00003404: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00003408: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 0000340C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003410: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003414: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 0000341C: D8780000 00000215
  ds_read_i8    v2, v22                                     // 00003424: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v14                           // 0000342C: 4A2A1C06
  s_waitcnt     vmcnt(11)                                   // 00003430: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 00003434: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00003438: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 0000343C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003440: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003444: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 0000344C: D8780000 00000216
  ds_read_i8    v2, v23                                     // 00003454: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v16                           // 0000345C: 4A2C2006
  s_waitcnt     vmcnt(11)                                   // 00003460: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 00003464: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00003468: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 0000346C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003470: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003474: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 0000347C: D8780000 00000217
  ds_read_i8    v2, v24                                     // 00003484: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v18                           // 0000348C: 4A2E2406
  s_waitcnt     vmcnt(11)                                   // 00003490: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 00003494: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00003498: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 0000349C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000034A0: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000034A4: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 000034AC: D8780000 00000218
  ds_read_i8    v2, v3                                      // 000034B4: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v5                            // 000034BC: 4A300A06
  s_waitcnt     vmcnt(11)                                   // 000034C0: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 000034C4: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 000034C8: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 000034CC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000034D0: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000034D4: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 000034DC: D8780000 00000203
  s_add_i32     s6, s5, s6                                  // 000034E4: 81060605
  ds_read_i8    v2, v15                                     // 000034E8: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v6                             // 000034F0: 4A060C06
  s_waitcnt     vmcnt(11)                                   // 000034F4: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 000034F8: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 000034FC: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00003500: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003504: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003508: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00003510: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00003518: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v8                            // 00003520: 4A1E1006
  s_waitcnt     vmcnt(11)                                   // 00003524: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00003528: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 0000352C: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00003530: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003534: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003538: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00003540: D8780000 00000207
  ds_read_i8    v2, v9                                      // 00003548: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v10                            // 00003550: 4A0E1406
  s_waitcnt     vmcnt(11)                                   // 00003554: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00003558: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 0000355C: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00003560: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003564: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003568: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00003570: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00003578: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v12                            // 00003580: 4A121806
  s_waitcnt     vmcnt(11)                                   // 00003584: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00003588: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 0000358C: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00003590: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003594: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003598: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 000035A0: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 000035A8: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v14                           // 000035B0: 4A161C06
  s_waitcnt     vmcnt(11)                                   // 000035B4: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 000035B8: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 000035BC: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 000035C0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000035C4: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000035C8: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 000035D0: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 000035D8: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v16                           // 000035E0: 4A1A2006
  s_waitcnt     vmcnt(11)                                   // 000035E4: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 000035E8: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 000035EC: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 000035F0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000035F4: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000035F8: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 00003600: D8780000 00000204
  ds_read_i8    v2, v17                                     // 00003608: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v18                            // 00003610: 4A082406
  s_waitcnt     vmcnt(11)                                   // 00003614: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 00003618: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 0000361C: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00003620: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003624: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003628: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 00003630: D8780000 00000211
  ds_read_i8    v2, v19                                     // 00003638: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v5                            // 00003640: 4A220A06
  s_waitcnt     vmcnt(11)                                   // 00003644: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 00003648: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 0000364C: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00003650: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003654: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003658: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 00003660: D8780000 00000213
  s_add_i32     s6, s5, s6                                  // 00003668: 81060605
  ds_read_i8    v2, v20                                     // 0000366C: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v6                            // 00003674: 4A260C06
  s_waitcnt     vmcnt(11)                                   // 00003678: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 0000367C: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00003680: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00003684: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003688: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000368C: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00003694: D8780000 00000214
  ds_read_i8    v2, v21                                     // 0000369C: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v8                            // 000036A4: 4A281006
  s_waitcnt     vmcnt(11)                                   // 000036A8: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 000036AC: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 000036B0: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 000036B4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000036B8: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000036BC: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 000036C4: D8780000 00000215
  ds_read_i8    v2, v22                                     // 000036CC: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v10                           // 000036D4: 4A2A1406
  s_waitcnt     vmcnt(11)                                   // 000036D8: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 000036DC: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 000036E0: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 000036E4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000036E8: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000036EC: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 000036F4: D8780000 00000216
  ds_read_i8    v2, v23                                     // 000036FC: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v12                           // 00003704: 4A2C1806
  s_waitcnt     vmcnt(11)                                   // 00003708: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 0000370C: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00003710: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 00003714: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003718: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000371C: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 00003724: D8780000 00000217
  ds_read_i8    v2, v24                                     // 0000372C: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v14                           // 00003734: 4A2E1C06
  s_waitcnt     vmcnt(11)                                   // 00003738: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 0000373C: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00003740: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00003744: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003748: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000374C: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 00003754: D8780000 00000218
  ds_read_i8    v2, v3                                      // 0000375C: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v16                           // 00003764: 4A302006
  s_waitcnt     vmcnt(11)                                   // 00003768: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 0000376C: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00003770: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00003774: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003778: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 0000377C: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00003784: D8780000 00000203
  ds_read_i8    v2, v15                                     // 0000378C: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v18                            // 00003794: 4A062406
  s_waitcnt     vmcnt(11)                                   // 00003798: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 0000379C: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 000037A0: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 000037A4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000037A8: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000037AC: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 000037B4: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 000037BC: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v5                            // 000037C4: 4A1E0A06
  s_waitcnt     vmcnt(11)                                   // 000037C8: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 000037CC: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 000037D0: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 000037D4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000037D8: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000037DC: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 000037E4: D8780000 00000207
  s_add_i32     s6, s5, s6                                  // 000037EC: 81060605
  ds_read_i8    v2, v9                                      // 000037F0: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v6                             // 000037F8: 4A0E0C06
  s_waitcnt     vmcnt(11)                                   // 000037FC: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00003800: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 00003804: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00003808: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000380C: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003810: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00003818: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00003820: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v8                             // 00003828: 4A121006
  s_waitcnt     vmcnt(11)                                   // 0000382C: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00003830: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 00003834: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00003838: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000383C: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003840: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00003848: D8780000 0000020B
  ds_read_i8    v2, v13                                     // 00003850: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v10                           // 00003858: 4A161406
  s_waitcnt     vmcnt(11)                                   // 0000385C: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 00003860: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00003864: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00003868: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000386C: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003870: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00003878: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 00003880: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v12                           // 00003888: 4A1A1806
  s_waitcnt     vmcnt(11)                                   // 0000388C: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 00003890: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00003894: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 00003898: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000389C: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000038A0: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 000038A8: D8780000 00000204
  ds_read_i8    v2, v17                                     // 000038B0: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v14                            // 000038B8: 4A081C06
  s_waitcnt     vmcnt(11)                                   // 000038BC: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 000038C0: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 000038C4: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 000038C8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000038CC: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000038D0: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 000038D8: D8780000 00000211
  ds_read_i8    v2, v19                                     // 000038E0: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v16                           // 000038E8: 4A222006
  s_waitcnt     vmcnt(11)                                   // 000038EC: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 000038F0: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 000038F4: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 000038F8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000038FC: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003900: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 00003908: D8780000 00000213
  ds_read_i8    v2, v20                                     // 00003910: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v18                           // 00003918: 4A262406
  s_waitcnt     vmcnt(11)                                   // 0000391C: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 00003920: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00003924: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00003928: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000392C: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003930: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00003938: D8780000 00000214
  ds_read_i8    v2, v21                                     // 00003940: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v5                            // 00003948: 4A280A06
  s_waitcnt     vmcnt(11)                                   // 0000394C: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 00003950: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00003954: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 00003958: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 0000395C: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003960: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 00003968: D8780000 00000215
  s_add_i32     s6, s5, s6                                  // 00003970: 81060605
  ds_read_i8    v2, v22                                     // 00003974: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v6                            // 0000397C: 4A2A0C06
  s_waitcnt     vmcnt(11)                                   // 00003980: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 00003984: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00003988: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 0000398C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003990: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003994: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 0000399C: D8780000 00000216
  ds_read_i8    v2, v23                                     // 000039A4: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v8                            // 000039AC: 4A2C1006
  s_waitcnt     vmcnt(11)                                   // 000039B0: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 000039B4: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 000039B8: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 000039BC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000039C0: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000039C4: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 000039CC: D8780000 00000217
  ds_read_i8    v2, v24                                     // 000039D4: D8E40000 02000018
  v_add_i32     v23, vcc, s6, v10                           // 000039DC: 4A2E1406
  s_waitcnt     vmcnt(11)                                   // 000039E0: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 000039E4: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 000039E8: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 000039EC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 000039F0: 4A040481
  tbuffer_load_format_x  v23, v23, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000039F4: EBA01000 80031717
  ds_write_b8   v24, v2                                     // 000039FC: D8780000 00000218
  ds_read_i8    v2, v3                                      // 00003A04: D8E40000 02000003
  v_add_i32     v24, vcc, s6, v12                           // 00003A0C: 4A301806
  s_waitcnt     vmcnt(11)                                   // 00003A10: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00003A14: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00003A18: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00003A1C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003A20: 4A040481
  tbuffer_load_format_x  v24, v24, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003A24: EBA01000 80031818
  ds_write_b8   v3, v2                                      // 00003A2C: D8780000 00000203
  ds_read_i8    v2, v15                                     // 00003A34: D8E40000 0200000F
  v_add_i32     v3, vcc, s6, v14                            // 00003A3C: 4A061C06
  s_waitcnt     vmcnt(11)                                   // 00003A40: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00003A44: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00003A48: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00003A4C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003A50: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003A54: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00003A5C: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00003A64: D8E40000 02000007
  v_add_i32     v15, vcc, s6, v16                           // 00003A6C: 4A1E2006
  s_waitcnt     vmcnt(11)                                   // 00003A70: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00003A74: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00003A78: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00003A7C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003A80: 4A040481
  tbuffer_load_format_x  v15, v15, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003A84: EBA01000 80030F0F
  ds_write_b8   v7, v2                                      // 00003A8C: D8780000 00000207
  ds_read_i8    v2, v9                                      // 00003A94: D8E40000 02000009
  v_add_i32     v7, vcc, s6, v18                            // 00003A9C: 4A0E2406
  s_waitcnt     vmcnt(11)                                   // 00003AA0: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00003AA4: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 00003AA8: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00003AAC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003AB0: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003AB4: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00003ABC: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00003AC4: D8E40000 0200000B
  v_add_i32     v9, vcc, s6, v5                             // 00003ACC: 4A120A06
  s_waitcnt     vmcnt(11)                                   // 00003AD0: BF8C1F7B
  v_add_i32     v13, vcc, v1, v13                           // 00003AD4: 4A1A1B01
  v_add_i32     v13, vcc, s0, v13                           // 00003AD8: 4A1A1A00
  s_waitcnt     lgkmcnt(0)                                  // 00003ADC: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003AE0: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003AE4: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00003AEC: D8780000 0000020B
  s_add_i32     s6, s5, s6                                  // 00003AF4: 81060605
  ds_read_i8    v2, v13                                     // 00003AF8: D8E40000 0200000D
  v_add_i32     v11, vcc, s6, v6                            // 00003B00: 4A160C06
  s_waitcnt     vmcnt(11)                                   // 00003B04: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 00003B08: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00003B0C: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00003B10: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003B14: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003B18: EBA01000 80030B0B
  ds_write_b8   v13, v2                                     // 00003B20: D8780000 0000020D
  ds_read_i8    v2, v4                                      // 00003B28: D8E40000 02000004
  v_add_i32     v13, vcc, s6, v8                            // 00003B30: 4A1A1006
  s_waitcnt     vmcnt(11)                                   // 00003B34: BF8C1F7B
  v_add_i32     v17, vcc, v1, v17                           // 00003B38: 4A222301
  v_add_i32     v17, vcc, s0, v17                           // 00003B3C: 4A222200
  s_waitcnt     lgkmcnt(0)                                  // 00003B40: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003B44: 4A040481
  tbuffer_load_format_x  v13, v13, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003B48: EBA01000 80030D0D
  ds_write_b8   v4, v2                                      // 00003B50: D8780000 00000204
  ds_read_i8    v2, v17                                     // 00003B58: D8E40000 02000011
  v_add_i32     v4, vcc, s6, v10                            // 00003B60: 4A081406
  s_waitcnt     vmcnt(11)                                   // 00003B64: BF8C1F7B
  v_add_i32     v19, vcc, v1, v19                           // 00003B68: 4A262701
  v_add_i32     v19, vcc, s0, v19                           // 00003B6C: 4A262600
  s_waitcnt     lgkmcnt(0)                                  // 00003B70: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003B74: 4A040481
  tbuffer_load_format_x  v4, v4, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003B78: EBA01000 80030404
  ds_write_b8   v17, v2                                     // 00003B80: D8780000 00000211
  ds_read_i8    v2, v19                                     // 00003B88: D8E40000 02000013
  v_add_i32     v17, vcc, s6, v12                           // 00003B90: 4A221806
  s_waitcnt     vmcnt(11)                                   // 00003B94: BF8C1F7B
  v_add_i32     v20, vcc, v1, v20                           // 00003B98: 4A282901
  v_add_i32     v20, vcc, s0, v20                           // 00003B9C: 4A282800
  s_waitcnt     lgkmcnt(0)                                  // 00003BA0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003BA4: 4A040481
  tbuffer_load_format_x  v17, v17, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003BA8: EBA01000 80031111
  ds_write_b8   v19, v2                                     // 00003BB0: D8780000 00000213
  ds_read_i8    v2, v20                                     // 00003BB8: D8E40000 02000014
  v_add_i32     v19, vcc, s6, v14                           // 00003BC0: 4A261C06
  s_waitcnt     vmcnt(11)                                   // 00003BC4: BF8C1F7B
  v_add_i32     v21, vcc, v1, v21                           // 00003BC8: 4A2A2B01
  v_add_i32     v21, vcc, s0, v21                           // 00003BCC: 4A2A2A00
  s_waitcnt     lgkmcnt(0)                                  // 00003BD0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003BD4: 4A040481
  tbuffer_load_format_x  v19, v19, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003BD8: EBA01000 80031313
  ds_write_b8   v20, v2                                     // 00003BE0: D8780000 00000214
  ds_read_i8    v2, v21                                     // 00003BE8: D8E40000 02000015
  v_add_i32     v20, vcc, s6, v16                           // 00003BF0: 4A282006
  s_waitcnt     vmcnt(11)                                   // 00003BF4: BF8C1F7B
  v_add_i32     v22, vcc, v1, v22                           // 00003BF8: 4A2C2D01
  v_add_i32     v22, vcc, s0, v22                           // 00003BFC: 4A2C2C00
  s_waitcnt     lgkmcnt(0)                                  // 00003C00: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003C04: 4A040481
  tbuffer_load_format_x  v20, v20, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003C08: EBA01000 80031414
  ds_write_b8   v21, v2                                     // 00003C10: D8780000 00000215
  ds_read_i8    v2, v22                                     // 00003C18: D8E40000 02000016
  v_add_i32     v21, vcc, s6, v18                           // 00003C20: 4A2A2406
  s_waitcnt     vmcnt(11)                                   // 00003C24: BF8C1F7B
  v_add_i32     v23, vcc, v1, v23                           // 00003C28: 4A2E2F01
  v_add_i32     v23, vcc, s0, v23                           // 00003C2C: 4A2E2E00
  s_waitcnt     lgkmcnt(0)                                  // 00003C30: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003C34: 4A040481
  tbuffer_load_format_x  v21, v21, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003C38: EBA01000 80031515
  ds_write_b8   v22, v2                                     // 00003C40: D8780000 00000216
  ds_read_i8    v2, v23                                     // 00003C48: D8E40000 02000017
  v_add_i32     v22, vcc, s6, v5                            // 00003C50: 4A2C0A06
  s_waitcnt     vmcnt(11)                                   // 00003C54: BF8C1F7B
  v_add_i32     v24, vcc, v1, v24                           // 00003C58: 4A303101
  v_add_i32     v24, vcc, s0, v24                           // 00003C5C: 4A303000
  s_waitcnt     lgkmcnt(0)                                  // 00003C60: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003C64: 4A040481
  tbuffer_load_format_x  v22, v22, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003C68: EBA01000 80031616
  ds_write_b8   v23, v2                                     // 00003C70: D8780000 00000217
  s_add_i32     s5, s5, s6                                  // 00003C78: 81050605
  ds_read_i8    v2, v24                                     // 00003C7C: D8E40000 02000018
  v_add_i32     v6, vcc, s5, v6                             // 00003C84: 4A0C0C05
  s_waitcnt     vmcnt(11)                                   // 00003C88: BF8C1F7B
  v_add_i32     v3, vcc, v1, v3                             // 00003C8C: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00003C90: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00003C94: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003C98: 4A040481
  tbuffer_load_format_x  v6, v6, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003C9C: EBA01000 80030606
  ds_write_b8   v24, v2                                     // 00003CA4: D8780000 00000218
  ds_read_i8    v2, v3                                      // 00003CAC: D8E40000 02000003
  v_add_i32     v8, vcc, s5, v8                             // 00003CB4: 4A101005
  s_waitcnt     vmcnt(11)                                   // 00003CB8: BF8C1F7B
  v_add_i32     v15, vcc, v1, v15                           // 00003CBC: 4A1E1F01
  v_add_i32     v15, vcc, s0, v15                           // 00003CC0: 4A1E1E00
  s_waitcnt     lgkmcnt(0)                                  // 00003CC4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003CC8: 4A040481
  tbuffer_load_format_x  v8, v8, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003CCC: EBA01000 80030808
  ds_write_b8   v3, v2                                      // 00003CD4: D8780000 00000203
  ds_read_i8    v2, v15                                     // 00003CDC: D8E40000 0200000F
  v_add_i32     v3, vcc, s5, v10                            // 00003CE4: 4A061405
  s_waitcnt     vmcnt(11)                                   // 00003CE8: BF8C1F7B
  v_add_i32     v7, vcc, v1, v7                             // 00003CEC: 4A0E0F01
  v_add_i32     v7, vcc, s0, v7                             // 00003CF0: 4A0E0E00
  s_waitcnt     lgkmcnt(0)                                  // 00003CF4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003CF8: 4A040481
  tbuffer_load_format_x  v3, v3, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003CFC: EBA01000 80030303
  ds_write_b8   v15, v2                                     // 00003D04: D8780000 0000020F
  ds_read_i8    v2, v7                                      // 00003D0C: D8E40000 02000007
  v_add_i32     v10, vcc, s5, v12                           // 00003D14: 4A141805
  s_waitcnt     vmcnt(11)                                   // 00003D18: BF8C1F7B
  v_add_i32     v9, vcc, v1, v9                             // 00003D1C: 4A121301
  v_add_i32     v9, vcc, s0, v9                             // 00003D20: 4A121200
  s_waitcnt     lgkmcnt(0)                                  // 00003D24: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003D28: 4A040481
  tbuffer_load_format_x  v10, v10, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003D2C: EBA01000 80030A0A
  ds_write_b8   v7, v2                                      // 00003D34: D8780000 00000207
  ds_read_i8    v2, v9                                      // 00003D3C: D8E40000 02000009
  v_add_i32     v7, vcc, s5, v14                            // 00003D44: 4A0E1C05
  s_waitcnt     vmcnt(11)                                   // 00003D48: BF8C1F7B
  v_add_i32     v11, vcc, v1, v11                           // 00003D4C: 4A161701
  v_add_i32     v11, vcc, s0, v11                           // 00003D50: 4A161600
  s_waitcnt     lgkmcnt(0)                                  // 00003D54: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003D58: 4A040481
  tbuffer_load_format_x  v7, v7, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003D5C: EBA01000 80030707
  ds_write_b8   v9, v2                                      // 00003D64: D8780000 00000209
  ds_read_i8    v2, v11                                     // 00003D6C: D8E40000 0200000B
  v_add_i32     v9, vcc, s5, v16                            // 00003D74: 4A122005
  s_waitcnt     vmcnt(11)                                   // 00003D78: BF8C1F7B
  v_add_i32     v12, vcc, v1, v13                           // 00003D7C: 4A181B01
  v_add_i32     v12, vcc, s0, v12                           // 00003D80: 4A181800
  s_waitcnt     lgkmcnt(0)                                  // 00003D84: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003D88: 4A040481
  tbuffer_load_format_x  v9, v9, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003D8C: EBA01000 80030909
  ds_write_b8   v11, v2                                     // 00003D94: D8780000 0000020B
  ds_read_i8    v2, v12                                     // 00003D9C: D8E40000 0200000C
  v_add_i32     v11, vcc, s5, v18                           // 00003DA4: 4A162405
  s_waitcnt     vmcnt(11)                                   // 00003DA8: BF8C1F7B
  v_add_i32     v4, vcc, v1, v4                             // 00003DAC: 4A080901
  v_add_i32     v4, vcc, s0, v4                             // 00003DB0: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00003DB4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003DB8: 4A040481
  tbuffer_load_format_x  v11, v11, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003DBC: EBA01000 80030B0B
  ds_write_b8   v12, v2                                     // 00003DC4: D8780000 0000020C
  ds_read_i8    v2, v4                                      // 00003DCC: D8E40000 02000004
  v_add_i32     v5, vcc, s5, v5                             // 00003DD4: 4A0A0A05
  s_waitcnt     vmcnt(11)                                   // 00003DD8: BF8C1F7B
  v_add_i32     v12, vcc, v1, v17                           // 00003DDC: 4A182301
  v_add_i32     v12, vcc, s0, v12                           // 00003DE0: 4A181800
  s_waitcnt     lgkmcnt(0)                                  // 00003DE4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003DE8: 4A040481
  tbuffer_load_format_x  v5, v5, s[12:15], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 00003DEC: EBA01000 80030505
  ds_write_b8   v4, v2                                      // 00003DF4: D8780000 00000204
  ds_read_i8    v2, v12                                     // 00003DFC: D8E40000 0200000C
  s_waitcnt     vmcnt(11)                                   // 00003E04: BF8C1F7B
  v_add_i32     v4, vcc, v1, v19                            // 00003E08: 4A082701
  v_add_i32     v4, vcc, s0, v4                             // 00003E0C: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00003E10: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003E14: 4A040481
  ds_write_b8   v12, v2                                     // 00003E18: D8780000 0000020C
  ds_read_i8    v2, v4                                      // 00003E20: D8E40000 02000004
  s_waitcnt     vmcnt(10)                                   // 00003E28: BF8C1F7A
  v_add_i32     v12, vcc, v1, v20                           // 00003E2C: 4A182901
  v_add_i32     v12, vcc, s0, v12                           // 00003E30: 4A181800
  s_waitcnt     lgkmcnt(0)                                  // 00003E34: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003E38: 4A040481
  ds_write_b8   v4, v2                                      // 00003E3C: D8780000 00000204
  ds_read_i8    v2, v12                                     // 00003E44: D8E40000 0200000C
  s_waitcnt     vmcnt(9)                                    // 00003E4C: BF8C1F79
  v_add_i32     v4, vcc, v1, v21                            // 00003E50: 4A082B01
  v_add_i32     v4, vcc, s0, v4                             // 00003E54: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00003E58: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003E5C: 4A040481
  ds_write_b8   v12, v2                                     // 00003E60: D8780000 0000020C
  ds_read_i8    v2, v4                                      // 00003E68: D8E40000 02000004
  s_waitcnt     vmcnt(8)                                    // 00003E70: BF8C1F78
  v_add_i32     v12, vcc, v1, v22                           // 00003E74: 4A182D01
  v_add_i32     v12, vcc, s0, v12                           // 00003E78: 4A181800
  s_waitcnt     lgkmcnt(0)                                  // 00003E7C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003E80: 4A040481
  ds_write_b8   v4, v2                                      // 00003E84: D8780000 00000204
  ds_read_i8    v2, v12                                     // 00003E8C: D8E40000 0200000C
  s_waitcnt     vmcnt(7)                                    // 00003E94: BF8C1F77
  v_add_i32     v4, vcc, v1, v6                             // 00003E98: 4A080D01
  v_add_i32     v4, vcc, s0, v4                             // 00003E9C: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00003EA0: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003EA4: 4A040481
  ds_write_b8   v12, v2                                     // 00003EA8: D8780000 0000020C
  ds_read_i8    v2, v4                                      // 00003EB0: D8E40000 02000004
  s_waitcnt     vmcnt(6)                                    // 00003EB8: BF8C1F76
  v_add_i32     v6, vcc, v1, v8                             // 00003EBC: 4A0C1101
  v_add_i32     v6, vcc, s0, v6                             // 00003EC0: 4A0C0C00
  s_waitcnt     lgkmcnt(0)                                  // 00003EC4: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003EC8: 4A040481
  ds_write_b8   v4, v2                                      // 00003ECC: D8780000 00000204
  ds_read_i8    v2, v6                                      // 00003ED4: D8E40000 02000006
  s_waitcnt     vmcnt(5)                                    // 00003EDC: BF8C1F75
  v_add_i32     v3, vcc, v1, v3                             // 00003EE0: 4A060701
  v_add_i32     v3, vcc, s0, v3                             // 00003EE4: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00003EE8: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003EEC: 4A040481
  ds_write_b8   v6, v2                                      // 00003EF0: D8780000 00000206
  ds_read_i8    v2, v3                                      // 00003EF8: D8E40000 02000003
  s_waitcnt     vmcnt(4)                                    // 00003F00: BF8C1F74
  v_add_i32     v4, vcc, v1, v10                            // 00003F04: 4A081501
  v_add_i32     v4, vcc, s0, v4                             // 00003F08: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00003F0C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003F10: 4A040481
  ds_write_b8   v3, v2                                      // 00003F14: D8780000 00000203
  ds_read_i8    v2, v4                                      // 00003F1C: D8E40000 02000004
  s_waitcnt     vmcnt(3)                                    // 00003F24: BF8C1F73
  v_add_i32     v3, vcc, v1, v7                             // 00003F28: 4A060F01
  v_add_i32     v3, vcc, s0, v3                             // 00003F2C: 4A060600
  s_waitcnt     lgkmcnt(0)                                  // 00003F30: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003F34: 4A040481
  ds_write_b8   v4, v2                                      // 00003F38: D8780000 00000204
  ds_read_i8    v2, v3                                      // 00003F40: D8E40000 02000003
  s_waitcnt     vmcnt(2)                                    // 00003F48: BF8C1F72
  v_add_i32     v4, vcc, v1, v9                             // 00003F4C: 4A081301
  v_add_i32     v4, vcc, s0, v4                             // 00003F50: 4A080800
  s_waitcnt     lgkmcnt(0)                                  // 00003F54: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003F58: 4A040481
  ds_write_b8   v3, v2                                      // 00003F5C: D8780000 00000203
  ds_read_i8    v2, v4                                      // 00003F64: D8E40000 02000004
  s_waitcnt     vmcnt(1)                                    // 00003F6C: BF8C1F71
  v_add_i32     v3, vcc, v1, v11                            // 00003F70: 4A061701
  v_add_i32     v3, vcc, s0, v3                             // 00003F74: 4A060600
  v_cvt_f32_u32  v6, s4                                     // 00003F78: 7E0C0C04
  s_waitcnt     lgkmcnt(0)                                  // 00003F7C: BF8C007F
  v_add_i32     v2, vcc, 1, v2                              // 00003F80: 4A040481
  v_rcp_f32     v6, v6                                      // 00003F84: 7E0C5506
  ds_write_b8   v4, v2                                      // 00003F88: D8780000 00000204
  v_mul_f32     v2, 0x4f800000, v6                          // 00003F90: 10040CFF 4F800000
  ds_read_i8    v4, v3                                      // 00003F98: D8E40000 04000003
  v_cvt_u32_f32  v2, v2                                     // 00003FA0: 7E040F02
  s_waitcnt     vmcnt(0)                                    // 00003FA4: BF8C1F70
  v_add_i32     v1, vcc, v1, v5                             // 00003FA8: 4A020B01
  v_mul_lo_u32  v5, s4, v2                                  // 00003FAC: D2D20005 02020404
  v_mul_hi_u32  v6, s4, v2                                  // 00003FB4: D2D40006 02020404
  v_add_i32     v1, vcc, s0, v1                             // 00003FBC: 4A020200
  v_sub_i32     v7, vcc, 0, v5                              // 00003FC0: 4C0E0A80
  v_cmp_ne_i32  s[6:7], v6, 0                               // 00003FC4: D10A0006 00010106
  v_cndmask_b32  v5, v7, v5, s[6:7]                         // 00003FCC: D2000005 001A0B07
  v_mul_hi_u32  v5, v5, v2                                  // 00003FD4: D2D40005 02020505
  s_waitcnt     lgkmcnt(0)                                  // 00003FDC: BF8C007F
  v_add_i32     v4, vcc, 1, v4                              // 00003FE0: 4A080881
  v_sub_i32     v6, vcc, v2, v5                             // 00003FE4: 4C0C0B02
  v_add_i32     v2, vcc, v2, v5                             // 00003FE8: 4A040B02
  ds_write_b8   v3, v4                                      // 00003FEC: D8780000 00000403
  v_cndmask_b32  v2, v2, v6, s[6:7]                         // 00003FF4: D2000002 001A0D02
  ds_read_i8    v3, v1                                      // 00003FFC: D8E40000 03000001
  v_lshrrev_b32  v2, 24, v2                                 // 00004004: 2C040498
  v_mul_lo_u32  v4, v2, s4                                  // 00004008: D2D20004 02000902
  v_sub_i32     v5, vcc, 0x00000100, v4                     // 00004010: 4C0A08FF 00000100
  s_movk_i32    s5, 0x0100                                  // 00004018: B0050100
  v_cmp_le_u32  s[6:7], v4, s5                              // 0000401C: D1860006 00000B04
  v_cmp_ge_u32  s[12:13], v5, s4                            // 00004024: D18C000C 00000905
  s_and_b64     s[12:13], s[6:7], s[12:13]                  // 0000402C: 878C0C06
  s_waitcnt     lgkmcnt(0)                                  // 00004030: BF8C007F
  v_add_i32     v3, vcc, 1, v3                              // 00004034: 4A060681
  v_addc_u32    v2, vcc, v2, 0, s[12:13]                    // 00004038: D2506A02 00310102
  ds_write_b8   v1, v3                                      // 00004040: D8780000 00000301
  v_addc_u32    v1, vcc, v2, -1, s[6:7]                     // 00004048: D2506A01 00198302
  v_cmp_ne_i32  vcc, s4, 0                                  // 00004050: D10A006A 00010004
  s_buffer_load_dword  s5, s[8:11], 0x08                    // 00004058: C2028908
  v_cndmask_b32  v1, -1, v1, vcc                            // 0000405C: 000202C1
  s_waitcnt     lgkmcnt(0)                                  // 00004060: BF8C007F
  s_barrier                                                 // 00004064: BF8A0000
  v_mov_b32     v2, 0                                       // 00004068: 7E040280
  v_cmp_ne_i32  vcc, v1, v2                                 // 0000406C: 7D0A0501
  s_cbranch_vccz  label_1042                                // 00004070: BF860025
  s_lshl_b32    s1, s1, 10                                  // 00004074: 8F018A01
  s_add_i32     s1, s5, s1                                  // 00004078: 81010105
  s_load_dwordx4  s[8:11], s[2:3], 0x50                     // 0000407C: C0840350
  v_readfirstlane_b32  s2, v1                               // 00004080: 7E040501
label_1021:
  v_add_i32     v1, vcc, s0, v0                             // 00004084: 4A020000
  s_cmp_eq_i32  s4, 0                                       // 00004088: BF008004
  s_cbranch_scc1  label_1035                                // 0000408C: BF850011
  s_waitcnt     expcnt(0)                                   // 00004090: BF8C1F0F
  v_mov_b32     v4, 0                                       // 00004094: 7E080280
  s_mov_b32     s3, s4                                      // 00004098: BE830304
label_1027:
  ds_read_u8    v3, v1                                      // 0000409C: D8E80000 03000001
  s_waitcnt     lgkmcnt(0)                                  // 000040A4: BF8C007F
  v_and_b32     v3, 0x000000ff, v3                          // 000040A8: 360606FF 000000FF
  v_add_i32     v1, vcc, 0x00000100, v1                     // 000040B0: 4A0202FF 00000100
  v_add_i32     v4, vcc, v4, v3                             // 000040B8: 4A080704
  s_add_i32     s3, -1, s3                                  // 000040BC: 810303C1
  s_cmp_eq_i32  s3, 0                                       // 000040C0: BF008003
  s_cbranch_scc1  label_1034                                // 000040C4: BF850002
  s_branch      label_1027                                  // 000040C8: BF82FFF4
  s_branch      label_1027                                  // 000040CC: BF82FFF3
label_1034:
  s_branch      label_1037                                  // 000040D0: BF820002
label_1035:
  s_waitcnt     expcnt(0)                                   // 000040D4: BF8C1F0F
  v_mov_b32     v4, 0                                       // 000040D8: 7E080280
label_1037:
  v_lshlrev_b32  v2, 2, v0                                  // 000040DC: 34040082
  v_add_i32     v2, vcc, s1, v2                             // 000040E0: 4A040401
  s_waitcnt     lgkmcnt(0)                                  // 000040E4: BF8C007F
  tbuffer_store_format_x  v4, v2, s[8:11], 0 offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT] // 000040E8: EBA41000 80020402
  v_add_i32     v0, vcc, s4, v0                             // 000040F0: 4A000004
  s_add_i32     s2, -1, s2                                  // 000040F4: 810202C1
  s_cmp_eq_i32  s2, 0                                       // 000040F8: BF008002
  s_cbranch_scc1  label_1042                                // 000040FC: BF850002
  s_branch      label_1021                                  // 00004100: BF82FFE0
  s_branch      label_1021                                  // 00004104: BF82FFDF
label_1042:
  s_endpgm                                                  // 00004108: BF810000



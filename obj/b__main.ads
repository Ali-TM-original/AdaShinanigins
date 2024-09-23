pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 13.1.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   GNAT_Version_Address : constant System.Address := GNAT_Version'Address;
   pragma Export (C, GNAT_Version_Address, "__gnat_version_address");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#3e1ea153#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#7320ff5f#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#e25e387f#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#052886e3#;
   pragma Export (C, u00004, "perfectB");
   u00005 : constant Version_32 := 16#9b6bc62d#;
   pragma Export (C, u00005, "perfectS");
   u00006 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00007, "ada__integer_text_ioB");
   u00008 : constant Version_32 := 16#dc1f7556#;
   pragma Export (C, u00008, "ada__integer_text_ioS");
   u00009 : constant Version_32 := 16#5bea4c0b#;
   pragma Export (C, u00009, "ada__exceptionsB");
   u00010 : constant Version_32 := 16#ac4814eb#;
   pragma Export (C, u00010, "ada__exceptionsS");
   u00011 : constant Version_32 := 16#0740df23#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#6dc27684#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#f0509fe6#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#fd5f5f4c#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#8dcd0905#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#d4c699bf#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#d8122a51#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#821dff88#;
   pragma Export (C, u00018, "system__parametersB");
   u00019 : constant Version_32 := 16#24c43b40#;
   pragma Export (C, u00019, "system__parametersS");
   u00020 : constant Version_32 := 16#2a95d23d#;
   pragma Export (C, u00020, "system__storage_elementsB");
   u00021 : constant Version_32 := 16#5b04f702#;
   pragma Export (C, u00021, "system__storage_elementsS");
   u00022 : constant Version_32 := 16#0286ce9f#;
   pragma Export (C, u00022, "system__soft_links__initializeB");
   u00023 : constant Version_32 := 16#2ed17187#;
   pragma Export (C, u00023, "system__soft_links__initializeS");
   u00024 : constant Version_32 := 16#8599b27b#;
   pragma Export (C, u00024, "system__stack_checkingB");
   u00025 : constant Version_32 := 16#508536fc#;
   pragma Export (C, u00025, "system__stack_checkingS");
   u00026 : constant Version_32 := 16#c71e6c8a#;
   pragma Export (C, u00026, "system__exception_tableB");
   u00027 : constant Version_32 := 16#7d7be9ff#;
   pragma Export (C, u00027, "system__exception_tableS");
   u00028 : constant Version_32 := 16#c2f520d4#;
   pragma Export (C, u00028, "system__exceptionsS");
   u00029 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00029, "system__exceptions__machineB");
   u00030 : constant Version_32 := 16#8bdfdbe3#;
   pragma Export (C, u00030, "system__exceptions__machineS");
   u00031 : constant Version_32 := 16#7706238d#;
   pragma Export (C, u00031, "system__exceptions_debugB");
   u00032 : constant Version_32 := 16#c05ec7b5#;
   pragma Export (C, u00032, "system__exceptions_debugS");
   u00033 : constant Version_32 := 16#80d3408e#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#f2c63a02#;
   pragma Export (C, u00034, "ada__numericsS");
   u00035 : constant Version_32 := 16#174f5472#;
   pragma Export (C, u00035, "ada__numerics__big_numbersS");
   u00036 : constant Version_32 := 16#0a7ae0bf#;
   pragma Export (C, u00036, "system__unsigned_typesS");
   u00037 : constant Version_32 := 16#ecb207e8#;
   pragma Export (C, u00037, "system__val_intS");
   u00038 : constant Version_32 := 16#faac17dc#;
   pragma Export (C, u00038, "system__val_unsS");
   u00039 : constant Version_32 := 16#96e09402#;
   pragma Export (C, u00039, "system__val_utilB");
   u00040 : constant Version_32 := 16#c3954b6b#;
   pragma Export (C, u00040, "system__val_utilS");
   u00041 : constant Version_32 := 16#b98923bf#;
   pragma Export (C, u00041, "system__case_utilB");
   u00042 : constant Version_32 := 16#3f4348b3#;
   pragma Export (C, u00042, "system__case_utilS");
   u00043 : constant Version_32 := 16#3f3fad5d#;
   pragma Export (C, u00043, "system__wid_unsS");
   u00044 : constant Version_32 := 16#5c7d9c20#;
   pragma Export (C, u00044, "system__tracebackB");
   u00045 : constant Version_32 := 16#76ca6b5b#;
   pragma Export (C, u00045, "system__tracebackS");
   u00046 : constant Version_32 := 16#5f6b6486#;
   pragma Export (C, u00046, "system__traceback_entriesB");
   u00047 : constant Version_32 := 16#384c206a#;
   pragma Export (C, u00047, "system__traceback_entriesS");
   u00048 : constant Version_32 := 16#6ba3967c#;
   pragma Export (C, u00048, "system__traceback__symbolicB");
   u00049 : constant Version_32 := 16#d9e66ad1#;
   pragma Export (C, u00049, "system__traceback__symbolicS");
   u00050 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00050, "ada__containersS");
   u00051 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00051, "ada__exceptions__tracebackB");
   u00052 : constant Version_32 := 16#eb07882c#;
   pragma Export (C, u00052, "ada__exceptions__tracebackS");
   u00053 : constant Version_32 := 16#6ef2c461#;
   pragma Export (C, u00053, "system__bounded_stringsB");
   u00054 : constant Version_32 := 16#87adbeff#;
   pragma Export (C, u00054, "system__bounded_stringsS");
   u00055 : constant Version_32 := 16#aec2a9b8#;
   pragma Export (C, u00055, "system__crtlS");
   u00056 : constant Version_32 := 16#9f199b4a#;
   pragma Export (C, u00056, "system__dwarf_linesB");
   u00057 : constant Version_32 := 16#17f6aaf0#;
   pragma Export (C, u00057, "system__dwarf_linesS");
   u00058 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00058, "ada__charactersS");
   u00059 : constant Version_32 := 16#f70a517e#;
   pragma Export (C, u00059, "ada__characters__handlingB");
   u00060 : constant Version_32 := 16#ea6baced#;
   pragma Export (C, u00060, "ada__characters__handlingS");
   u00061 : constant Version_32 := 16#cde9ea2d#;
   pragma Export (C, u00061, "ada__characters__latin_1S");
   u00062 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00062, "ada__stringsS");
   u00063 : constant Version_32 := 16#16f45e54#;
   pragma Export (C, u00063, "ada__strings__mapsB");
   u00064 : constant Version_32 := 16#9df1863a#;
   pragma Export (C, u00064, "ada__strings__mapsS");
   u00065 : constant Version_32 := 16#96b40646#;
   pragma Export (C, u00065, "system__bit_opsB");
   u00066 : constant Version_32 := 16#3da333da#;
   pragma Export (C, u00066, "system__bit_opsS");
   u00067 : constant Version_32 := 16#4642cba6#;
   pragma Export (C, u00067, "ada__strings__maps__constantsS");
   u00068 : constant Version_32 := 16#15f799c2#;
   pragma Export (C, u00068, "interfacesS");
   u00069 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00069, "system__address_imageB");
   u00070 : constant Version_32 := 16#51bc02dc#;
   pragma Export (C, u00070, "system__address_imageS");
   u00071 : constant Version_32 := 16#7fca0124#;
   pragma Export (C, u00071, "system__img_unsS");
   u00072 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00072, "system__ioB");
   u00073 : constant Version_32 := 16#6e1268a9#;
   pragma Export (C, u00073, "system__ioS");
   u00074 : constant Version_32 := 16#b25b689d#;
   pragma Export (C, u00074, "system__mmapB");
   u00075 : constant Version_32 := 16#c87b9b1c#;
   pragma Export (C, u00075, "system__mmapS");
   u00076 : constant Version_32 := 16#367911c4#;
   pragma Export (C, u00076, "ada__io_exceptionsS");
   u00077 : constant Version_32 := 16#2e05e25c#;
   pragma Export (C, u00077, "system__mmap__os_interfaceB");
   u00078 : constant Version_32 := 16#52ab6463#;
   pragma Export (C, u00078, "system__mmap__os_interfaceS");
   u00079 : constant Version_32 := 16#1d7382c4#;
   pragma Export (C, u00079, "system__os_libB");
   u00080 : constant Version_32 := 16#0a3c4fb9#;
   pragma Export (C, u00080, "system__os_libS");
   u00081 : constant Version_32 := 16#6e5d049a#;
   pragma Export (C, u00081, "system__atomic_operations__test_and_setB");
   u00082 : constant Version_32 := 16#57acee8e#;
   pragma Export (C, u00082, "system__atomic_operations__test_and_setS");
   u00083 : constant Version_32 := 16#3733e5c3#;
   pragma Export (C, u00083, "system__atomic_operationsS");
   u00084 : constant Version_32 := 16#29cc6115#;
   pragma Export (C, u00084, "system__atomic_primitivesB");
   u00085 : constant Version_32 := 16#b719d7c7#;
   pragma Export (C, u00085, "system__atomic_primitivesS");
   u00086 : constant Version_32 := 16#545fe66d#;
   pragma Export (C, u00086, "interfaces__cB");
   u00087 : constant Version_32 := 16#9d395173#;
   pragma Export (C, u00087, "interfaces__cS");
   u00088 : constant Version_32 := 16#256dbbe5#;
   pragma Export (C, u00088, "system__stringsB");
   u00089 : constant Version_32 := 16#6bd29ffe#;
   pragma Export (C, u00089, "system__stringsS");
   u00090 : constant Version_32 := 16#2fdbc40e#;
   pragma Export (C, u00090, "system__object_readerB");
   u00091 : constant Version_32 := 16#e7c98bed#;
   pragma Export (C, u00091, "system__object_readerS");
   u00092 : constant Version_32 := 16#65ddb07c#;
   pragma Export (C, u00092, "system__val_lliS");
   u00093 : constant Version_32 := 16#d863c536#;
   pragma Export (C, u00093, "system__val_lluS");
   u00094 : constant Version_32 := 16#bad10b33#;
   pragma Export (C, u00094, "system__exception_tracesB");
   u00095 : constant Version_32 := 16#1cc8f680#;
   pragma Export (C, u00095, "system__exception_tracesS");
   u00096 : constant Version_32 := 16#b9a6a00a#;
   pragma Export (C, u00096, "system__win32S");
   u00097 : constant Version_32 := 16#fd158a37#;
   pragma Export (C, u00097, "system__wch_conB");
   u00098 : constant Version_32 := 16#2953bc85#;
   pragma Export (C, u00098, "system__wch_conS");
   u00099 : constant Version_32 := 16#5c289972#;
   pragma Export (C, u00099, "system__wch_stwB");
   u00100 : constant Version_32 := 16#04429084#;
   pragma Export (C, u00100, "system__wch_stwS");
   u00101 : constant Version_32 := 16#f8305de6#;
   pragma Export (C, u00101, "system__wch_cnvB");
   u00102 : constant Version_32 := 16#2f9376f5#;
   pragma Export (C, u00102, "system__wch_cnvS");
   u00103 : constant Version_32 := 16#e538de43#;
   pragma Export (C, u00103, "system__wch_jisB");
   u00104 : constant Version_32 := 16#9a2414df#;
   pragma Export (C, u00104, "system__wch_jisS");
   u00105 : constant Version_32 := 16#67eb6d5a#;
   pragma Export (C, u00105, "ada__text_ioB");
   u00106 : constant Version_32 := 16#8ecc2275#;
   pragma Export (C, u00106, "ada__text_ioS");
   u00107 : constant Version_32 := 16#b4f41810#;
   pragma Export (C, u00107, "ada__streamsB");
   u00108 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00108, "ada__streamsS");
   u00109 : constant Version_32 := 16#a201b8c5#;
   pragma Export (C, u00109, "ada__strings__text_buffersB");
   u00110 : constant Version_32 := 16#a7cfd09b#;
   pragma Export (C, u00110, "ada__strings__text_buffersS");
   u00111 : constant Version_32 := 16#8b7604c4#;
   pragma Export (C, u00111, "ada__strings__utf_encodingB");
   u00112 : constant Version_32 := 16#4d0e0994#;
   pragma Export (C, u00112, "ada__strings__utf_encodingS");
   u00113 : constant Version_32 := 16#bb780f45#;
   pragma Export (C, u00113, "ada__strings__utf_encoding__stringsB");
   u00114 : constant Version_32 := 16#b85ff4b6#;
   pragma Export (C, u00114, "ada__strings__utf_encoding__stringsS");
   u00115 : constant Version_32 := 16#d1d1ed0b#;
   pragma Export (C, u00115, "ada__strings__utf_encoding__wide_stringsB");
   u00116 : constant Version_32 := 16#5678478f#;
   pragma Export (C, u00116, "ada__strings__utf_encoding__wide_stringsS");
   u00117 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00117, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00118 : constant Version_32 := 16#d7af3358#;
   pragma Export (C, u00118, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00119 : constant Version_32 := 16#f38d604a#;
   pragma Export (C, u00119, "ada__tagsB");
   u00120 : constant Version_32 := 16#4d1deaec#;
   pragma Export (C, u00120, "ada__tagsS");
   u00121 : constant Version_32 := 16#3548d972#;
   pragma Export (C, u00121, "system__htableB");
   u00122 : constant Version_32 := 16#7189c70d#;
   pragma Export (C, u00122, "system__htableS");
   u00123 : constant Version_32 := 16#1f1abe38#;
   pragma Export (C, u00123, "system__string_hashB");
   u00124 : constant Version_32 := 16#d6cc4772#;
   pragma Export (C, u00124, "system__string_hashS");
   u00125 : constant Version_32 := 16#abd3c34b#;
   pragma Export (C, u00125, "system__put_imagesB");
   u00126 : constant Version_32 := 16#ecfe98f9#;
   pragma Export (C, u00126, "system__put_imagesS");
   u00127 : constant Version_32 := 16#22b9eb9f#;
   pragma Export (C, u00127, "ada__strings__text_buffers__utilsB");
   u00128 : constant Version_32 := 16#89062ac3#;
   pragma Export (C, u00128, "ada__strings__text_buffers__utilsS");
   u00129 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00129, "interfaces__c_streamsB");
   u00130 : constant Version_32 := 16#7acc80b4#;
   pragma Export (C, u00130, "interfaces__c_streamsS");
   u00131 : constant Version_32 := 16#1aa716c1#;
   pragma Export (C, u00131, "system__file_ioB");
   u00132 : constant Version_32 := 16#8cf25ab3#;
   pragma Export (C, u00132, "system__file_ioS");
   u00133 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00133, "ada__finalizationS");
   u00134 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00134, "system__finalization_rootB");
   u00135 : constant Version_32 := 16#bfa2ec76#;
   pragma Export (C, u00135, "system__finalization_rootS");
   u00136 : constant Version_32 := 16#52a168f7#;
   pragma Export (C, u00136, "system__file_control_blockS");
   u00137 : constant Version_32 := 16#44bc8f6a#;
   pragma Export (C, u00137, "ada__text_io__generic_auxB");
   u00138 : constant Version_32 := 16#ba6faca0#;
   pragma Export (C, u00138, "ada__text_io__generic_auxS");
   u00139 : constant Version_32 := 16#39a71c18#;
   pragma Export (C, u00139, "system__img_biuS");
   u00140 : constant Version_32 := 16#74f9dbc6#;
   pragma Export (C, u00140, "system__img_llbS");
   u00141 : constant Version_32 := 16#d216f0b1#;
   pragma Export (C, u00141, "system__img_lliS");
   u00142 : constant Version_32 := 16#1f37fe44#;
   pragma Export (C, u00142, "system__wid_lluS");
   u00143 : constant Version_32 := 16#03082eb4#;
   pragma Export (C, u00143, "system__img_lllbS");
   u00144 : constant Version_32 := 16#34b112c5#;
   pragma Export (C, u00144, "system__img_llliS");
   u00145 : constant Version_32 := 16#5893981f#;
   pragma Export (C, u00145, "system__val_llliS");
   u00146 : constant Version_32 := 16#eedda4ec#;
   pragma Export (C, u00146, "system__val_llluS");
   u00147 : constant Version_32 := 16#7c8a2b07#;
   pragma Export (C, u00147, "system__wid_llluS");
   u00148 : constant Version_32 := 16#097c37b8#;
   pragma Export (C, u00148, "system__img_lllwS");
   u00149 : constant Version_32 := 16#28cbaecd#;
   pragma Export (C, u00149, "system__img_llwS");
   u00150 : constant Version_32 := 16#067da72a#;
   pragma Export (C, u00150, "system__img_wiuS");
   u00151 : constant Version_32 := 16#ca878138#;
   pragma Export (C, u00151, "system__concat_2B");
   u00152 : constant Version_32 := 16#45abec11#;
   pragma Export (C, u00152, "system__concat_2S");
   u00153 : constant Version_32 := 16#1982dcd0#;
   pragma Export (C, u00153, "system__memoryB");
   u00154 : constant Version_32 := 16#abd4ad36#;
   pragma Export (C, u00154, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.atomic_operations%s
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_llb%s
   --  system.img_lllb%s
   --  system.img_lllw%s
   --  system.img_llw%s
   --  system.img_wiu%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.atomic_operations.test_and_set%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.val_uns%s
   --  system.val_int%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  ada.numerics.big_numbers%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.atomic_primitives%s
   --  system.atomic_primitives%b
   --  system.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.win32%s
   --  ada.characters.handling%b
   --  system.atomic_operations.test_and_set%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap.os_interface%b
   --  system.mmap%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.wid_uns%s
   --  system.img_int%s
   --  ada.exceptions%b
   --  system.img_uns%s
   --  system.dwarf_lines%b
   --  ada.strings.utf_encoding%s
   --  ada.strings.utf_encoding%b
   --  ada.strings.utf_encoding.strings%s
   --  ada.strings.utf_encoding.strings%b
   --  ada.strings.utf_encoding.wide_strings%s
   --  ada.strings.utf_encoding.wide_strings%b
   --  ada.strings.utf_encoding.wide_wide_strings%s
   --  ada.strings.utf_encoding.wide_wide_strings%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.strings.text_buffers%s
   --  ada.strings.text_buffers%b
   --  ada.strings.text_buffers.utils%s
   --  ada.strings.text_buffers.utils%b
   --  system.put_images%s
   --  system.put_images%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.val_lllu%s
   --  system.val_llli%s
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  system.wid_lllu%s
   --  system.img_llli%s
   --  system.wid_llu%s
   --  system.img_lli%s
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  perfect%s
   --  perfect%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;

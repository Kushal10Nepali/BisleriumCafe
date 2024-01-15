; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [162 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [324 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 117
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 116
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 131
	i32 38948123, ; 3: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 4: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 5: System.Threading.Thread => 0x28aa24d => 149
	i32 67008169, ; 6: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 7: System.Security.Cryptography.Primitives => 0x410f24b => 139
	i32 72070932, ; 8: Microsoft.Maui.Graphics.dll => 0x44bb714 => 59
	i32 83839681, ; 9: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 10: System.Runtime.InteropServices => 0x6ffddbc => 130
	i32 122350210, ; 11: System.Threading.Channels.dll => 0x74aea82 => 147
	i32 136584136, ; 12: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 13: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 142721839, ; 14: System.Net.WebHeaderCollection => 0x881c32f => 123
	i32 149972175, ; 15: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 139
	i32 159306688, ; 16: System.ComponentModel.Annotations => 0x97ed3c0 => 97
	i32 165246403, ; 17: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 68
	i32 182336117, ; 18: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 86
	i32 205061960, ; 19: System.ComponentModel => 0xc38ff48 => 100
	i32 254259026, ; 20: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 37
	i32 317674968, ; 21: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 22: Xamarin.AndroidX.Activity.dll => 0x13031348 => 64
	i32 321963286, ; 23: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 24: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 75
	i32 375677976, ; 25: System.Net.ServicePoint.dll => 0x16646418 => 121
	i32 379916513, ; 26: System.Threading.Thread.dll => 0x16a510e1 => 149
	i32 385762202, ; 27: System.Memory.dll => 0x16fe439a => 114
	i32 392610295, ; 28: System.Threading.ThreadPool.dll => 0x1766c1f7 => 150
	i32 395744057, ; 29: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 30: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 31: System.Collections => 0x1a61054f => 96
	i32 450948140, ; 32: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 74
	i32 451504562, ; 33: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 140
	i32 456227837, ; 34: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 469710990, ; 35: System.dll => 0x1bff388e => 156
	i32 489220957, ; 36: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 37: System.ObjectModel => 0x1dbae811 => 125
	i32 513247710, ; 38: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 53
	i32 525008092, ; 39: SkiaSharp.dll => 0x1f4afcdc => 60
	i32 538707440, ; 40: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 41: Microsoft.Extensions.Logging => 0x20216150 => 50
	i32 571435654, ; 42: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 47
	i32 613668793, ; 43: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 136
	i32 627609679, ; 44: Xamarin.AndroidX.CustomView => 0x2568904f => 72
	i32 627931235, ; 45: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 46: System.Text.Encodings.Web.dll => 0x27787397 => 144
	i32 672442732, ; 47: System.Collections.Concurrent => 0x2814a96c => 93
	i32 683518922, ; 48: System.Net.Security => 0x28bdabca => 120
	i32 690569205, ; 49: System.Xml.Linq.dll => 0x29293ff5 => 153
	i32 722857257, ; 50: System.Runtime.Loader.dll => 0x2b15ed29 => 132
	i32 759454413, ; 51: System.Net.Requests => 0x2d445acd => 119
	i32 775507847, ; 52: System.IO.Compression => 0x2e394f87 => 110
	i32 777317022, ; 53: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 54: Microsoft.Extensions.Options => 0x2f0980eb => 52
	i32 804008546, ; 55: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 40
	i32 804715423, ; 56: System.Data.Common => 0x2ff6fb9f => 102
	i32 823281589, ; 57: System.Private.Uri.dll => 0x311247b5 => 126
	i32 830298997, ; 58: System.IO.Compression.Brotli => 0x317d5b75 => 109
	i32 869139383, ; 59: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 60: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 61: System.ComponentModel.Primitives.dll => 0x35e25008 => 98
	i32 918734561, ; 62: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 63: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 64: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 75
	i32 975874589, ; 65: System.Xml.XDocument => 0x3a2aaa1d => 155
	i32 990727110, ; 66: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 67: System.Collections.dll => 0x3b2c715c => 96
	i32 999186168, ; 68: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 49
	i32 1012816738, ; 69: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 85
	i32 1019214401, ; 70: System.Drawing => 0x3cbffa41 => 107
	i32 1028951442, ; 71: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 44
	i32 1035644815, ; 72: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 65
	i32 1036536393, ; 73: System.Drawing.Primitives.dll => 0x3dc84a49 => 106
	i32 1043950537, ; 74: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 75: System.Linq.Expressions.dll => 0x3e444eb4 => 112
	i32 1052210849, ; 76: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 77
	i32 1082857460, ; 77: System.ComponentModel.TypeConverter => 0x408b17f4 => 99
	i32 1084122840, ; 78: Xamarin.Kotlin.StdLib => 0x409e66d8 => 90
	i32 1098259244, ; 79: System => 0x41761b2c => 156
	i32 1108272742, ; 80: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 81: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 82: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 83: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1173126369, ; 84: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 45
	i32 1178241025, ; 85: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 82
	i32 1208641965, ; 86: System.Diagnostics.Process => 0x480a69ad => 104
	i32 1260983243, ; 87: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1264538220, ; 88: Syncfusion.Compression.Portable => 0x4b5f526c => 61
	i32 1293217323, ; 89: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 73
	i32 1308624726, ; 90: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 91: System.Linq => 0x4eed2679 => 113
	i32 1336711579, ; 92: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 93: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 94: Xamarin.AndroidX.SavedState => 0x52114ed3 => 85
	i32 1406073936, ; 95: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 69
	i32 1408764838, ; 96: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 134
	i32 1411638395, ; 97: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 129
	i32 1430672901, ; 98: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1452070440, ; 99: System.Formats.Asn1.dll => 0x568cd628 => 108
	i32 1454105418, ; 100: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 46
	i32 1458022317, ; 101: System.Net.Security.dll => 0x56e7a7ad => 120
	i32 1461004990, ; 102: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 103: System.IO.Compression.dll => 0x57261233 => 110
	i32 1469204771, ; 104: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 66
	i32 1470490898, ; 105: Microsoft.Extensions.Primitives => 0x57a5e912 => 53
	i32 1480492111, ; 106: System.IO.Compression.Brotli.dll => 0x583e844f => 109
	i32 1521091094, ; 107: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 49
	i32 1526286932, ; 108: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 109: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 146
	i32 1546581739, ; 110: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 40
	i32 1622152042, ; 111: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 79
	i32 1624863272, ; 112: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 88
	i32 1636350590, ; 113: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 71
	i32 1639515021, ; 114: System.Net.Http.dll => 0x61b9038d => 115
	i32 1639986890, ; 115: System.Text.RegularExpressions => 0x61c036ca => 146
	i32 1654881142, ; 116: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 39
	i32 1657153582, ; 117: System.Runtime => 0x62c6282e => 135
	i32 1658251792, ; 118: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 89
	i32 1677501392, ; 119: System.Net.Primitives.dll => 0x63fca3d0 => 118
	i32 1679769178, ; 120: System.Security.Cryptography => 0x641f3e5a => 141
	i32 1696967625, ; 121: System.Security.Cryptography.Csp => 0x6525abc9 => 137
	i32 1729485958, ; 122: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 67
	i32 1743415430, ; 123: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1760259689, ; 124: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 38
	i32 1763938596, ; 125: System.Diagnostics.TraceSource.dll => 0x69239124 => 105
	i32 1766324549, ; 126: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 86
	i32 1770582343, ; 127: Microsoft.Extensions.Logging.dll => 0x6988f147 => 50
	i32 1780572499, ; 128: Mono.Android.Runtime.dll => 0x6a216153 => 160
	i32 1782862114, ; 129: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 130: Xamarin.AndroidX.Fragment => 0x6a96652d => 74
	i32 1793755602, ; 131: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 132: Xamarin.AndroidX.Loader => 0x6bcd3296 => 79
	i32 1813058853, ; 133: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 90
	i32 1813201214, ; 134: Xamarin.Google.Android.Material => 0x6c13413e => 89
	i32 1818569960, ; 135: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 83
	i32 1824175904, ; 136: System.Text.Encoding.Extensions => 0x6cbab720 => 143
	i32 1824722060, ; 137: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 134
	i32 1828688058, ; 138: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 51
	i32 1853025655, ; 139: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 140: System.Linq.Expressions => 0x6ec71a65 => 112
	i32 1875935024, ; 141: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 142: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 143: System.Collections.NonGeneric.dll => 0x71dc7c8b => 94
	i32 1939592360, ; 144: System.Private.Xml.Linq => 0x739bd4a8 => 127
	i32 1953182387, ; 145: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 146: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 41
	i32 2003115576, ; 147: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 148: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 77
	i32 2045470958, ; 149: System.Private.Xml => 0x79eb68ee => 128
	i32 2055257422, ; 150: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 76
	i32 2066184531, ; 151: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 152: System.Diagnostics.TraceSource => 0x7b6f419e => 105
	i32 2072397586, ; 153: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 48
	i32 2079903147, ; 154: System.Runtime.dll => 0x7bf8cdab => 135
	i32 2090596640, ; 155: System.Numerics.Vectors => 0x7c9bf920 => 124
	i32 2127167465, ; 156: System.Console => 0x7ec9ffe9 => 101
	i32 2142473426, ; 157: System.Collections.Specialized => 0x7fb38cd2 => 95
	i32 2159891885, ; 158: Microsoft.Maui => 0x80bd55ad => 57
	i32 2169148018, ; 159: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 160: Microsoft.Extensions.Options.dll => 0x820d22b3 => 52
	i32 2182790818, ; 161: BisleriumCafe.dll => 0x821abea2 => 92
	i32 2192057212, ; 162: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 51
	i32 2193016926, ; 163: System.ObjectModel.dll => 0x82b6c85e => 125
	i32 2201107256, ; 164: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 91
	i32 2201231467, ; 165: System.Net.Http => 0x8334206b => 115
	i32 2207618523, ; 166: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2222056684, ; 167: System.Threading.Tasks.Parallel => 0x8471e4ec => 148
	i32 2266799131, ; 168: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 42
	i32 2279755925, ; 169: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 84
	i32 2295906218, ; 170: System.Net.Sockets => 0x88d8bfaa => 122
	i32 2303942373, ; 171: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 172: System.Private.CoreLib.dll => 0x896b7878 => 158
	i32 2320631194, ; 173: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 148
	i32 2353062107, ; 174: System.Net.Primitives => 0x8c40e0db => 118
	i32 2354730003, ; 175: Syncfusion.Licensing => 0x8c5a5413 => 62
	i32 2366048013, ; 176: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 177: System.Xml.ReaderWriter.dll => 0x8d24e767 => 154
	i32 2371007202, ; 178: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 41
	i32 2378619854, ; 179: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 137
	i32 2395872292, ; 180: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 181: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2411328690, ; 182: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 37
	i32 2427813419, ; 183: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 184: System.Console.dll => 0x912896e5 => 101
	i32 2442556106, ; 185: Microsoft.JSInterop.dll => 0x919672ca => 54
	i32 2458678730, ; 186: System.Net.Sockets.dll => 0x928c75ca => 122
	i32 2471841756, ; 187: netstandard.dll => 0x93554fdc => 157
	i32 2475788418, ; 188: Java.Interop.dll => 0x93918882 => 159
	i32 2480646305, ; 189: Microsoft.Maui.Controls => 0x93dba8a1 => 55
	i32 2484371297, ; 190: System.Net.ServicePoint => 0x94147f61 => 121
	i32 2498657740, ; 191: BouncyCastle.Cryptography.dll => 0x94ee7dcc => 35
	i32 2503351294, ; 192: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2521700106, ; 193: iTextSharp.LGPLv2.Core.dll => 0x964e170a => 36
	i32 2550873716, ; 194: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 195: System.Text.Encodings.Web => 0x9930ee42 => 144
	i32 2576534780, ; 196: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2585220780, ; 197: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 143
	i32 2589602615, ; 198: System.Threading.ThreadPool => 0x9a5a3337 => 150
	i32 2592341985, ; 199: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 45
	i32 2593496499, ; 200: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 201: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 91
	i32 2617129537, ; 202: System.Private.Xml.dll => 0x9bfe3a41 => 128
	i32 2620871830, ; 203: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 71
	i32 2626831493, ; 204: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 205: System.Runtime.Loader => 0x9ec4cf01 => 132
	i32 2664396074, ; 206: System.Xml.XDocument.dll => 0x9ecf752a => 155
	i32 2665622720, ; 207: System.Drawing.Primitives => 0x9ee22cc0 => 106
	i32 2676780864, ; 208: System.Data.Common.dll => 0x9f8c6f40 => 102
	i32 2692077919, ; 209: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 39
	i32 2724373263, ; 210: System.Runtime.Numerics.dll => 0xa262a30f => 133
	i32 2732626843, ; 211: Xamarin.AndroidX.Activity => 0xa2e0939b => 64
	i32 2735172069, ; 212: System.Threading.Channels => 0xa30769e5 => 147
	i32 2737747696, ; 213: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 66
	i32 2740698338, ; 214: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 215: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 216: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 56
	i32 2764765095, ; 217: Microsoft.Maui.dll => 0xa4caf7a7 => 57
	i32 2765824710, ; 218: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 142
	i32 2778768386, ; 219: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 87
	i32 2785988530, ; 220: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 221: Microsoft.Maui.Graphics => 0xa7008e0b => 59
	i32 2810250172, ; 222: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 69
	i32 2853208004, ; 223: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 87
	i32 2861189240, ; 224: Microsoft.Maui.Essentials => 0xaa8a4878 => 58
	i32 2868557005, ; 225: Syncfusion.Licensing.dll => 0xaafab4cd => 62
	i32 2892341533, ; 226: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 38
	i32 2909740682, ; 227: System.Private.CoreLib => 0xad6f1e8a => 158
	i32 2911054922, ; 228: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 48
	i32 2916838712, ; 229: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 88
	i32 2919462931, ; 230: System.Numerics.Vectors.dll => 0xae037813 => 124
	i32 2959614098, ; 231: System.ComponentModel.dll => 0xb0682092 => 100
	i32 2972252294, ; 232: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 136
	i32 2978675010, ; 233: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 73
	i32 3020527151, ; 234: iTextSharp.LGPLv2.Core => 0xb409962f => 36
	i32 3038032645, ; 235: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 236: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 237: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 80
	i32 3059408633, ; 238: Mono.Android.Runtime => 0xb65adef9 => 160
	i32 3059793426, ; 239: System.ComponentModel.Primitives => 0xb660be12 => 98
	i32 3090735792, ; 240: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 140
	i32 3103600923, ; 241: System.Formats.Asn1 => 0xb8fd311b => 108
	i32 3178803400, ; 242: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 81
	i32 3220365878, ; 243: System.Threading => 0xbff2e236 => 151
	i32 3258312781, ; 244: Xamarin.AndroidX.CardView => 0xc235e84d => 67
	i32 3280506390, ; 245: System.ComponentModel.Annotations.dll => 0xc3888e16 => 97
	i32 3290767353, ; 246: System.Security.Cryptography.Encoding => 0xc4251ff9 => 138
	i32 3305363605, ; 247: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 248: System.Net.Requests.dll => 0xc5b097e4 => 119
	i32 3317135071, ; 249: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 72
	i32 3340387945, ; 250: SkiaSharp => 0xc71a4669 => 60
	i32 3346324047, ; 251: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 82
	i32 3357674450, ; 252: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 253: System.Text.Json => 0xc82afec1 => 145
	i32 3362522851, ; 254: Xamarin.AndroidX.Core => 0xc86c06e3 => 70
	i32 3366347497, ; 255: Java.Interop => 0xc8a662e9 => 159
	i32 3374999561, ; 256: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 84
	i32 3381016424, ; 257: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3395150330, ; 258: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 129
	i32 3406629867, ; 259: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 46
	i32 3428513518, ; 260: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 43
	i32 3430777524, ; 261: netstandard => 0xcc7d82b4 => 157
	i32 3433996769, ; 262: Syncfusion.Pdf.Portable.dll => 0xccaea1e1 => 63
	i32 3458724246, ; 263: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 264: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 99
	i32 3476120550, ; 265: Mono.Android => 0xcf3163e6 => 161
	i32 3484440000, ; 266: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 267: System.Text.Json.dll => 0xcfbaacae => 145
	i32 3500000672, ; 268: Microsoft.JSInterop => 0xd09dc5a0 => 54
	i32 3509114376, ; 269: System.Xml.Linq => 0xd128d608 => 153
	i32 3551972787, ; 270: Syncfusion.Compression.Portable.dll => 0xd3b6cdb3 => 61
	i32 3580758918, ; 271: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 272: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3605570793, ; 273: BouncyCastle.Cryptography => 0xd6e8a4e9 => 35
	i32 3608519521, ; 274: System.Linq.dll => 0xd715a361 => 113
	i32 3641597786, ; 275: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 76
	i32 3643446276, ; 276: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 277: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 81
	i32 3657292374, ; 278: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 42
	i32 3660523487, ; 279: System.Net.NetworkInformation => 0xda2f27df => 117
	i32 3672681054, ; 280: Mono.Android.dll => 0xdae8aa5e => 161
	i32 3716563718, ; 281: System.Runtime.Intrinsics => 0xdd864306 => 131
	i32 3724971120, ; 282: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 80
	i32 3732100267, ; 283: System.Net.NameResolution => 0xde7354ab => 116
	i32 3748608112, ; 284: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 103
	i32 3751619990, ; 285: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3786282454, ; 286: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 68
	i32 3792276235, ; 287: System.Collections.NonGeneric => 0xe2098b0b => 94
	i32 3802395368, ; 288: System.Collections.Specialized.dll => 0xe2a3f2e8 => 95
	i32 3823082795, ; 289: System.Security.Cryptography.dll => 0xe3df9d2b => 141
	i32 3841636137, ; 290: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 44
	i32 3849253459, ; 291: System.Runtime.InteropServices.dll => 0xe56ef253 => 130
	i32 3875112723, ; 292: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 138
	i32 3885497537, ; 293: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 123
	i32 3887849470, ; 294: BisleriumCafe => 0xe7bbdffe => 92
	i32 3896106733, ; 295: System.Collections.Concurrent.dll => 0xe839deed => 93
	i32 3896760992, ; 296: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 70
	i32 3920221145, ; 297: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 298: System.Xml.ReaderWriter => 0xea213423 => 154
	i32 3931092270, ; 299: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 83
	i32 3953953790, ; 300: System.Text.Encoding.CodePages => 0xebac8bfe => 142
	i32 3955647286, ; 301: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 65
	i32 4003436829, ; 302: System.Diagnostics.Process.dll => 0xee9f991d => 104
	i32 4025784931, ; 303: System.Memory => 0xeff49a63 => 114
	i32 4046471985, ; 304: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 56
	i32 4068434129, ; 305: System.Private.Xml.Linq.dll => 0xf27f60d1 => 127
	i32 4073602200, ; 306: System.Threading.dll => 0xf2ce3c98 => 151
	i32 4091086043, ; 307: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 308: Microsoft.Maui.Essentials.dll => 0xf40add04 => 58
	i32 4099507663, ; 309: System.Drawing.dll => 0xf45985cf => 107
	i32 4100113165, ; 310: System.Private.Uri => 0xf462c30d => 126
	i32 4103439459, ; 311: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 312: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 43
	i32 4127667938, ; 313: System.IO.FileSystem.Watcher => 0xf60736e2 => 111
	i32 4150914736, ; 314: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4164802419, ; 315: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 111
	i32 4182413190, ; 316: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 78
	i32 4213026141, ; 317: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 103
	i32 4221941870, ; 318: Syncfusion.Pdf.Portable => 0xfba5b86e => 63
	i32 4249188766, ; 319: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 320: Microsoft.Maui.Controls.dll => 0xfea12dee => 55
	i32 4274976490, ; 321: System.Runtime.Numerics => 0xfecef6ea => 133
	i32 4292120959, ; 322: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 78
	i32 4294648842 ; 323: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 47
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [324 x i32] [
	i32 117, ; 0
	i32 116, ; 1
	i32 131, ; 2
	i32 0, ; 3
	i32 9, ; 4
	i32 149, ; 5
	i32 33, ; 6
	i32 139, ; 7
	i32 59, ; 8
	i32 17, ; 9
	i32 130, ; 10
	i32 147, ; 11
	i32 32, ; 12
	i32 25, ; 13
	i32 123, ; 14
	i32 139, ; 15
	i32 97, ; 16
	i32 68, ; 17
	i32 86, ; 18
	i32 100, ; 19
	i32 37, ; 20
	i32 30, ; 21
	i32 64, ; 22
	i32 8, ; 23
	i32 75, ; 24
	i32 121, ; 25
	i32 149, ; 26
	i32 114, ; 27
	i32 150, ; 28
	i32 34, ; 29
	i32 28, ; 30
	i32 96, ; 31
	i32 74, ; 32
	i32 140, ; 33
	i32 152, ; 34
	i32 156, ; 35
	i32 6, ; 36
	i32 125, ; 37
	i32 53, ; 38
	i32 60, ; 39
	i32 27, ; 40
	i32 50, ; 41
	i32 47, ; 42
	i32 136, ; 43
	i32 72, ; 44
	i32 19, ; 45
	i32 144, ; 46
	i32 93, ; 47
	i32 120, ; 48
	i32 153, ; 49
	i32 132, ; 50
	i32 119, ; 51
	i32 110, ; 52
	i32 25, ; 53
	i32 52, ; 54
	i32 40, ; 55
	i32 102, ; 56
	i32 126, ; 57
	i32 109, ; 58
	i32 10, ; 59
	i32 24, ; 60
	i32 98, ; 61
	i32 21, ; 62
	i32 14, ; 63
	i32 75, ; 64
	i32 155, ; 65
	i32 23, ; 66
	i32 96, ; 67
	i32 49, ; 68
	i32 85, ; 69
	i32 107, ; 70
	i32 44, ; 71
	i32 65, ; 72
	i32 106, ; 73
	i32 4, ; 74
	i32 112, ; 75
	i32 77, ; 76
	i32 99, ; 77
	i32 90, ; 78
	i32 156, ; 79
	i32 26, ; 80
	i32 20, ; 81
	i32 16, ; 82
	i32 22, ; 83
	i32 45, ; 84
	i32 82, ; 85
	i32 104, ; 86
	i32 2, ; 87
	i32 61, ; 88
	i32 73, ; 89
	i32 11, ; 90
	i32 113, ; 91
	i32 31, ; 92
	i32 32, ; 93
	i32 85, ; 94
	i32 69, ; 95
	i32 134, ; 96
	i32 129, ; 97
	i32 0, ; 98
	i32 108, ; 99
	i32 46, ; 100
	i32 120, ; 101
	i32 6, ; 102
	i32 110, ; 103
	i32 66, ; 104
	i32 53, ; 105
	i32 109, ; 106
	i32 49, ; 107
	i32 30, ; 108
	i32 146, ; 109
	i32 40, ; 110
	i32 79, ; 111
	i32 88, ; 112
	i32 71, ; 113
	i32 115, ; 114
	i32 146, ; 115
	i32 39, ; 116
	i32 135, ; 117
	i32 89, ; 118
	i32 118, ; 119
	i32 141, ; 120
	i32 137, ; 121
	i32 67, ; 122
	i32 1, ; 123
	i32 38, ; 124
	i32 105, ; 125
	i32 86, ; 126
	i32 50, ; 127
	i32 160, ; 128
	i32 17, ; 129
	i32 74, ; 130
	i32 9, ; 131
	i32 79, ; 132
	i32 90, ; 133
	i32 89, ; 134
	i32 83, ; 135
	i32 143, ; 136
	i32 134, ; 137
	i32 51, ; 138
	i32 26, ; 139
	i32 112, ; 140
	i32 8, ; 141
	i32 2, ; 142
	i32 94, ; 143
	i32 127, ; 144
	i32 13, ; 145
	i32 41, ; 146
	i32 5, ; 147
	i32 77, ; 148
	i32 128, ; 149
	i32 76, ; 150
	i32 4, ; 151
	i32 105, ; 152
	i32 48, ; 153
	i32 135, ; 154
	i32 124, ; 155
	i32 101, ; 156
	i32 95, ; 157
	i32 57, ; 158
	i32 12, ; 159
	i32 52, ; 160
	i32 92, ; 161
	i32 51, ; 162
	i32 125, ; 163
	i32 91, ; 164
	i32 115, ; 165
	i32 14, ; 166
	i32 148, ; 167
	i32 42, ; 168
	i32 84, ; 169
	i32 122, ; 170
	i32 18, ; 171
	i32 158, ; 172
	i32 148, ; 173
	i32 118, ; 174
	i32 62, ; 175
	i32 12, ; 176
	i32 154, ; 177
	i32 41, ; 178
	i32 137, ; 179
	i32 13, ; 180
	i32 152, ; 181
	i32 37, ; 182
	i32 10, ; 183
	i32 101, ; 184
	i32 54, ; 185
	i32 122, ; 186
	i32 157, ; 187
	i32 159, ; 188
	i32 55, ; 189
	i32 121, ; 190
	i32 35, ; 191
	i32 16, ; 192
	i32 36, ; 193
	i32 11, ; 194
	i32 144, ; 195
	i32 15, ; 196
	i32 143, ; 197
	i32 150, ; 198
	i32 45, ; 199
	i32 20, ; 200
	i32 91, ; 201
	i32 128, ; 202
	i32 71, ; 203
	i32 15, ; 204
	i32 132, ; 205
	i32 155, ; 206
	i32 106, ; 207
	i32 102, ; 208
	i32 39, ; 209
	i32 133, ; 210
	i32 64, ; 211
	i32 147, ; 212
	i32 66, ; 213
	i32 1, ; 214
	i32 21, ; 215
	i32 56, ; 216
	i32 57, ; 217
	i32 142, ; 218
	i32 87, ; 219
	i32 27, ; 220
	i32 59, ; 221
	i32 69, ; 222
	i32 87, ; 223
	i32 58, ; 224
	i32 62, ; 225
	i32 38, ; 226
	i32 158, ; 227
	i32 48, ; 228
	i32 88, ; 229
	i32 124, ; 230
	i32 100, ; 231
	i32 136, ; 232
	i32 73, ; 233
	i32 36, ; 234
	i32 34, ; 235
	i32 7, ; 236
	i32 80, ; 237
	i32 160, ; 238
	i32 98, ; 239
	i32 140, ; 240
	i32 108, ; 241
	i32 81, ; 242
	i32 151, ; 243
	i32 67, ; 244
	i32 97, ; 245
	i32 138, ; 246
	i32 7, ; 247
	i32 119, ; 248
	i32 72, ; 249
	i32 60, ; 250
	i32 82, ; 251
	i32 24, ; 252
	i32 145, ; 253
	i32 70, ; 254
	i32 159, ; 255
	i32 84, ; 256
	i32 3, ; 257
	i32 129, ; 258
	i32 46, ; 259
	i32 43, ; 260
	i32 157, ; 261
	i32 63, ; 262
	i32 22, ; 263
	i32 99, ; 264
	i32 161, ; 265
	i32 23, ; 266
	i32 145, ; 267
	i32 54, ; 268
	i32 153, ; 269
	i32 61, ; 270
	i32 31, ; 271
	i32 33, ; 272
	i32 35, ; 273
	i32 113, ; 274
	i32 76, ; 275
	i32 28, ; 276
	i32 81, ; 277
	i32 42, ; 278
	i32 117, ; 279
	i32 161, ; 280
	i32 131, ; 281
	i32 80, ; 282
	i32 116, ; 283
	i32 103, ; 284
	i32 3, ; 285
	i32 68, ; 286
	i32 94, ; 287
	i32 95, ; 288
	i32 141, ; 289
	i32 44, ; 290
	i32 130, ; 291
	i32 138, ; 292
	i32 123, ; 293
	i32 92, ; 294
	i32 93, ; 295
	i32 70, ; 296
	i32 19, ; 297
	i32 154, ; 298
	i32 83, ; 299
	i32 142, ; 300
	i32 65, ; 301
	i32 104, ; 302
	i32 114, ; 303
	i32 56, ; 304
	i32 127, ; 305
	i32 151, ; 306
	i32 5, ; 307
	i32 58, ; 308
	i32 107, ; 309
	i32 126, ; 310
	i32 29, ; 311
	i32 43, ; 312
	i32 111, ; 313
	i32 29, ; 314
	i32 111, ; 315
	i32 78, ; 316
	i32 103, ; 317
	i32 63, ; 318
	i32 18, ; 319
	i32 55, ; 320
	i32 133, ; 321
	i32 78, ; 322
	i32 47 ; 323
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}

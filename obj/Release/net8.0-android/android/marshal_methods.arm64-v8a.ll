; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [162 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [324 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 53
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 161
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 58
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 112
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 68
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 85
	i64 683390398661839228, ; 6: Microsoft.Extensions.FileProviders.Embedded => 0x97be3f26326c97c => 47
	i64 750875890346172408, ; 7: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 149
	i64 799765834175365804, ; 8: System.ComponentModel.dll => 0xb1956c9f18442ac => 100
	i64 805302231655005164, ; 9: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 12
	i64 872800313462103108, ; 10: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 73
	i64 1120440138749646132, ; 11: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 89
	i64 1268860745194512059, ; 12: System.Drawing.dll => 0x119be62002c19ebb => 107
	i64 1369545283391376210, ; 13: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 81
	i64 1404195534211153682, ; 14: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 111
	i64 1476839205573959279, ; 15: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 118
	i64 1486715745332614827, ; 16: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 55
	i64 1513467482682125403, ; 17: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 160
	i64 1537168428375924959, ; 18: System.Threading.Thread.dll => 0x15551e8a954ae0df => 149
	i64 1624659445732251991, ; 19: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 66
	i64 1628611045998245443, ; 20: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 78
	i64 1743969030606105336, ; 21: System.Memory.dll => 0x1833d297e88f2af8 => 114
	i64 1767386781656293639, ; 22: System.Private.Uri.dll => 0x188704e9f5582107 => 126
	i64 1776954265264967804, ; 23: Microsoft.JSInterop.dll => 0x18a9027d533bd07c => 54
	i64 1795316252682057001, ; 24: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 65
	i64 1835311033149317475, ; 25: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 26: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 85
	i64 1875417405349196092, ; 27: System.Drawing.Primitives => 0x1a06d2319b6c713c => 106
	i64 1881198190668717030, ; 28: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 29: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 56
	i64 1972385128188460614, ; 30: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 136
	i64 1981742497975770890, ; 31: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 77
	i64 2102659300918482391, ; 32: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 106
	i64 2262844636196693701, ; 33: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 73
	i64 2287834202362508563, ; 34: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 93
	i64 2295368378960711535, ; 35: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x1fdac961189e0f6f => 40
	i64 2329709569556905518, ; 36: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 76
	i64 2335503487726329082, ; 37: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 144
	i64 2337758774805907496, ; 38: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 129
	i64 2470498323731680442, ; 39: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 69
	i64 2497223385847772520, ; 40: System.Runtime => 0x22a7eb7046413568 => 135
	i64 2547086958574651984, ; 41: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 64
	i64 2602673633151553063, ; 42: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2632269733008246987, ; 43: System.Net.NameResolution => 0x2487b36034f808cb => 116
	i64 2656907746661064104, ; 44: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 43
	i64 2662981627730767622, ; 45: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2781169761569919449, ; 46: Microsoft.JSInterop => 0x2698b329b26ed1d9 => 54
	i64 2783046991838674048, ; 47: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 129
	i64 2792037999184824868, ; 48: iTextSharp.LGPLv2.Core => 0x26bf4fc474cdca24 => 36
	i64 2895129759130297543, ; 49: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 50: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 89
	i64 3110390492489056344, ; 51: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 137
	i64 3289520064315143713, ; 52: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 75
	i64 3311221304742556517, ; 53: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 124
	i64 3325875462027654285, ; 54: System.Runtime.Numerics => 0x2e27e21c8958b48d => 133
	i64 3328853167529574890, ; 55: System.Net.Sockets.dll => 0x2e327651a008c1ea => 122
	i64 3344514922410554693, ; 56: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 91
	i64 3396143930648122816, ; 57: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 45
	i64 3429672777697402584, ; 58: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 58
	i64 3494946837667399002, ; 59: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 41
	i64 3522470458906976663, ; 60: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 86
	i64 3551103847008531295, ; 61: System.Private.CoreLib.dll => 0x31480e226177735f => 158
	i64 3567343442040498961, ; 62: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 63: System.Runtime.dll => 0x319037675df7e556 => 135
	i64 3638003163729360188, ; 64: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 42
	i64 3647754201059316852, ; 65: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 154
	i64 3655542548057982301, ; 66: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 41
	i64 3716579019761409177, ; 67: netstandard.dll => 0x3393f0ed5c8c5c99 => 157
	i64 3727469159507183293, ; 68: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 84
	i64 3753897248517198740, ; 69: Microsoft.AspNetCore.Components.WebView.dll => 0x341885a8952f1394 => 39
	i64 3869221888984012293, ; 70: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 50
	i64 3889433610606858880, ; 71: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 48
	i64 3890352374528606784, ; 72: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 56
	i64 3919223565570527920, ; 73: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 138
	i64 3933965368022646939, ; 74: System.Net.Requests => 0x369840a8bfadc09b => 119
	i64 3966267475168208030, ; 75: System.Memory => 0x370b03412596249e => 114
	i64 4070326265757318011, ; 76: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 3
	i64 4073500526318903918, ; 77: System.Private.Xml.dll => 0x3887fb25779ae26e => 128
	i64 4120493066591692148, ; 78: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 79: System.ComponentModel => 0x39a7562737acb67e => 100
	i64 4167269041631776580, ; 80: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 150
	i64 4187479170553454871, ; 81: System.Linq.Expressions => 0x3a1cea1e912fa117 => 112
	i64 4205801962323029395, ; 82: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 99
	i64 4360412976914417659, ; 83: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 28
	i64 4477672992252076438, ; 84: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4672453897036726049, ; 85: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 111
	i64 4743821336939966868, ; 86: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 97
	i64 4794310189461587505, ; 87: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 64
	i64 4795410492532947900, ; 88: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 86
	i64 4809057822547766521, ; 89: System.Drawing => 0x42bd349c3145ecf9 => 107
	i64 4814660307502931973, ; 90: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 116
	i64 4853321196694829351, ; 91: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 132
	i64 4871824391508510238, ; 92: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 18
	i64 4953714692329509532, ; 93: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 26
	i64 5103417709280584325, ; 94: System.Collections.Specialized => 0x46d2fb5e161b6285 => 95
	i64 5182934613077526976, ; 95: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 95
	i64 5197073077358930460, ; 96: Microsoft.AspNetCore.Components.Web.dll => 0x481fb66db7b9aa1c => 38
	i64 5290786973231294105, ; 97: System.Runtime.Loader => 0x496ca6b869b72699 => 132
	i64 5471532531798518949, ; 98: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 99: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 100: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 109
	i64 5573260873512690141, ; 101: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 141
	i64 5650097808083101034, ; 102: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 136
	i64 5692067934154308417, ; 103: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 88
	i64 5705946365327413316, ; 104: iTextSharp.LGPLv2.Core.dll => 0x4f2f97fce4c59044 => 36
	i64 5979151488806146654, ; 105: System.Formats.Asn1 => 0x52fa3699a489d25e => 108
	i64 5984759512290286505, ; 106: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 139
	i64 6200764641006662125, ; 107: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 108: System.Text.Json.dll => 0x565a67a0ffe264a7 => 145
	i64 6300676701234028427, ; 109: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 6
	i64 6306071992961573649, ; 110: BisleriumCafe => 0x5783ab110c83a311 => 92
	i64 6357457916754632952, ; 111: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 112: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 76
	i64 6471714727257221498, ; 113: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 7
	i64 6478287442656530074, ; 114: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 115: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 72
	i64 6560151584539558821, ; 116: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 52
	i64 6617685658146568858, ; 117: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 142
	i64 6671798237668743565, ; 118: SkiaSharp => 0x5c96fd260152998d => 60
	i64 6743165466166707109, ; 119: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6786606130239981554, ; 120: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 105
	i64 6814185388980153342, ; 121: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 155
	i64 6876862101832370452, ; 122: System.Xml.Linq => 0x5f6f85a57d108914 => 153
	i64 6894844156784520562, ; 123: System.Numerics.Vectors => 0x5faf683aead1ad72 => 124
	i64 6920570528939222495, ; 124: Microsoft.AspNetCore.Components.WebView => 0x600ace3ab475a5df => 39
	i64 7060896174307865760, ; 125: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 148
	i64 7083547580668757502, ; 126: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 127
	i64 7270811800166795866, ; 127: System.Linq => 0x64e71ccf51a90a5a => 113
	i64 7377312882064240630, ; 128: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 99
	i64 7488575175965059935, ; 129: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 153
	i64 7489048572193775167, ; 130: System.ObjectModel => 0x67ee71ff6b419e3f => 125
	i64 7592577537120840276, ; 131: System.Diagnostics.Process => 0x695e410af5b2aa54 => 104
	i64 7654504624184590948, ; 132: System.Net.Http => 0x6a3a4366801b8264 => 115
	i64 7714652370974252055, ; 133: System.Private.CoreLib => 0x6b0ff375198b9c17 => 158
	i64 7735352534559001595, ; 134: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 90
	i64 7742555799473854801, ; 135: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 14
	i64 7836164640616011524, ; 136: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 66
	i64 7975724199463739455, ; 137: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 25
	i64 8031450141206250471, ; 138: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 131
	i64 8064050204834738623, ; 139: System.Collections.dll => 0x6fe942efa61731bf => 96
	i64 8083354569033831015, ; 140: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 75
	i64 8087206902342787202, ; 141: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 103
	i64 8108129031893776750, ; 142: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 16
	i64 8167236081217502503, ; 143: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 159
	i64 8185542183669246576, ; 144: System.Collections => 0x7198e33f4794aa70 => 96
	i64 8246048515196606205, ; 145: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 59
	i64 8264926008854159966, ; 146: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 104
	i64 8368701292315763008, ; 147: System.Security.Cryptography => 0x7423997c6fd56140 => 141
	i64 8386351099740279196, ; 148: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 31
	i64 8400357532724379117, ; 149: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 83
	i64 8563666267364444763, ; 150: System.Private.Uri => 0x76d841191140ca5b => 126
	i64 8626175481042262068, ; 151: Java.Interop => 0x77b654e585b55834 => 159
	i64 8639588376636138208, ; 152: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 82
	i64 8677882282824630478, ; 153: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 154: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 103
	i64 8941376889969657626, ; 155: System.Xml.XDocument => 0x7c1626e87187471a => 155
	i64 9045785047181495996, ; 156: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9138683372487561558, ; 157: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 137
	i64 9286073997824813334, ; 158: BouncyCastle.Cryptography => 0x80dec319ee56e916 => 35
	i64 9312692141327339315, ; 159: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 88
	i64 9324707631942237306, ; 160: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 65
	i64 9363564275759486853, ; 161: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 5
	i64 9551379474083066910, ; 162: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 29
	i64 9659729154652888475, ; 163: System.Text.RegularExpressions => 0x860e407c9991dd9b => 146
	i64 9678050649315576968, ; 164: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 69
	i64 9702891218465930390, ; 165: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 94
	i64 9773637193738963987, ; 166: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 1
	i64 9808709177481450983, ; 167: Mono.Android.dll => 0x881f890734e555e7 => 161
	i64 9956195530459977388, ; 168: Microsoft.Maui => 0x8a2b8315b36616ac => 57
	i64 10038780035334861115, ; 169: System.Net.Http.dll => 0x8b50e941206af13b => 115
	i64 10051358222726253779, ; 170: System.Private.Xml => 0x8b7d990c97ccccd3 => 128
	i64 10092835686693276772, ; 171: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 55
	i64 10105485790837105934, ; 172: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 148
	i64 10143853363526200146, ; 173: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10209869394718195525, ; 174: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 19
	i64 10229024438826829339, ; 175: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 72
	i64 10236703004850800690, ; 176: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 121
	i64 10406448008575299332, ; 177: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 91
	i64 10430153318873392755, ; 178: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 70
	i64 10506226065143327199, ; 179: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10734191584620811116, ; 180: Microsoft.Extensions.FileProviders.Embedded.dll => 0x94f7825fc04f936c => 47
	i64 10761706286639228993, ; 181: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 33
	i64 10785150219063592792, ; 182: System.Net.Primitives => 0x95ac8cfb68830758 => 118
	i64 11002576679268595294, ; 183: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 51
	i64 11009005086950030778, ; 184: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 57
	i64 11039430466289874041, ; 185: BisleriumCafe.dll => 0x9933ef8509d53479 => 92
	i64 11051904132540108364, ; 186: Microsoft.Extensions.FileProviders.Composite.dll => 0x99604040c7b98e4c => 46
	i64 11103970607964515343, ; 187: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11156122287428000958, ; 188: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 27
	i64 11157797727133427779, ; 189: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 8
	i64 11162124722117608902, ; 190: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 87
	i64 11218356222449480316, ; 191: Microsoft.AspNetCore.Components => 0x9baf9b8c02e4f27c => 37
	i64 11220793807500858938, ; 192: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 193: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 52
	i64 11340910727871153756, ; 194: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 71
	i64 11485890710487134646, ; 195: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 130
	i64 11518296021396496455, ; 196: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 197: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 87
	i64 11530571088791430846, ; 198: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 50
	i64 11597940890313164233, ; 199: netstandard => 0xa0f429ca8d1805c9 => 157
	i64 11855031688536399763, ; 200: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 30
	i64 12040886584167504988, ; 201: System.Net.ServicePoint => 0xa719d28d8e121c5c => 121
	i64 12048689113179125827, ; 202: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 48
	i64 12058074296353848905, ; 203: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 49
	i64 12145679461940342714, ; 204: System.Text.Json => 0xa88e1f1ebcb62fba => 145
	i64 12451044538927396471, ; 205: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 74
	i64 12466513435562512481, ; 206: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 79
	i64 12475113361194491050, ; 207: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 208: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 105
	i64 12538491095302438457, ; 209: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 67
	i64 12550732019250633519, ; 210: System.IO.Compression => 0xae2d28465e8e1b2f => 110
	i64 12700543734426720211, ; 211: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 68
	i64 12708922737231849740, ; 212: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 143
	i64 12843321153144804894, ; 213: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 53
	i64 12859557719246324186, ; 214: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 123
	i64 12989346753972519995, ; 215: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 0
	i64 13003699287675270979, ; 216: Microsoft.AspNetCore.Components.WebView.Maui => 0xb4766b9b07e27743 => 40
	i64 13005833372463390146, ; 217: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 21
	i64 13068258254871114833, ; 218: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 134
	i64 13297997883559027856, ; 219: Syncfusion.Compression.Portable => 0xb88bfa9e896ea490 => 61
	i64 13343850469010654401, ; 220: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 160
	i64 13381594904270902445, ; 221: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 222: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 90
	i64 13540124433173649601, ; 223: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13550417756503177631, ; 224: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 45
	i64 13572454107664307259, ; 225: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 84
	i64 13717397318615465333, ; 226: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 98
	i64 13881769479078963060, ; 227: System.Console.dll => 0xc0a5f3cade5c6774 => 101
	i64 13959074834287824816, ; 228: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 74
	i64 13970307180132182141, ; 229: Syncfusion.Licensing => 0xc1e0805ccade287d => 62
	i64 14124974489674258913, ; 230: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 67
	i64 14125464355221830302, ; 231: System.Threading.dll => 0xc407bafdbc707a9e => 151
	i64 14254574811015963973, ; 232: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 143
	i64 14327709162229390963, ; 233: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 140
	i64 14349907877893689639, ; 234: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 23
	i64 14461014870687870182, ; 235: System.Net.Requests.dll => 0xc8afd8683afdece6 => 119
	i64 14464374589798375073, ; 236: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14491877563792607819, ; 237: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 32
	i64 14538127318538747197, ; 238: Syncfusion.Licensing.dll => 0xc9c1cdc518e77d3d => 62
	i64 14551742072151931844, ; 239: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 144
	i64 14561513370130550166, ; 240: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 139
	i64 14610046442689856844, ; 241: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 2
	i64 14622043554576106986, ; 242: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 134
	i64 14669215534098758659, ; 243: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 43
	i64 14690985099581930927, ; 244: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 245: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14735017007120366644, ; 246: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 15
	i64 14744092281598614090, ; 247: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14748851336349168659, ; 248: Syncfusion.Pdf.Portable.dll => 0xccae7225cc233413 => 63
	i64 14852515768018889994, ; 249: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 71
	i64 14904040806490515477, ; 250: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14935719434541007538, ; 251: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 142
	i64 14954917835170835695, ; 252: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 44
	i64 14984936317414011727, ; 253: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 123
	i64 14987728460634540364, ; 254: System.IO.Compression.dll => 0xcfff1ba06622494c => 110
	i64 15015154896917945444, ; 255: System.Net.Security.dll => 0xd0608bd33642dc64 => 120
	i64 15076659072870671916, ; 256: System.ObjectModel.dll => 0xd13b0d8c1620662c => 125
	i64 15111608613780139878, ; 257: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 258: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 109
	i64 15133485256822086103, ; 259: System.Linq.dll => 0xd204f0a9127dd9d7 => 113
	i64 15203009853192377507, ; 260: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 22
	i64 15227001540531775957, ; 261: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 42
	i64 15370334346939861994, ; 262: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 70
	i64 15391712275433856905, ; 263: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 44
	i64 15427448221306938193, ; 264: Microsoft.AspNetCore.Components.Web => 0xd6194e6b4dbb6351 => 38
	i64 15481710163200268842, ; 265: Microsoft.Extensions.FileProviders.Composite => 0xd6da155e291b5a2a => 46
	i64 15527772828719725935, ; 266: System.Console => 0xd77dbb1e38cd3d6f => 101
	i64 15536481058354060254, ; 267: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15541854775306130054, ; 268: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 140
	i64 15557562860424774966, ; 269: System.Net.Sockets => 0xd7e790fe7a6dc536 => 122
	i64 15582737692548360875, ; 270: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 78
	i64 15609085926864131306, ; 271: System.dll => 0xd89e9cf3334914ea => 156
	i64 15620612276725577442, ; 272: BouncyCastle.Cryptography.dll => 0xd8c7901aa85576e2 => 35
	i64 15661133872274321916, ; 273: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 154
	i64 15783653065526199428, ; 274: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15847085070278954535, ; 275: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 147
	i64 16018552496348375205, ; 276: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 117
	i64 16056281320585338352, ; 277: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 24
	i64 16154507427712707110, ; 278: System => 0xe03056ea4e39aa26 => 156
	i64 16219561732052121626, ; 279: System.Net.Security => 0xe1177575db7c781a => 120
	i64 16288847719894691167, ; 280: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 281: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 51
	i64 16324796876805858114, ; 282: SkiaSharp.dll => 0xe28d5444586b6342 => 60
	i64 16454459195343277943, ; 283: System.Net.NetworkInformation => 0xe459fb756d988f77 => 117
	i64 16527749710595459278, ; 284: Syncfusion.Compression.Portable.dll => 0xe55e5ccb449b88ce => 61
	i64 16649148416072044166, ; 285: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 59
	i64 16677317093839702854, ; 286: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 83
	i64 16737807731308835127, ; 287: System.Runtime.Intrinsics => 0xe848a3736f733137 => 131
	i64 16803648858859583026, ; 288: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 17
	i64 16856067890322379635, ; 289: System.Data.Common.dll => 0xe9ecc87060889373 => 102
	i64 16890310621557459193, ; 290: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 146
	i64 16942731696432749159, ; 291: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16955506688107500054, ; 292: Syncfusion.Pdf.Portable => 0xeb4e0f7fab685216 => 63
	i64 16998075588627545693, ; 293: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 81
	i64 17008137082415910100, ; 294: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 94
	i64 17031351772568316411, ; 295: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 80
	i64 17062143951396181894, ; 296: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 98
	i64 17079998892748052666, ; 297: Microsoft.AspNetCore.Components.dll => 0xed08587fce5018ba => 37
	i64 17118171214553292978, ; 298: System.Threading.Channels => 0xed8ff6060fc420b2 => 147
	i64 17187273293601214786, ; 299: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 97
	i64 17202182880784296190, ; 300: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 138
	i64 17203614576212522419, ; 301: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 20
	i64 17205988430934219272, ; 302: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 49
	i64 17230721278011714856, ; 303: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 127
	i64 17260702271250283638, ; 304: System.Data.Common => 0xef8a5543bba6bc76 => 102
	i64 17310278548634113468, ; 305: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 10
	i64 17342750010158924305, ; 306: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17514990004910432069, ; 307: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 308: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17704177640604968747, ; 309: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 79
	i64 17710060891934109755, ; 310: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 77
	i64 17712670374920797664, ; 311: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 130
	i64 17777860260071588075, ; 312: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 133
	i64 17827813215687577648, ; 313: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 11
	i64 17942426894774770628, ; 314: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 4
	i64 18025913125965088385, ; 315: System.Threading => 0xfa28e87b91334681 => 151
	i64 18121036031235206392, ; 316: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 80
	i64 18146411883821974900, ; 317: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 108
	i64 18225059387460068507, ; 318: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 150
	i64 18245806341561545090, ; 319: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 93
	i64 18305135509493619199, ; 320: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 82
	i64 18324163916253801303, ; 321: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18342408478508122430, ; 322: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 13
	i64 18358161419737137786 ; 323: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 9
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [324 x i32] [
	i32 53, ; 0
	i32 161, ; 1
	i32 58, ; 2
	i32 112, ; 3
	i32 68, ; 4
	i32 85, ; 5
	i32 47, ; 6
	i32 149, ; 7
	i32 100, ; 8
	i32 12, ; 9
	i32 73, ; 10
	i32 89, ; 11
	i32 107, ; 12
	i32 81, ; 13
	i32 111, ; 14
	i32 118, ; 15
	i32 55, ; 16
	i32 160, ; 17
	i32 149, ; 18
	i32 66, ; 19
	i32 78, ; 20
	i32 114, ; 21
	i32 126, ; 22
	i32 54, ; 23
	i32 65, ; 24
	i32 6, ; 25
	i32 85, ; 26
	i32 106, ; 27
	i32 28, ; 28
	i32 56, ; 29
	i32 136, ; 30
	i32 77, ; 31
	i32 106, ; 32
	i32 73, ; 33
	i32 93, ; 34
	i32 40, ; 35
	i32 76, ; 36
	i32 144, ; 37
	i32 129, ; 38
	i32 69, ; 39
	i32 135, ; 40
	i32 64, ; 41
	i32 27, ; 42
	i32 116, ; 43
	i32 43, ; 44
	i32 2, ; 45
	i32 54, ; 46
	i32 129, ; 47
	i32 36, ; 48
	i32 7, ; 49
	i32 89, ; 50
	i32 137, ; 51
	i32 75, ; 52
	i32 124, ; 53
	i32 133, ; 54
	i32 122, ; 55
	i32 91, ; 56
	i32 45, ; 57
	i32 58, ; 58
	i32 41, ; 59
	i32 86, ; 60
	i32 158, ; 61
	i32 22, ; 62
	i32 135, ; 63
	i32 42, ; 64
	i32 154, ; 65
	i32 41, ; 66
	i32 157, ; 67
	i32 84, ; 68
	i32 39, ; 69
	i32 50, ; 70
	i32 48, ; 71
	i32 56, ; 72
	i32 138, ; 73
	i32 119, ; 74
	i32 114, ; 75
	i32 3, ; 76
	i32 128, ; 77
	i32 33, ; 78
	i32 100, ; 79
	i32 150, ; 80
	i32 112, ; 81
	i32 99, ; 82
	i32 28, ; 83
	i32 152, ; 84
	i32 111, ; 85
	i32 97, ; 86
	i32 64, ; 87
	i32 86, ; 88
	i32 107, ; 89
	i32 116, ; 90
	i32 132, ; 91
	i32 18, ; 92
	i32 26, ; 93
	i32 95, ; 94
	i32 95, ; 95
	i32 38, ; 96
	i32 132, ; 97
	i32 26, ; 98
	i32 29, ; 99
	i32 109, ; 100
	i32 141, ; 101
	i32 136, ; 102
	i32 88, ; 103
	i32 36, ; 104
	i32 108, ; 105
	i32 139, ; 106
	i32 23, ; 107
	i32 145, ; 108
	i32 6, ; 109
	i32 92, ; 110
	i32 34, ; 111
	i32 76, ; 112
	i32 7, ; 113
	i32 11, ; 114
	i32 72, ; 115
	i32 52, ; 116
	i32 142, ; 117
	i32 60, ; 118
	i32 19, ; 119
	i32 105, ; 120
	i32 155, ; 121
	i32 153, ; 122
	i32 124, ; 123
	i32 39, ; 124
	i32 148, ; 125
	i32 127, ; 126
	i32 113, ; 127
	i32 99, ; 128
	i32 153, ; 129
	i32 125, ; 130
	i32 104, ; 131
	i32 115, ; 132
	i32 158, ; 133
	i32 90, ; 134
	i32 14, ; 135
	i32 66, ; 136
	i32 25, ; 137
	i32 131, ; 138
	i32 96, ; 139
	i32 75, ; 140
	i32 103, ; 141
	i32 16, ; 142
	i32 159, ; 143
	i32 96, ; 144
	i32 59, ; 145
	i32 104, ; 146
	i32 141, ; 147
	i32 31, ; 148
	i32 83, ; 149
	i32 126, ; 150
	i32 159, ; 151
	i32 82, ; 152
	i32 21, ; 153
	i32 103, ; 154
	i32 155, ; 155
	i32 31, ; 156
	i32 137, ; 157
	i32 35, ; 158
	i32 88, ; 159
	i32 65, ; 160
	i32 5, ; 161
	i32 29, ; 162
	i32 146, ; 163
	i32 69, ; 164
	i32 94, ; 165
	i32 1, ; 166
	i32 161, ; 167
	i32 57, ; 168
	i32 115, ; 169
	i32 128, ; 170
	i32 55, ; 171
	i32 148, ; 172
	i32 3, ; 173
	i32 19, ; 174
	i32 72, ; 175
	i32 121, ; 176
	i32 91, ; 177
	i32 70, ; 178
	i32 1, ; 179
	i32 47, ; 180
	i32 33, ; 181
	i32 118, ; 182
	i32 51, ; 183
	i32 57, ; 184
	i32 92, ; 185
	i32 46, ; 186
	i32 12, ; 187
	i32 27, ; 188
	i32 8, ; 189
	i32 87, ; 190
	i32 37, ; 191
	i32 15, ; 192
	i32 52, ; 193
	i32 71, ; 194
	i32 130, ; 195
	i32 13, ; 196
	i32 87, ; 197
	i32 50, ; 198
	i32 157, ; 199
	i32 30, ; 200
	i32 121, ; 201
	i32 48, ; 202
	i32 49, ; 203
	i32 145, ; 204
	i32 74, ; 205
	i32 79, ; 206
	i32 34, ; 207
	i32 105, ; 208
	i32 67, ; 209
	i32 110, ; 210
	i32 68, ; 211
	i32 143, ; 212
	i32 53, ; 213
	i32 123, ; 214
	i32 0, ; 215
	i32 40, ; 216
	i32 21, ; 217
	i32 134, ; 218
	i32 61, ; 219
	i32 160, ; 220
	i32 9, ; 221
	i32 90, ; 222
	i32 30, ; 223
	i32 45, ; 224
	i32 84, ; 225
	i32 98, ; 226
	i32 101, ; 227
	i32 74, ; 228
	i32 62, ; 229
	i32 67, ; 230
	i32 151, ; 231
	i32 143, ; 232
	i32 140, ; 233
	i32 23, ; 234
	i32 119, ; 235
	i32 24, ; 236
	i32 32, ; 237
	i32 62, ; 238
	i32 144, ; 239
	i32 139, ; 240
	i32 2, ; 241
	i32 134, ; 242
	i32 43, ; 243
	i32 152, ; 244
	i32 16, ; 245
	i32 15, ; 246
	i32 32, ; 247
	i32 63, ; 248
	i32 71, ; 249
	i32 0, ; 250
	i32 142, ; 251
	i32 44, ; 252
	i32 123, ; 253
	i32 110, ; 254
	i32 120, ; 255
	i32 125, ; 256
	i32 17, ; 257
	i32 109, ; 258
	i32 113, ; 259
	i32 22, ; 260
	i32 42, ; 261
	i32 70, ; 262
	i32 44, ; 263
	i32 38, ; 264
	i32 46, ; 265
	i32 101, ; 266
	i32 4, ; 267
	i32 140, ; 268
	i32 122, ; 269
	i32 78, ; 270
	i32 156, ; 271
	i32 35, ; 272
	i32 154, ; 273
	i32 5, ; 274
	i32 147, ; 275
	i32 117, ; 276
	i32 24, ; 277
	i32 156, ; 278
	i32 120, ; 279
	i32 18, ; 280
	i32 51, ; 281
	i32 60, ; 282
	i32 117, ; 283
	i32 61, ; 284
	i32 59, ; 285
	i32 83, ; 286
	i32 131, ; 287
	i32 17, ; 288
	i32 102, ; 289
	i32 146, ; 290
	i32 25, ; 291
	i32 63, ; 292
	i32 81, ; 293
	i32 94, ; 294
	i32 80, ; 295
	i32 98, ; 296
	i32 37, ; 297
	i32 147, ; 298
	i32 97, ; 299
	i32 138, ; 300
	i32 20, ; 301
	i32 49, ; 302
	i32 127, ; 303
	i32 102, ; 304
	i32 10, ; 305
	i32 10, ; 306
	i32 8, ; 307
	i32 20, ; 308
	i32 79, ; 309
	i32 77, ; 310
	i32 130, ; 311
	i32 133, ; 312
	i32 11, ; 313
	i32 4, ; 314
	i32 151, ; 315
	i32 80, ; 316
	i32 108, ; 317
	i32 150, ; 318
	i32 93, ; 319
	i32 82, ; 320
	i32 14, ; 321
	i32 13, ; 322
	i32 9 ; 323
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}

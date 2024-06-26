; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [344 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [682 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 263
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 297
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 65960268, ; 8: Microsoft.Win32.SystemEvents.dll => 0x3ee794c => 213
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 338
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 211
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 98325684, ; 14: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 190
	i32 101534019, ; 15: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 281
	i32 117431740, ; 16: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 17: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 281
	i32 122350210, ; 18: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 19: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 301
	i32 142721839, ; 20: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 21: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 22: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 23: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 237
	i32 176265551, ; 24: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 25: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 283
	i32 184328833, ; 26: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 27: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 335
	i32 199333315, ; 28: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 336
	i32 205061960, ; 29: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 30: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 235
	i32 220171995, ; 31: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 32: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 189
	i32 230216969, ; 33: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 257
	i32 230752869, ; 34: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 35: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 36: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 37: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 38: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 240
	i32 276479776, ; 39: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 40: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 259
	i32 280482487, ; 41: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 256
	i32 280992041, ; 42: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 307
	i32 291076382, ; 43: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 291275502, ; 44: Microsoft.Extensions.Http.dll => 0x115c82ee => 191
	i32 298918909, ; 45: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 46: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 335
	i32 318968648, ; 47: Xamarin.AndroidX.Activity.dll => 0x13031348 => 226
	i32 321597661, ; 48: System.Numerics => 0x132b30dd => 83
	i32 330147069, ; 49: Microsoft.SqlServer.Server => 0x13ada4fd => 212
	i32 336156722, ; 50: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 320
	i32 342366114, ; 51: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 258
	i32 356389973, ; 52: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 319
	i32 360082299, ; 53: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 54: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 55: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 56: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 57: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 58: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 59: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 60: _Microsoft.Android.Resource.Designer => 0x17969339 => 340
	i32 403441872, ; 61: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 62: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 331
	i32 441335492, ; 63: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 241
	i32 442565967, ; 64: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 65: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 254
	i32 451504562, ; 66: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 67: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 68: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 69: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 70: System.dll => 0x1bff388e => 164
	i32 476646585, ; 71: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 256
	i32 485463106, ; 72: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 200
	i32 486930444, ; 73: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 269
	i32 498788369, ; 74: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 75: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 318
	i32 503918385, ; 76: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 312
	i32 513247710, ; 77: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 197
	i32 526420162, ; 78: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 79: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 301
	i32 530272170, ; 80: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 81: Microsoft.Extensions.Logging => 0x20216150 => 192
	i32 540030774, ; 82: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 83: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 84: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 548916678, ; 85: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 176
	i32 549171840, ; 86: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 87: Jsr305Binding => 0x213954e7 => 294
	i32 569601784, ; 88: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 292
	i32 577335427, ; 89: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 90: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 326
	i32 601371474, ; 91: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 92: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 93: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 94: Xamarin.AndroidX.CustomView => 0x2568904f => 246
	i32 627931235, ; 95: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 324
	i32 639843206, ; 96: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 252
	i32 643868501, ; 97: System.Net => 0x2660a755 => 81
	i32 662205335, ; 98: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 99: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 288
	i32 666292255, ; 100: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 233
	i32 672442732, ; 101: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 102: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 103: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 306
	i32 690569205, ; 104: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 105: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 303
	i32 693804605, ; 106: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 107: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 108: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 298
	i32 700358131, ; 109: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 110: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 321
	i32 709557578, ; 111: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 309
	i32 720511267, ; 112: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 302
	i32 722857257, ; 113: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 731701662, ; 114: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 196
	i32 735137430, ; 115: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 116: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 117: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 223
	i32 759454413, ; 118: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 119: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 120: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 121: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 330
	i32 789151979, ; 122: Microsoft.Extensions.Options => 0x2f0980eb => 195
	i32 790371945, ; 123: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 247
	i32 804715423, ; 124: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 125: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 261
	i32 809851609, ; 126: System.Drawing.Common.dll => 0x30455ad9 => 215
	i32 823281589, ; 127: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 128: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 129: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 130: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 131: Xamarin.AndroidX.Print => 0x3246f6cd => 274
	i32 873119928, ; 132: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 133: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 134: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 135: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 136: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 137: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 333
	i32 928116545, ; 138: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 297
	i32 952186615, ; 139: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 140: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 302
	i32 966729478, ; 141: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 295
	i32 967690846, ; 142: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 258
	i32 975236339, ; 143: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 144: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 145: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 146: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 147: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 148: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 149: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 150: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 278
	i32 1019214401, ; 151: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 152: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 188
	i32 1029334545, ; 153: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 308
	i32 1031528504, ; 154: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 296
	i32 1035644815, ; 155: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 231
	i32 1036536393, ; 156: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 157: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048992957, ; 158: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 190
	i32 1052210849, ; 159: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 265
	i32 1062017875, ; 160: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 199
	i32 1067306892, ; 161: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 162: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 163: Xamarin.Kotlin.StdLib => 0x409e66d8 => 299
	i32 1098259244, ; 164: System => 0x41761b2c => 164
	i32 1118262833, ; 165: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 321
	i32 1121599056, ; 166: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 264
	i32 1127624469, ; 167: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 194
	i32 1138436374, ; 168: Microsoft.Data.SqlClient.dll => 0x43db2916 => 177
	i32 1145483052, ; 169: System.Windows.Extensions.dll => 0x4446af2c => 221
	i32 1149092582, ; 170: Xamarin.AndroidX.Window => 0x447dc2e6 => 291
	i32 1157931901, ; 171: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 179
	i32 1168523401, ; 172: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 327
	i32 1170634674, ; 173: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 174: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 287
	i32 1178241025, ; 175: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 272
	i32 1202000627, ; 176: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 179
	i32 1203215381, ; 177: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 325
	i32 1204270330, ; 178: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 233
	i32 1204575371, ; 179: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 183
	i32 1208641965, ; 180: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 181: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 182: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 323
	i32 1243150071, ; 183: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 292
	i32 1253011324, ; 184: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 185: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 307
	i32 1264511973, ; 186: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 282
	i32 1267360935, ; 187: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 286
	i32 1273260888, ; 188: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 238
	i32 1275534314, ; 189: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 303
	i32 1278448581, ; 190: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 230
	i32 1293217323, ; 191: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 249
	i32 1309188875, ; 192: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 193: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 291
	i32 1324164729, ; 194: System.Linq => 0x4eed2679 => 61
	i32 1326287508, ; 195: FerryBookingMAUI => 0x4f0d8a94 => 0
	i32 1335329327, ; 196: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 197: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 198: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 337
	i32 1376866003, ; 199: Xamarin.AndroidX.SavedState => 0x52114ed3 => 278
	i32 1379779777, ; 200: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 201: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 202: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 242
	i32 1408764838, ; 203: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 204: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 205: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 206: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 305
	i32 1434145427, ; 207: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 208: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 295
	i32 1439761251, ; 209: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 210: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 211: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 212: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 213: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 214: System.IdentityModel.Tokens.Jwt => 0x57137723 => 216
	i32 1461004990, ; 215: es\Microsoft.Maui.Controls.resources => 0x57152abe => 311
	i32 1461234159, ; 216: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 217: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 218: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 219: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 232
	i32 1470490898, ; 220: Microsoft.Extensions.Primitives => 0x57a5e912 => 197
	i32 1479771757, ; 221: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 222: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 223: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 224: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 279
	i32 1493001747, ; 225: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 315
	i32 1498168481, ; 226: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 201
	i32 1505131794, ; 227: Microsoft.Extensions.Http => 0x59b67d12 => 191
	i32 1514721132, ; 228: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 310
	i32 1536373174, ; 229: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 230: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 231: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 232: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 233: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 330
	i32 1565310744, ; 234: System.Runtime.Caching => 0x5d4cbf18 => 218
	i32 1565862583, ; 235: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 236: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 237: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 238: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582305585, ; 239: Azure.Identity => 0x5e501131 => 174
	i32 1582372066, ; 240: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 248
	i32 1592978981, ; 241: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 242: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 296
	i32 1601112923, ; 243: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 244: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 245: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 246: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 268
	i32 1622358360, ; 247: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 248: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 290
	i32 1628113371, ; 249: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 204
	i32 1635184631, ; 250: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 252
	i32 1636350590, ; 251: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 245
	i32 1639515021, ; 252: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 253: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 254: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1656776769, ; 255: FerryBookingModels => 0x62c06841 => 339
	i32 1657153582, ; 256: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 257: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 284
	i32 1658251792, ; 258: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 293
	i32 1670060433, ; 259: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 240
	i32 1675553242, ; 260: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 261: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 262: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 263: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1689493916, ; 264: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 178
	i32 1691477237, ; 265: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 266: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 267: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 300
	i32 1701541528, ; 268: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 269: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 261
	i32 1726116996, ; 270: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 271: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 272: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 236
	i32 1736233607, ; 273: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 328
	i32 1743415430, ; 274: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 306
	i32 1744735666, ; 275: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 276: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 277: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 278: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 279: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 280: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 281: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 283
	i32 1770582343, ; 282: Microsoft.Extensions.Logging.dll => 0x6988f147 => 192
	i32 1776026572, ; 283: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 284: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 285: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 286: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 322
	i32 1788241197, ; 287: Xamarin.AndroidX.Fragment => 0x6a96652d => 254
	i32 1793755602, ; 288: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 314
	i32 1794500907, ; 289: Microsoft.Identity.Client.dll => 0x6af5e92b => 198
	i32 1796167890, ; 290: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 176
	i32 1808609942, ; 291: Xamarin.AndroidX.Loader => 0x6bcd3296 => 268
	i32 1813058853, ; 292: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 299
	i32 1813201214, ; 293: Xamarin.Google.Android.Material => 0x6c13413e => 293
	i32 1818569960, ; 294: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 273
	i32 1818787751, ; 295: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 296: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 297: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 298: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 193
	i32 1829150748, ; 299: System.Windows.Extensions => 0x6d06a01c => 221
	i32 1842015223, ; 300: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 334
	i32 1847515442, ; 301: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 223
	i32 1853025655, ; 302: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 331
	i32 1858542181, ; 303: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 304: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1871986876, ; 305: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 204
	i32 1875935024, ; 306: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 313
	i32 1879696579, ; 307: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 308: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 234
	i32 1888955245, ; 309: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 310: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 311: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 312: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 313: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 314: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 315: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 316: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 280
	i32 1968388702, ; 317: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 184
	i32 1983156543, ; 318: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 300
	i32 1985761444, ; 319: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 225
	i32 1986222447, ; 320: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 205
	i32 2003115576, ; 321: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 310
	i32 2011961780, ; 322: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 323: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 265
	i32 2025202353, ; 324: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 305
	i32 2031763787, ; 325: Xamarin.Android.Glide => 0x791a414b => 222
	i32 2040764568, ; 326: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 199
	i32 2045470958, ; 327: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 328: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 186
	i32 2055257422, ; 329: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 260
	i32 2060060697, ; 330: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 331: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 309
	i32 2070888862, ; 332: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 333: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 334: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 335: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 336: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 337: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 338: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 339: Microsoft.Maui => 0x80bd55ad => 209
	i32 2169148018, ; 340: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 317
	i32 2181898931, ; 341: Microsoft.Extensions.Options.dll => 0x820d22b3 => 195
	i32 2192057212, ; 342: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 193
	i32 2193016926, ; 343: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 344: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 304
	i32 2201231467, ; 345: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 346: it\Microsoft.Maui.Controls.resources => 0x839595db => 319
	i32 2217644978, ; 347: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 287
	i32 2222056684, ; 348: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 349: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 269
	i32 2252106437, ; 350: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 351: Microsoft.EntityFrameworkCore => 0x86487ec9 => 178
	i32 2253551641, ; 352: Microsoft.IdentityModel.Protocols => 0x86527819 => 203
	i32 2256313426, ; 353: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 354: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 355: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 185
	i32 2267999099, ; 356: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 224
	i32 2270573516, ; 357: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 313
	i32 2279755925, ; 358: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 276
	i32 2293034957, ; 359: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 360: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 361: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 362: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 323
	i32 2305521784, ; 363: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 364: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 228
	i32 2320631194, ; 365: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 366: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 367: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 368: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 369: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 370: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 202
	i32 2371007202, ; 371: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 184
	i32 2378619854, ; 372: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 373: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 374: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 318
	i32 2401565422, ; 375: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 376: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 251
	i32 2421380589, ; 377: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 378: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 238
	i32 2427813419, ; 379: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 315
	i32 2435356389, ; 380: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 381: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 382: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 383: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 384: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 385: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 241
	i32 2471841756, ; 386: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 387: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 388: Microsoft.Maui.Controls => 0x93dba8a1 => 207
	i32 2483903535, ; 389: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 390: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 391: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 392: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 393: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 263
	i32 2522472828, ; 394: Xamarin.Android.Glide.dll => 0x9659e17c => 222
	i32 2538310050, ; 395: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 396: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 316
	i32 2562349572, ; 397: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 398: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 399: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 264
	i32 2581819634, ; 400: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 286
	i32 2585220780, ; 401: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 402: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 403: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 404: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 325
	i32 2605712449, ; 405: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 304
	i32 2615233544, ; 406: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 255
	i32 2616218305, ; 407: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 194
	i32 2617129537, ; 408: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 409: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 410: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 245
	i32 2624644809, ; 411: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 250
	i32 2626831493, ; 412: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 320
	i32 2627185994, ; 413: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2628210652, ; 414: System.Memory.Data => 0x9ca74fdc => 217
	i32 2629843544, ; 415: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 416: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 259
	i32 2634653062, ; 417: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 180
	i32 2640290731, ; 418: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 202
	i32 2640706905, ; 419: Azure.Core => 0x9d65fd59 => 173
	i32 2660759594, ; 420: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 219
	i32 2663391936, ; 421: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 224
	i32 2663698177, ; 422: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 423: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 424: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 425: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2677098746, ; 426: Azure.Identity.dll => 0x9f9148fa => 174
	i32 2686887180, ; 427: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 428: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 429: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 284
	i32 2715334215, ; 430: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 431: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 432: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 433: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 434: Xamarin.AndroidX.Activity => 0xa2e0939b => 226
	i32 2735172069, ; 435: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 436: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 232
	i32 2740051746, ; 437: Microsoft.Identity.Client => 0xa351df22 => 198
	i32 2740948882, ; 438: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 439: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 440: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 326
	i32 2755098380, ; 441: Microsoft.SqlServer.Server.dll => 0xa437770c => 212
	i32 2755643133, ; 442: Microsoft.EntityFrameworkCore.SqlServer => 0xa43fc6fd => 181
	i32 2758225723, ; 443: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 208
	i32 2764765095, ; 444: Microsoft.Maui.dll => 0xa4caf7a7 => 209
	i32 2765824710, ; 445: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 446: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 298
	i32 2778768386, ; 447: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 289
	i32 2779977773, ; 448: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 277
	i32 2785988530, ; 449: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 332
	i32 2788224221, ; 450: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 255
	i32 2795666278, ; 451: Microsoft.Win32.SystemEvents => 0xa6a27b66 => 213
	i32 2801831435, ; 452: Microsoft.Maui.Graphics => 0xa7008e0b => 211
	i32 2803228030, ; 453: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 454: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 311
	i32 2810250172, ; 455: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 242
	i32 2819470561, ; 456: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 457: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 458: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 277
	i32 2824502124, ; 459: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 460: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 324
	i32 2838993487, ; 461: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 266
	i32 2841355853, ; 462: System.Security.Permissions => 0xa95ba64d => 220
	i32 2847789619, ; 463: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 180
	i32 2849599387, ; 464: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 465: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 289
	i32 2855708567, ; 466: Xamarin.AndroidX.Transition => 0xaa36a797 => 285
	i32 2861098320, ; 467: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 468: Microsoft.Maui.Essentials => 0xaa8a4878 => 210
	i32 2867946736, ; 469: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 219
	i32 2870099610, ; 470: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 227
	i32 2875164099, ; 471: Jsr305Binding.dll => 0xab5f85c3 => 294
	i32 2875220617, ; 472: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 473: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 253
	i32 2887636118, ; 474: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 475: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 476: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 477: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 478: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 479: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 480: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 290
	i32 2919462931, ; 481: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 482: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 229
	i32 2936416060, ; 483: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 484: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 485: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 486: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 214
	i32 2959614098, ; 487: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 488: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2971004615, ; 489: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 196
	i32 2972252294, ; 490: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 491: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 249
	i32 2987532451, ; 492: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 280
	i32 2996846495, ; 493: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 262
	i32 3012788804, ; 494: System.Configuration.ConfigurationManager => 0xb3938244 => 214
	i32 3016983068, ; 495: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 282
	i32 3020703001, ; 496: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 189
	i32 3023353419, ; 497: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 498: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 257
	i32 3033605958, ; 499: System.Memory.Data.dll => 0xb4d12746 => 217
	i32 3038032645, ; 500: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 340
	i32 3056245963, ; 501: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 279
	i32 3057625584, ; 502: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 270
	i32 3059408633, ; 503: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 504: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 505: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 182
	i32 3075834255, ; 506: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 507: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 317
	i32 3084678329, ; 508: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 205
	i32 3090735792, ; 509: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 510: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 511: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 512: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 513: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 514: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 515: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 516: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 517: GoogleGson.dll => 0xbba64c02 => 175
	i32 3159123045, ; 518: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 519: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 520: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 271
	i32 3178859286, ; 521: FerryBookingMAUI.dll => 0xbd798b16 => 0
	i32 3192346100, ; 522: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 523: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 524: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 182
	i32 3204380047, ; 525: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 526: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 527: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 248
	i32 3213246214, ; 528: System.Security.Permissions.dll => 0xbf863f06 => 220
	i32 3220365878, ; 529: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 530: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 531: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 532: Xamarin.AndroidX.CardView => 0xc235e84d => 236
	i32 3265493905, ; 533: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 534: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 535: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 536: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 537: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 538: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 539: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 540: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 541: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 312
	i32 3312457198, ; 542: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 201
	i32 3316684772, ; 543: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 544: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 246
	i32 3317144872, ; 545: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 546: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 234
	i32 3345895724, ; 547: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 275
	i32 3346324047, ; 548: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 272
	i32 3357674450, ; 549: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 329
	i32 3358260929, ; 550: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 551: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 227
	i32 3362522851, ; 552: Xamarin.AndroidX.Core => 0xc86c06e3 => 243
	i32 3366347497, ; 553: Java.Interop => 0xc8a662e9 => 168
	i32 3374879918, ; 554: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 203
	i32 3374999561, ; 555: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 276
	i32 3381016424, ; 556: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 308
	i32 3395150330, ; 557: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 558: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 559: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 247
	i32 3421170118, ; 560: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 186
	i32 3428513518, ; 561: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 187
	i32 3429136800, ; 562: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 563: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 564: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 250
	i32 3445260447, ; 565: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 566: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 206
	i32 3463511458, ; 567: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 316
	i32 3471940407, ; 568: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 569: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 570: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 329
	i32 3484440000, ; 571: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 328
	i32 3485117614, ; 572: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 573: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 574: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 239
	i32 3509114376, ; 575: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 576: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 577: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 578: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3545306353, ; 579: Microsoft.Data.SqlClient => 0xd35114f1 => 177
	i32 3560100363, ; 580: System.Threading.Timer => 0xd432d20b => 147
	i32 3561949811, ; 581: Azure.Core.dll => 0xd44f0a73 => 173
	i32 3570554715, ; 582: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3570608287, ; 583: System.Runtime.Caching.dll => 0xd4d3289f => 218
	i32 3580758918, ; 584: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 336
	i32 3597029428, ; 585: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 225
	i32 3598340787, ; 586: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 587: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 588: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 589: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 274
	i32 3633644679, ; 590: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 229
	i32 3638274909, ; 591: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 592: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 260
	i32 3643446276, ; 593: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 333
	i32 3643854240, ; 594: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 271
	i32 3645089577, ; 595: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 596: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 185
	i32 3660523487, ; 597: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 598: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 599: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 235
	i32 3684561358, ; 600: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 239
	i32 3689375977, ; 601: System.Drawing.Common => 0xdbe768e9 => 215
	i32 3697841164, ; 602: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 338
	i32 3700591436, ; 603: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 200
	i32 3700866549, ; 604: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 605: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 244
	i32 3716563718, ; 606: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 607: Xamarin.AndroidX.Annotation => 0xdda814c6 => 228
	i32 3724971120, ; 608: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 270
	i32 3732100267, ; 609: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 610: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3742647018, ; 611: FerryBookingModels.dll => 0xdf1442ea => 339
	i32 3748608112, ; 612: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 613: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 614: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 237
	i32 3792276235, ; 615: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 616: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 206
	i32 3802395368, ; 617: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 618: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 619: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 620: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 621: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 188
	i32 3844307129, ; 622: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 623: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 624: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 625: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 626: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 627: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 628: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 285
	i32 3888767677, ; 629: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 275
	i32 3889960447, ; 630: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 337
	i32 3896106733, ; 631: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 632: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 243
	i32 3901907137, ; 633: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 634: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 635: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 288
	i32 3928044579, ; 636: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 637: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 638: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 273
	i32 3945713374, ; 639: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 640: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 641: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 231
	i32 3959773229, ; 642: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 262
	i32 3980434154, ; 643: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 332
	i32 3987592930, ; 644: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 314
	i32 4003436829, ; 645: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 646: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 230
	i32 4025784931, ; 647: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 648: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 208
	i32 4054681211, ; 649: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 650: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 651: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 652: Microsoft.Maui.Essentials.dll => 0xf40add04 => 210
	i32 4099507663, ; 653: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 654: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 655: Xamarin.AndroidX.Emoji2 => 0xf479582c => 251
	i32 4101842092, ; 656: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 183
	i32 4102112229, ; 657: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 327
	i32 4125707920, ; 658: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 322
	i32 4126470640, ; 659: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 187
	i32 4127667938, ; 660: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 661: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 662: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 663: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 334
	i32 4151237749, ; 664: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 665: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 666: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 667: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 668: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 669: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 267
	i32 4185676441, ; 670: System.Security => 0xf97c5a99 => 130
	i32 4194278001, ; 671: Microsoft.EntityFrameworkCore.SqlServer.dll => 0xf9ff9a71 => 181
	i32 4196529839, ; 672: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 673: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 674: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 244
	i32 4258378803, ; 675: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 266
	i32 4260525087, ; 676: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 677: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 216
	i32 4271975918, ; 678: Microsoft.Maui.Controls.dll => 0xfea12dee => 207
	i32 4274976490, ; 679: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 680: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 267
	i32 4294763496 ; 681: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 253
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [682 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 263, ; 3
	i32 297, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 213, ; 8
	i32 30, ; 9
	i32 338, ; 10
	i32 124, ; 11
	i32 211, ; 12
	i32 102, ; 13
	i32 190, ; 14
	i32 281, ; 15
	i32 107, ; 16
	i32 281, ; 17
	i32 139, ; 18
	i32 301, ; 19
	i32 77, ; 20
	i32 124, ; 21
	i32 13, ; 22
	i32 237, ; 23
	i32 132, ; 24
	i32 283, ; 25
	i32 151, ; 26
	i32 335, ; 27
	i32 336, ; 28
	i32 18, ; 29
	i32 235, ; 30
	i32 26, ; 31
	i32 189, ; 32
	i32 257, ; 33
	i32 1, ; 34
	i32 59, ; 35
	i32 42, ; 36
	i32 91, ; 37
	i32 240, ; 38
	i32 147, ; 39
	i32 259, ; 40
	i32 256, ; 41
	i32 307, ; 42
	i32 54, ; 43
	i32 191, ; 44
	i32 69, ; 45
	i32 335, ; 46
	i32 226, ; 47
	i32 83, ; 48
	i32 212, ; 49
	i32 320, ; 50
	i32 258, ; 51
	i32 319, ; 52
	i32 131, ; 53
	i32 55, ; 54
	i32 149, ; 55
	i32 74, ; 56
	i32 145, ; 57
	i32 62, ; 58
	i32 146, ; 59
	i32 340, ; 60
	i32 165, ; 61
	i32 331, ; 62
	i32 241, ; 63
	i32 12, ; 64
	i32 254, ; 65
	i32 125, ; 66
	i32 152, ; 67
	i32 113, ; 68
	i32 166, ; 69
	i32 164, ; 70
	i32 256, ; 71
	i32 200, ; 72
	i32 269, ; 73
	i32 84, ; 74
	i32 318, ; 75
	i32 312, ; 76
	i32 197, ; 77
	i32 150, ; 78
	i32 301, ; 79
	i32 60, ; 80
	i32 192, ; 81
	i32 51, ; 82
	i32 103, ; 83
	i32 114, ; 84
	i32 176, ; 85
	i32 40, ; 86
	i32 294, ; 87
	i32 292, ; 88
	i32 120, ; 89
	i32 326, ; 90
	i32 52, ; 91
	i32 44, ; 92
	i32 119, ; 93
	i32 246, ; 94
	i32 324, ; 95
	i32 252, ; 96
	i32 81, ; 97
	i32 136, ; 98
	i32 288, ; 99
	i32 233, ; 100
	i32 8, ; 101
	i32 73, ; 102
	i32 306, ; 103
	i32 155, ; 104
	i32 303, ; 105
	i32 154, ; 106
	i32 92, ; 107
	i32 298, ; 108
	i32 45, ; 109
	i32 321, ; 110
	i32 309, ; 111
	i32 302, ; 112
	i32 109, ; 113
	i32 196, ; 114
	i32 129, ; 115
	i32 25, ; 116
	i32 223, ; 117
	i32 72, ; 118
	i32 55, ; 119
	i32 46, ; 120
	i32 330, ; 121
	i32 195, ; 122
	i32 247, ; 123
	i32 22, ; 124
	i32 261, ; 125
	i32 215, ; 126
	i32 86, ; 127
	i32 43, ; 128
	i32 160, ; 129
	i32 71, ; 130
	i32 274, ; 131
	i32 3, ; 132
	i32 42, ; 133
	i32 63, ; 134
	i32 16, ; 135
	i32 53, ; 136
	i32 333, ; 137
	i32 297, ; 138
	i32 105, ; 139
	i32 302, ; 140
	i32 295, ; 141
	i32 258, ; 142
	i32 34, ; 143
	i32 158, ; 144
	i32 85, ; 145
	i32 32, ; 146
	i32 12, ; 147
	i32 51, ; 148
	i32 56, ; 149
	i32 278, ; 150
	i32 36, ; 151
	i32 188, ; 152
	i32 308, ; 153
	i32 296, ; 154
	i32 231, ; 155
	i32 35, ; 156
	i32 58, ; 157
	i32 190, ; 158
	i32 265, ; 159
	i32 199, ; 160
	i32 175, ; 161
	i32 17, ; 162
	i32 299, ; 163
	i32 164, ; 164
	i32 321, ; 165
	i32 264, ; 166
	i32 194, ; 167
	i32 177, ; 168
	i32 221, ; 169
	i32 291, ; 170
	i32 179, ; 171
	i32 327, ; 172
	i32 153, ; 173
	i32 287, ; 174
	i32 272, ; 175
	i32 179, ; 176
	i32 325, ; 177
	i32 233, ; 178
	i32 183, ; 179
	i32 29, ; 180
	i32 52, ; 181
	i32 323, ; 182
	i32 292, ; 183
	i32 5, ; 184
	i32 307, ; 185
	i32 282, ; 186
	i32 286, ; 187
	i32 238, ; 188
	i32 303, ; 189
	i32 230, ; 190
	i32 249, ; 191
	i32 85, ; 192
	i32 291, ; 193
	i32 61, ; 194
	i32 0, ; 195
	i32 112, ; 196
	i32 57, ; 197
	i32 337, ; 198
	i32 278, ; 199
	i32 99, ; 200
	i32 19, ; 201
	i32 242, ; 202
	i32 111, ; 203
	i32 101, ; 204
	i32 102, ; 205
	i32 305, ; 206
	i32 104, ; 207
	i32 295, ; 208
	i32 71, ; 209
	i32 38, ; 210
	i32 32, ; 211
	i32 103, ; 212
	i32 73, ; 213
	i32 216, ; 214
	i32 311, ; 215
	i32 9, ; 216
	i32 123, ; 217
	i32 46, ; 218
	i32 232, ; 219
	i32 197, ; 220
	i32 9, ; 221
	i32 43, ; 222
	i32 4, ; 223
	i32 279, ; 224
	i32 315, ; 225
	i32 201, ; 226
	i32 191, ; 227
	i32 310, ; 228
	i32 31, ; 229
	i32 138, ; 230
	i32 92, ; 231
	i32 93, ; 232
	i32 330, ; 233
	i32 218, ; 234
	i32 49, ; 235
	i32 141, ; 236
	i32 112, ; 237
	i32 140, ; 238
	i32 174, ; 239
	i32 248, ; 240
	i32 115, ; 241
	i32 296, ; 242
	i32 157, ; 243
	i32 76, ; 244
	i32 79, ; 245
	i32 268, ; 246
	i32 37, ; 247
	i32 290, ; 248
	i32 204, ; 249
	i32 252, ; 250
	i32 245, ; 251
	i32 64, ; 252
	i32 138, ; 253
	i32 15, ; 254
	i32 339, ; 255
	i32 116, ; 256
	i32 284, ; 257
	i32 293, ; 258
	i32 240, ; 259
	i32 48, ; 260
	i32 70, ; 261
	i32 80, ; 262
	i32 126, ; 263
	i32 178, ; 264
	i32 94, ; 265
	i32 121, ; 266
	i32 300, ; 267
	i32 26, ; 268
	i32 261, ; 269
	i32 97, ; 270
	i32 28, ; 271
	i32 236, ; 272
	i32 328, ; 273
	i32 306, ; 274
	i32 149, ; 275
	i32 169, ; 276
	i32 4, ; 277
	i32 98, ; 278
	i32 33, ; 279
	i32 93, ; 280
	i32 283, ; 281
	i32 192, ; 282
	i32 21, ; 283
	i32 41, ; 284
	i32 170, ; 285
	i32 322, ; 286
	i32 254, ; 287
	i32 314, ; 288
	i32 198, ; 289
	i32 176, ; 290
	i32 268, ; 291
	i32 299, ; 292
	i32 293, ; 293
	i32 273, ; 294
	i32 2, ; 295
	i32 134, ; 296
	i32 111, ; 297
	i32 193, ; 298
	i32 221, ; 299
	i32 334, ; 300
	i32 223, ; 301
	i32 331, ; 302
	i32 58, ; 303
	i32 95, ; 304
	i32 204, ; 305
	i32 313, ; 306
	i32 39, ; 307
	i32 234, ; 308
	i32 25, ; 309
	i32 94, ; 310
	i32 89, ; 311
	i32 99, ; 312
	i32 10, ; 313
	i32 87, ; 314
	i32 100, ; 315
	i32 280, ; 316
	i32 184, ; 317
	i32 300, ; 318
	i32 225, ; 319
	i32 205, ; 320
	i32 310, ; 321
	i32 7, ; 322
	i32 265, ; 323
	i32 305, ; 324
	i32 222, ; 325
	i32 199, ; 326
	i32 88, ; 327
	i32 186, ; 328
	i32 260, ; 329
	i32 154, ; 330
	i32 309, ; 331
	i32 33, ; 332
	i32 116, ; 333
	i32 82, ; 334
	i32 20, ; 335
	i32 11, ; 336
	i32 162, ; 337
	i32 3, ; 338
	i32 209, ; 339
	i32 317, ; 340
	i32 195, ; 341
	i32 193, ; 342
	i32 84, ; 343
	i32 304, ; 344
	i32 64, ; 345
	i32 319, ; 346
	i32 287, ; 347
	i32 143, ; 348
	i32 269, ; 349
	i32 157, ; 350
	i32 178, ; 351
	i32 203, ; 352
	i32 41, ; 353
	i32 117, ; 354
	i32 185, ; 355
	i32 224, ; 356
	i32 313, ; 357
	i32 276, ; 358
	i32 131, ; 359
	i32 75, ; 360
	i32 66, ; 361
	i32 323, ; 362
	i32 172, ; 363
	i32 228, ; 364
	i32 143, ; 365
	i32 106, ; 366
	i32 151, ; 367
	i32 70, ; 368
	i32 156, ; 369
	i32 202, ; 370
	i32 184, ; 371
	i32 121, ; 372
	i32 127, ; 373
	i32 318, ; 374
	i32 152, ; 375
	i32 251, ; 376
	i32 141, ; 377
	i32 238, ; 378
	i32 315, ; 379
	i32 20, ; 380
	i32 14, ; 381
	i32 135, ; 382
	i32 75, ; 383
	i32 59, ; 384
	i32 241, ; 385
	i32 167, ; 386
	i32 168, ; 387
	i32 207, ; 388
	i32 15, ; 389
	i32 74, ; 390
	i32 6, ; 391
	i32 23, ; 392
	i32 263, ; 393
	i32 222, ; 394
	i32 91, ; 395
	i32 316, ; 396
	i32 1, ; 397
	i32 136, ; 398
	i32 264, ; 399
	i32 286, ; 400
	i32 134, ; 401
	i32 69, ; 402
	i32 146, ; 403
	i32 325, ; 404
	i32 304, ; 405
	i32 255, ; 406
	i32 194, ; 407
	i32 88, ; 408
	i32 96, ; 409
	i32 245, ; 410
	i32 250, ; 411
	i32 320, ; 412
	i32 31, ; 413
	i32 217, ; 414
	i32 45, ; 415
	i32 259, ; 416
	i32 180, ; 417
	i32 202, ; 418
	i32 173, ; 419
	i32 219, ; 420
	i32 224, ; 421
	i32 109, ; 422
	i32 158, ; 423
	i32 35, ; 424
	i32 22, ; 425
	i32 174, ; 426
	i32 114, ; 427
	i32 57, ; 428
	i32 284, ; 429
	i32 144, ; 430
	i32 118, ; 431
	i32 120, ; 432
	i32 110, ; 433
	i32 226, ; 434
	i32 139, ; 435
	i32 232, ; 436
	i32 198, ; 437
	i32 54, ; 438
	i32 105, ; 439
	i32 326, ; 440
	i32 212, ; 441
	i32 181, ; 442
	i32 208, ; 443
	i32 209, ; 444
	i32 133, ; 445
	i32 298, ; 446
	i32 289, ; 447
	i32 277, ; 448
	i32 332, ; 449
	i32 255, ; 450
	i32 213, ; 451
	i32 211, ; 452
	i32 159, ; 453
	i32 311, ; 454
	i32 242, ; 455
	i32 163, ; 456
	i32 132, ; 457
	i32 277, ; 458
	i32 161, ; 459
	i32 324, ; 460
	i32 266, ; 461
	i32 220, ; 462
	i32 180, ; 463
	i32 140, ; 464
	i32 289, ; 465
	i32 285, ; 466
	i32 169, ; 467
	i32 210, ; 468
	i32 219, ; 469
	i32 227, ; 470
	i32 294, ; 471
	i32 40, ; 472
	i32 253, ; 473
	i32 81, ; 474
	i32 56, ; 475
	i32 37, ; 476
	i32 97, ; 477
	i32 166, ; 478
	i32 172, ; 479
	i32 290, ; 480
	i32 82, ; 481
	i32 229, ; 482
	i32 98, ; 483
	i32 30, ; 484
	i32 159, ; 485
	i32 214, ; 486
	i32 18, ; 487
	i32 127, ; 488
	i32 196, ; 489
	i32 119, ; 490
	i32 249, ; 491
	i32 280, ; 492
	i32 262, ; 493
	i32 214, ; 494
	i32 282, ; 495
	i32 189, ; 496
	i32 165, ; 497
	i32 257, ; 498
	i32 217, ; 499
	i32 340, ; 500
	i32 279, ; 501
	i32 270, ; 502
	i32 170, ; 503
	i32 16, ; 504
	i32 182, ; 505
	i32 144, ; 506
	i32 317, ; 507
	i32 205, ; 508
	i32 125, ; 509
	i32 118, ; 510
	i32 38, ; 511
	i32 115, ; 512
	i32 47, ; 513
	i32 142, ; 514
	i32 117, ; 515
	i32 34, ; 516
	i32 175, ; 517
	i32 95, ; 518
	i32 53, ; 519
	i32 271, ; 520
	i32 0, ; 521
	i32 129, ; 522
	i32 153, ; 523
	i32 182, ; 524
	i32 24, ; 525
	i32 161, ; 526
	i32 248, ; 527
	i32 220, ; 528
	i32 148, ; 529
	i32 104, ; 530
	i32 89, ; 531
	i32 236, ; 532
	i32 60, ; 533
	i32 142, ; 534
	i32 100, ; 535
	i32 5, ; 536
	i32 13, ; 537
	i32 122, ; 538
	i32 135, ; 539
	i32 28, ; 540
	i32 312, ; 541
	i32 201, ; 542
	i32 72, ; 543
	i32 246, ; 544
	i32 24, ; 545
	i32 234, ; 546
	i32 275, ; 547
	i32 272, ; 548
	i32 329, ; 549
	i32 137, ; 550
	i32 227, ; 551
	i32 243, ; 552
	i32 168, ; 553
	i32 203, ; 554
	i32 276, ; 555
	i32 308, ; 556
	i32 101, ; 557
	i32 123, ; 558
	i32 247, ; 559
	i32 186, ; 560
	i32 187, ; 561
	i32 163, ; 562
	i32 167, ; 563
	i32 250, ; 564
	i32 39, ; 565
	i32 206, ; 566
	i32 316, ; 567
	i32 17, ; 568
	i32 171, ; 569
	i32 329, ; 570
	i32 328, ; 571
	i32 137, ; 572
	i32 150, ; 573
	i32 239, ; 574
	i32 155, ; 575
	i32 130, ; 576
	i32 19, ; 577
	i32 65, ; 578
	i32 177, ; 579
	i32 147, ; 580
	i32 173, ; 581
	i32 47, ; 582
	i32 218, ; 583
	i32 336, ; 584
	i32 225, ; 585
	i32 79, ; 586
	i32 61, ; 587
	i32 106, ; 588
	i32 274, ; 589
	i32 229, ; 590
	i32 49, ; 591
	i32 260, ; 592
	i32 333, ; 593
	i32 271, ; 594
	i32 14, ; 595
	i32 185, ; 596
	i32 68, ; 597
	i32 171, ; 598
	i32 235, ; 599
	i32 239, ; 600
	i32 215, ; 601
	i32 338, ; 602
	i32 200, ; 603
	i32 78, ; 604
	i32 244, ; 605
	i32 108, ; 606
	i32 228, ; 607
	i32 270, ; 608
	i32 67, ; 609
	i32 63, ; 610
	i32 339, ; 611
	i32 27, ; 612
	i32 160, ; 613
	i32 237, ; 614
	i32 10, ; 615
	i32 206, ; 616
	i32 11, ; 617
	i32 78, ; 618
	i32 126, ; 619
	i32 83, ; 620
	i32 188, ; 621
	i32 66, ; 622
	i32 107, ; 623
	i32 65, ; 624
	i32 128, ; 625
	i32 122, ; 626
	i32 77, ; 627
	i32 285, ; 628
	i32 275, ; 629
	i32 337, ; 630
	i32 8, ; 631
	i32 243, ; 632
	i32 2, ; 633
	i32 44, ; 634
	i32 288, ; 635
	i32 156, ; 636
	i32 128, ; 637
	i32 273, ; 638
	i32 23, ; 639
	i32 133, ; 640
	i32 231, ; 641
	i32 262, ; 642
	i32 332, ; 643
	i32 314, ; 644
	i32 29, ; 645
	i32 230, ; 646
	i32 62, ; 647
	i32 208, ; 648
	i32 90, ; 649
	i32 87, ; 650
	i32 148, ; 651
	i32 210, ; 652
	i32 36, ; 653
	i32 86, ; 654
	i32 251, ; 655
	i32 183, ; 656
	i32 327, ; 657
	i32 322, ; 658
	i32 187, ; 659
	i32 50, ; 660
	i32 6, ; 661
	i32 90, ; 662
	i32 334, ; 663
	i32 21, ; 664
	i32 162, ; 665
	i32 96, ; 666
	i32 50, ; 667
	i32 113, ; 668
	i32 267, ; 669
	i32 130, ; 670
	i32 181, ; 671
	i32 76, ; 672
	i32 27, ; 673
	i32 244, ; 674
	i32 266, ; 675
	i32 7, ; 676
	i32 216, ; 677
	i32 207, ; 678
	i32 110, ; 679
	i32 267, ; 680
	i32 253 ; 681
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

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
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

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}

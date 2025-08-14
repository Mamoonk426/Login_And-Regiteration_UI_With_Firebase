@echo off
"C:\\Users\\Mamoon Khan\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\cmake.exe" ^
  "-HC:\\flutter\\packages\\flutter_tools\\gradle\\src\\main\\scripts" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=23" ^
  "-DANDROID_PLATFORM=android-23" ^
  "-DANDROID_ABI=x86" ^
  "-DCMAKE_ANDROID_ARCH_ABI=x86" ^
  "-DANDROID_NDK=C:\\Users\\Mamoon Khan\\AppData\\Local\\Android\\sdk\\ndk\\29.0.13846066" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\Mamoon Khan\\AppData\\Local\\Android\\sdk\\ndk\\29.0.13846066" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\Mamoon Khan\\AppData\\Local\\Android\\sdk\\ndk\\29.0.13846066\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\Mamoon Khan\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=D:\\Study Content\\Online Flutter course\\Instagram_ui_with_firebase\\build\\app\\intermediates\\cxx\\Debug\\5w4q6d3e\\obj\\x86" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=D:\\Study Content\\Online Flutter course\\Instagram_ui_with_firebase\\build\\app\\intermediates\\cxx\\Debug\\5w4q6d3e\\obj\\x86" ^
  "-DCMAKE_BUILD_TYPE=Debug" ^
  "-BD:\\Study Content\\Online Flutter course\\Instagram_ui_with_firebase\\build\\.cxx\\Debug\\5w4q6d3e\\x86" ^
  -GNinja ^
  -Wno-dev ^
  --no-warn-unused-cli

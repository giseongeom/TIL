## mingw64 에서 Build 

### Staic build

* hello-world.cpp 소스
```cpp
//
//  main.cpp
//  HelloWorld
//
//  Created by GiSeong Eom on 21/06/2017.
//  Copyright © 2017 GiSeong Eom. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, GiSeong, World!\n";
    return 0;
}
```

* build
```bash
$ x86_64-w64-mingw32-c++.exe -static-libgcc -static-libstdc++ -static -lpthread main.cpp
[x86_64-pc-msys]  giseong.eom@GISEONG-PC /c/temp
```

* run
```
C:\temp>a.exe
Hello, GiSeong, World!
```

## 참고자료

* [`c++ - how to do static linking of libwinpthread-1.dll in mingw?`](https://stackoverflow.com/questions/13768515/how-to-do-static-linking-of-libwinpthread-1-dll-in-mingw)
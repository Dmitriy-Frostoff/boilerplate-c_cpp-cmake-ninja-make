# boilerplate-c_cpp-cmake-ninja-make

It's an boilerplate for usage of c/c++ cmake, ninja, make (the settings) in a future project. Check out the docs below to be in actual tune!

---

### !Important

It was used only at actual `Windows 10 x64` (TODO! check the `Linux`)!

Do all the steps from [C/C++ for Visual Studio Code](https://code.visualstudio.com/docs/languages/cpp) before usage.

> [!NOTE]  
> `eslint, prettier, execa` are **not necessary for C++ project!** (and by the way `husky` with `commitlint` too, but
> they're very convinient for following `Git-flow` principles).
> So just take what you really need from the project.

!Strongly required the next list of tools to be used / installed / present at your PC:

- actual `VSCode` (was tested with v1.108.0);
- [C/C++ for Visual Studio Code](https://github.com/microsoft/vscode-cpptools);
- [C/C++ Extension Pack for Visual Studio Code](https://github.com/microsoft/vscode-cpptools);
- [C/C++ Extension UI Themes for Visual Studio Code](https://github.com/Microsoft/vscode-cpptools);
- [Clangd Extension for Visual Studio Code (for linting)](https://github.com/clangd/vscode-clangd);
- [EditorConfig for Visual Studio Code](https://github.com/editorconfig/editorconfig-vscode);
- [g++](https://gcc.gnu.org/releases.html);
- [gcc](https://gcc.gnu.org/releases.html);
- [gdb](https://www.sourceware.org/gdb/download/);
- [clang, clang++, clang-tidy, clang-format, lld and LLVM tools](https://releases.llvm.org/download.html);

optional:

- [Format Code Action for Visual Studio Code](https://github.com/rohit-gohri/vscode-format-code-action);
- [VS Code ESLint extension](https://github.com/Microsoft/vscode-eslint);
- [Prettier Formatter for Visual Studio Code](https://github.com/prettier/prettier-vscode);

**note:** It's a common practice for `C/C++ languages tools` collect them and place apart of your system (mean `C:/Program Files` etc). E.g. `C:/Tools`. It's expected in the project `C:/Tools` with adding to the Windows 's `path environment variables`.

Currently (`Windows 10 x64`):

- `C:/Tools/msys64/ucrt64/bin` - all the tools are here (e.g. `gcc`, `g++`, `cmake`, `make`, `ninja` etc);

Also this pathes **must be added** to the **PATH** environment ([How to: Add Tool Locations to the PATH Environment Variable](<https://learn.microsoft.com/en-us/previous-versions/office/developer/sharepoint-2010/ee537574(v=office.14)>)).

### The boilerplate structure and brief descriptions:

```bash
.
├── CMakeLists.txt  # primary CMake config with base settings for entire project
├── configs # project tools configs
│   ├── CMake # CMake settings for build
│   │   └── tasks.json
│   ├── commitlint  # to check the commit messages and to pursue the commit-conventional naming
│   │   └── commitlint.config.js
│   ├── eslint # optional, JS / TS linter configs
│   ├── execa # optional, for update JS configs
│   │   ├── main.js
│   │   ├── update-error.log
│   │   └── utils
│   │       ├── checkNpmPkgsUpdates.js
│   │       ├── updateNpmPackages.js
│   │       ├── writeErrorLogFile.js
│   │       └── writeSuccessLogFile.js
│   └── prettier  # optional, for formatting JS / TS and JSON files
│       └── prettier.config.js
├── LICENSE # project license
├── Makefile  # primary Make config with base settings for entire project (from one sid is alternative to CMake
├             # from another => convenient way to produce "dev" or "build" bundling, or to "clean" (wipe)
├             #  the "build" folder)
├── package.json  # optional, project base descriptions and GitHub data, JS / TS packages to install
├                 #  (**note:** `node.js` is required for installations)
├── package-lock.json # optional, specific for `node.js` installed packages
├── README.md # project description
└── src # examples of CMake and Make usage. Use personal `CMakeLists.txt` or `Makefile.mk` for every submodule
        # like below one
    ├── CMakeLists.txt  # submodule's CMake config (use like this one)
    ├── helloworld_cpp.cpp  # cxx code example to build
    ├── main.c  # c code example to build
    ├── Makefile.mk # submodule's Make config (use like this one if `Make` without `CMake` prefered to use)
    └── math_lib  # submodule's submodule with `CMake` or `Make` config principles to use
        ├── CMakelists.txt
        ├── Makefile.mk
        ├── math_utils.c
        └── math_utils.h
```

### C/C++ Builders and Bundlers (CMake + Ninja, Make)

Prefer to use either:

- `CMake + Ninja` with `Make` (with the only `Makefile` in the `cwd`), where `Makefile` in the `cwd` is just a task runner for `dev` or `build` mode, or just to erase `build` folder
  or
- just `Make` with `Makefile.mk` in the submodules

> [!NOTE]  
> depend on your project preferences

!**Not both simultaneously**!

- `CMake + Ninja + Make` with `CMakeLists.txt` in the submodules

with

- `Make` with `Makefile.mk` in the submodules

**Just one or another one!**

---

it's required to be installed at your PC (and added to the `PATH environment variable` of `Windows`) / in `VSCode`:

---

`gcc`, `g++`, `gdb`, `clang`, `clang++`, `LLVM tools`, `CMake`, `Ninja`, `Make`, `lld`

---

- [CMake Tools for Visual Studio Code](https://github.com/microsoft/vscode-cmake-tools);

---

As for `Windows 10` **preferred usage way** is to `msys2` tools (and `ucrt64`) with `pacman` package manager to ease the process of tools installations, updates and further applications development.

> [!NOTE]
>
> - detailed installation guide is at [boilerplate-c_cpp-compilers_linters_formatters](https://github.com/Dmitriy-Frostoff/boilerplate-c_cpp-compilers_linters_formatters);
> - assumed that `msys2` is installed to the `C/Tools` (i.e. `msys2` in the `C/Tools/msys64`)
> - check the `paths` in the `configs/CMake/tasks.json` such as:
> - `C/Tools/msys64/ucrt64`
> - `C:\\Tools\\msys64\\ucrt64`

Check the [CMake](https://cmake.org/), [Ninja](https://ninja-build.org/), [The Ninja build system](https://ninja-build.org/manual.html) about how to use them!

If one want to disable autoconfiguration on save of the `CMakeLists.txt` file,
add to the `./.vscode/settings.json` next lines:

```json
"cmake.configureOnSave": false
```

and run it manually via `VSCode` command `Ctrl + Shift + P` => `CMake: Configure` .

**Build the project**  
do the next steps:
from `cwd`

- check that `build` folder exist before that!

```bash
cmake -G Ninja -S . -B build
```

where `-S .` means the source directory, `-B build` where to place `build` directory

- build the binaries via got above instructions

```bash
ninja -C build
```

but it far convenient to use `make` as `task-runner` like this

```bash
make dev
```

or

```bash
make build
```

or

```bash
make clean
```

where `dev`, `build`, `clean` are purposes defined in the `Makefile` (i.e. in the `cwd`)

---

or if **just** `Make` was used in the project

```bash
make all
```

> [!NOTE]  
> main syntax for `make` running is `make purpose_name`, so currently `all` is a purpose
> never just run `make` without purposes after it (i.e. auto purpose choosing)!!!

- run built `*.exe` file

```bash
build/bin/helloworld_cpp.exe
> Hello world! QQ here!
```

### Integration with [`Connections`](#Connections) links:

To integrate the boilerplate do the following steps (**note**: copy the defined below project structure as is!!!):

- copy `configs/CMake`, check the pathes in the `tasks.json` (i.e. `C:\\Tools\\msys64\\ucrt64\\bin\\clang.exe` to suite your system);
- add to the `.vscode/settings.json` code below and check the pathes (e.g.`C:\\Tools\\msys64\\ucrt64\\bin`)

```json
...
  "C_Cpp.default.compilerPath": "C:\\Tools\\msys64\\ucrt64\\bin",
  "cmake.generator": "Ninja",
  "cmake.options.statusBarVisibility": "icon",
  "files.eol": "\n",
  "cmake.additionalCompilerSearchDirs": ["C:\\Tools\\msys64\\ucrt64\\bin"],
  "cmake.additionalKits": ["C:\\Tools\\msys64\\ucrt64\\bin"],
  "cmake.preferredGenerators": [],
  "cmake.sourceDirectory": "${workspaceFolder}",
  "cmake.automaticReconfigure": true,
  "cmake.configureOnEdit": true,
  "cmake.configureOnOpen": true
```

> [!NOTE]  
> **advise**  
> prefer to use `lld` linker to `ld`  
> because it's a modern, fast and well-tested linker with less error - prone

- than use **one of two ways**:

---

- the **first way** is `CMake + Ninja + Make(as task runner)`

=> copy and use in a similar way (**note:** checking rules and following the official `CMake` docs) as in the boilerplate for `cwd`'s `CMakeLists.txt` and submodules' `CMakeLists.txt` configs

=> use `Makefile` config in the `cwd` with the content

```Makefile
# paths
OBJ_DIR := build
BIN_DIR := $(OBJ_DIR)/bin
LIB_DIR := $(OBJ_DIR)/lib

# targets
.PHONY: dev build clean

dev:
	cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -S . -B build && ninja -C build

build:
	cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -S . -B build && ninja -C build

clean:
	rm -rf $(OBJ_DIR)/

.DEFAULT_GOAL := dev

```

> [!NOTE]  
> in the recipes (e.g. `rm -rf $(OBJ_DIR)/` are **only tabs must be used!**)

- try

```bash
make dev
```

```bash
make build
```

```bash
make clean
```

---

- the **second way** is just `Make` usage
  - copy and use in a similar way (**note:** checking rules and following the official `Make` docs) as in the boilerplate for `cwd`'s `Makefile` and submodules' `Makefile.mk` configs (i.e. no `CMakeLists.txt` used **at all**);
  - remove the lines from the `Makefile` (in the `cwd`), because one won't need it

  ```Makefile
  dev:
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -S . -B build && ninja -C build

  build:
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -S . -B build && ninja -C build
  ```

- try

```bash
make all
```

```bash
make clean
```

**check for errors**,  
**if is**  
=> fix them  
**otherwise**  
=> the project is ready for development process

> [!NOTE]
>
> **With the new packages releases, the ones above can turn to pumpkin, so check'em out with official docs!!!**

### Links:

#### CMake:

- [CMake official website](https://cmake.org/);
- [CMake official GitHub repo](https://github.com/Kitware/CMake);
- [CMake official tutorial documentation](https://cmake.org/getting-started/);
- [CMake official documentation](https://cmake.org/documentation/);
- [CMake For VisualStudio Code](https://github.com/twxs/vs.language.cmake);
- [CMake Tools for Visual Studio Code](https://github.com/microsoft/vscode-cmake-tools);
- [CMake add_subdirectory](https://cmake.org/cmake/help/latest/command/add_subdirectory.html);

#### Ninja:

- [Ninja official website](https://ninja-build.org/);
- [Ninja official GitHub repo](https://github.com/ninja-build/ninja);

#### Make:

- [GNU Make official website](https://www.gnu.org/software/make/);
- [GNU Make official manual](https://www.gnu.org/software/make/manual/make.html);
- [GNU Make official repo](git://git.savannah.gnu.org/make);

#### Connections:

- [boilerplate-c_cpp-compilers_linters_formatters](https://github.com/Dmitriy-Frostoff/boilerplate-c_cpp-compilers_linters_formatters);

#### done: January 09, 2026

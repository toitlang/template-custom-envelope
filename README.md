# Template repository for creating a custom Toit envelope

This repository can be used to create custom [envelopes](https://docs.toit.io/tutorials/containers)
for [Toit](https://toitlang.org/).

There are already many [pre-built envelopes](https://github.com/toitlang/envelopes) available, but
if you need to create a custom envelope, this repository can be used as a starting point.

## External services

See the [README-external-service.md](README-external-service.md) file for information on how to use external services.

## Setup

### Prerequisites
* Make sure you have a complete build environment. See
  - https://github.com/toitlang/toit, and
  - https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html
  - A good starting point is to run `install.sh` from the `toit/third_party/esp-idf` folder.

The [ci.yml](.github/workflows/ci.yml) file uses Toit's setup action to install all prerequisites
on a GitHub runner. You can use this as a reference for setting up your own environment.

### Initial setup

* Duplicate this repository:

  Start by creating a fresh repository on GitHub. Then run the following
  commands, replacing `your-owner/your-repo` with the name of your repository:

  ``` shell
  git clone --bare https://github.com/toitlang/template-custom-envelope.git
  cd template-custom-envelope.git
  git push --mirror git@github.com:your-owner/your-repo.git
  cd ..
  rm -rf template-custom-envelope.git
  ```

  Also see [GitHub's instructions](https://docs.github.com/en/repositories/creating-and-managing-repositories/duplicating-a-repository).
  If you forked it, you can also detach the fork: https://support.github.com/request/fork

* Check out your new repository (again replacing `your-repo` with the name of your repository):

  ``` shell
  git clone git@github.com:your-owner/your-repo.git
  cd your-repo
  ```

* Change the license to your license.
* Change the `TARGET` variable in the Makefile to the name of your chip. By default it is set to `esp32`.
* Run `make init`. This will copy some of the Toit files, depending on the target, to your repository.

### Configuration
* Adjust or remove the C components in the `components` folder.
* Run `make menuconfig` to configure the build.
* Adjust the [ci.yml](.github/workflows/ci.yml) file to match your setup. Typically, you don't need
  to compile on Windows or macOS.

### Build
* Run `make` to build the envelope. It should end up with a `build/esp32/firmware.envelope`.

## Makefile targets
- `make` or `make all` - Build the envelope.
- `make init` - Initialize after cloning. See the Setup section above.
- `make menuconfig` - Runs the ESP-IDF menuconfig tool in the build-root. Also creates the `sdkconfig.defaults` file.
- `make diff` - Show the differences between your configuration (sdkconfig and partitions.csv) and the default Toit configuration.
- `make clean` - Remove all build artifacts.

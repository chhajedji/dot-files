echo "By default xtensa toolchain version 5.2.0 is selected"
export PATH=$HOME/esp/toolchain/v5.2.0/xtensa-esp32-elf/bin:$PATH
export PATH=$HOME/esp/scripts:$PATH

alias tv8.2.0="export PATH=$HOME/esp/toolchain/v8.2.0/xtensa-esp32-elf/bin:$PATH"
alias tv5.2.0="export PATH=$HOME/esp/toolchain/v5.2.0/xtensa-esp32-elf/bin:$PATH"


export IDF_PATH=~/esp/esp-idf
export PATH=$IDF_PATH/tools:$PATH
# export ESPBAUD=2000000
export ESPBAUD=921600
export ESPPORT=/dev/tty.SLAB_USBtoUART
export TEST_FW_PATH=~/esp/esp-idf/tools/tiny-test-fw
export AUDIO_BOARD_PATH=~/esp/esp-audio-sdk/components/audio_hal/audio_board/audio_board_lyratd_cnx
export SHF_PATH=~/esp/smart-home/

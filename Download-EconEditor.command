#!/bin/zsh
set -eu
cd -- "${0:A:h}"
archive=EconEditor-Qwen3-8B-MLX.zip
release='https://github.com/ZhenyuanPAN822/econ-editor-qwen3-8b-mlx/releases/download/v1.0.0'
full_hash='5179e50edbafde28c2bb051f65b6a7aea73670f50ff6584c0b5d5e532320bad8'
hashes=(
  df20c0487da60dd3a0749e984701451a0ec24874498a9afb08a3c8a7658b9afb
  86d434223c51b25c38656735c04d03fe56b4dba5fee17fd2ff86a1dd15b2c459
)
check_file() {
  print -r -- "$1  $2" | /usr/bin/shasum -a 256 --status -c -
}
if [[ -e "$archive" ]]; then
  if check_file "$full_hash" "$archive"; then
    print "压缩包已就绪，可直接解压 $archive"
    exit 0
  fi
  print -u2 "同目录已有同名文件，校验值不同。请移动该文件，或从另一目录重新运行。"
  exit 1
fi
for i in 1 2; do
  part="$archive.part0$i"
  if [[ ! -f "$part" ]]; then
    print "正在下载第 $i / 2 份模型文件…"
    /usr/bin/curl --proto '=https' --tlsv1.2 --fail --location --retry 3 --continue-at - --output "$part.partial" "$release/$part"
    if ! check_file "$hashes[$i]" "$part.partial"; then
      print -u2 "$part.partial 未通过校验，请移动该文件并重试。"
      exit 1
    fi
    /bin/mv -n -- "$part.partial" "$part"
  fi
  if ! check_file "$hashes[$i]" "$part"; then
    print -u2 "$part 未通过校验，请移动该分卷后重试。"
    exit 1
  fi
done
tmpzip=$(/usr/bin/mktemp "./$archive.XXXXXXXX")
trap '/bin/rm -f -- "$tmpzip"' EXIT
/bin/cat -- "$archive.part01" "$archive.part02" > "$tmpzip"
check_file "$full_hash" "$tmpzip"
/bin/ln -- "$tmpzip" "$archive"
print "已恢复并校验 $PWD/$archive 。请解压，双击「打开训练版编辑器.command」。"


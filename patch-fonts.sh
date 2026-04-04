#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATCHER="$SCRIPT_DIR/FontPatcher/font-patcher"

TTF_DIR="$SCRIPT_DIR/RedHatFont-4.1.0/fonts/Mono/ttf"
OTF_DIR="$SCRIPT_DIR/RedHatFont-4.1.0/fonts/Mono/otf"

OUTPUT_DIR="$SCRIPT_DIR/output"
LOG_DIR="$OUTPUT_DIR/logs"

mkdir -p "$OUTPUT_DIR" "$LOG_DIR"

require_cmd() {
    command -v "$1" >/dev/null 2>&1 || {
        echo "Error: '$1' is not installed or not in PATH." >&2
        exit 1
    }
}

require_file() {
    [[ -f "$1" ]] || {
        echo "Error: File not found: $1" >&2
        exit 1
    }
}

require_dir() {
    [[ -d "$1" ]] || {
        echo "Error: Directory not found: $1" >&2
        exit 1
    }
}

require_cmd fontforge
require_file "$PATCHER"
require_dir "$TTF_DIR"
require_dir "$OTF_DIR"

patch_font() {
    local font_path="$1"
    local variant="$2"     # mono | regular
    local format="$3"      # ttf | otf
    local out_dir="$OUTPUT_DIR/$format/$variant"
    local log_file
    local -a args

    mkdir -p "$out_dir"

    log_file="$LOG_DIR/$(basename "${font_path%.*}")-${variant}.${format}.log"

    args=(
        fontforge -script "$PATCHER"
        --complete
        --outputdir "$out_dir"
    )

    if [[ "$variant" == "mono" ]]; then
        args+=(--mono)
    fi

    args+=("$font_path")

    echo "Patching [$format/$variant]: $(basename "$font_path")"

    if "${args[@]}" >"$log_file" 2>&1; then
        grep -E "====>|Done|\\.(ttf|otf)" "$log_file" || true
        echo "OK"
    else
        echo "Error patching $(basename "$font_path")" >&2
        grep -E "ERROR|Traceback|Exception|\\.(ttf|otf)" "$log_file" || cat "$log_file" >&2
        return 1
    fi

    echo "---"
}

patch_family() {
    local source_dir="$1"
    local format="$2"
    local ext=".$format"
    local fonts=("$source_dir"/*"$ext")

    if (( ${#fonts[@]} == 0 )); then
        echo "No .$format files found in: $source_dir"
        return 0
    fi

    echo "=== Patching $format: Nerd Font Mono ==="
    for font in "${fonts[@]}"; do
        patch_font "$font" "mono" "$format"
    done

    echo "=== Patching $format: Nerd Font ==="
    for font in "${fonts[@]}"; do
        patch_font "$font" "regular" "$format"
    done
}

patch_family "$TTF_DIR" "ttf"
patch_family "$OTF_DIR" "otf"

echo
echo "=== Done ==="
echo "Output directory: $OUTPUT_DIR"
find "$OUTPUT_DIR" -maxdepth 3 -type f \( -name "*.ttf" -o -name "*.otf" \) | sort
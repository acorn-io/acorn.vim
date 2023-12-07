" Copyright 2014 Google Inc. All rights reserved.
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"     http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

syntax match Number "\<\d*\([Ee][+-]\?\d\+\)\?\>"
syntax match Number "\<\d\+[.]\d*\([Ee][+-]\?\d\+\)\?\>"
syntax match Number "\<[.]\d\+\([Ee][+-]\?\d\+\)\?\>"

syn match Keyword "\<[a-zA-Z_][a-z0-9A-Z_"()\\ ]*\s*?\?::\?"

syn region Object start="{" end="}" fold transparent

syntax keyword Statement for in if let args return define function else
syntax match Statement "+\|-\|/\|\*\|&&\?\|||\|==\|!=\|=\~\|!\~\|!\|<=\?\|>=\?\|:\|=\|<-\|;\|@\|##\?"
syntax keyword Special string
syntax keyword Constant true false null
syntax keyword Underlined error

" NOTE(jjo): block comments removed as of cue 0.11
"syn region Comment start="/[*]" end="[*]/"
syn region Comment start="//" end="$"
syn match Comment "//.*$"

syn match Type "<[^>]*>\||"
syn match Type "\<\(nulll\|bool\|string\|number\|bytes\|\.\.\.\|[*]\)\>"
syn match Keyword "\<_[a-zA-Z0-9_]*"

" String literals.
syn region String start=+\z(#*\)\z('\|"\)+ skip="\\\z2" end="\z2\z1"
" Multiline string literals.
syn region String start=+\z(#*\)\z('''\|"""\)+ end="\z2\z1"
" Interpolation
" TODO: handle modified escape delimeters.
syn region Special start="\\(" end=")"
syn match Special "\\\(([^)]\+)\)" contained containedin=String

" builtins
" From https://godoc.org/cuelang.org/go/pkg
syn match Constant "len"
syn match Constant "keys"
syn match Constant "enum"
syn match Constant "int"
syn match Constant "skip"
syn match Constant "break"
syn match Constant "self"

syn match Constant "std.atoi"
syn match Constant "std.base64"
syn match Constant "std.base64decode"
syn match Constant "std.basename"
syn match Constant "std.catch"
syn match Constant "std.contains"
syn match Constant "std.cut"
syn match Constant "std.describe"
syn match Constant "std.dirname"
syn match Constant "std.endsWith"
syn match Constant "std.fileExt"
syn match Constant "std.fromHex"
syn match Constant "std.fromJSON"
syn match Constant "std.fromYAML"
syn match Constant "std.ifelse"
syn match Constant "std.indexOf"
syn match Constant "std.isA"
syn match Constant "std.itoa"
syn match Constant "std.join"
syn match Constant "std.joinHostPort"
syn match Constant "std.merge"
syn match Constant "std.mod"
syn match Constant "std.pathJoin"
syn match Constant "std.range"
syn match Constant "std.replace"
syn match Constant "std.reverse"
syn match Constant "std.sha1sum"
syn match Constant "std.sha256sum"
syn match Constant "std.sha512sum"
syn match Constant "std.sort"
syn match Constant "std.split"
syn match Constant "std.splitHostPort"
syn match Constant "std.startsWith"
syn match Constant "std.toHex"
syn match Constant "std.toJSON"
syn match Constant "std.toLower"
syn match Constant "std.toTitle"
syn match Constant "std.toUpper"
syn match Constant "std.toYAML"
syn match Constant "std.trim"
syn match Constant "std.trimPrefix"
syn match Constant "std.trimSuffix"

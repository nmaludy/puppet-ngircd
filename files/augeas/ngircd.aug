(*
Module Ngircd
  Lens for parsing /etc/ngircd.conf

Author: Nick Maludy <nmaludy@gmail.com>

About: License
  This file is licensed under the LGPL v2+, like the rest of Augeas.

About: Configuration files
   This lens applies to /etc/ngircd.conf. See <filter>.
*)

module Ngircd =
  autoload xfm

let comment  = IniFile.comment /[#;]/ "#"

let sep      = IniFile.sep " = " " = "

(*
  Delete spaces and ';' from entries so we can replace commented out keys in the proper spot
  Also include the 8 space indent for keys.
*)
let indent = del /[ \t]+/ "        "
let indented_entry (kw:regexp) (sep:lens) (comment:lens) =
     IniFile.entry_generic (indent . key kw) sep IniFile.comment_re comment
let entry    = indented_entry IniFile.entry_re sep comment

let title   = IniFile.indented_title IniFile.record_re
let record  = IniFile.record title entry

let lns     = IniFile.lns record comment

let filter = (incl "/etc/ngircd.conf")

let xfm = transform lns filter
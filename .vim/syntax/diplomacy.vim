" Diplomacy orders syntax file

syn match DiplomacyError "\S\+"
syn keyword DiplomacyUnitType contained A[rmy] F[leet]
syn keyword DiplomacyOrderType contained C[onvoys] S[upports] H[olds] B[uild]
syn match   DiplomacyOrderType contained "->\?"
syn keyword DiplomacySeason contained S[pring] F[all] W[inter]
syn match   DiplomacyYear contained "\(19\)?[0-9]\{2\}"
syn keyword DiplomacyCoast contained sc ec nc
syn keyword DiplomacySpace contained Lon Edi Yor Lvp Cly Wal
syn keyword DiplomacySpace contained Bre Pic Par Bur Mar Gas
syn keyword DiplomacySpace contained Ruh Kie Mun Ber Sil Pru
syn keyword DiplomacySpace contained Pie Ven Tus Rom Nap Apu
syn keyword DiplomacySpace contained Bud Tri Vie Boh Tyr Alb
syn keyword DiplomacySpace contained StP Mos Sev War Ukr Lvn
syn keyword DiplomacySpace contained Con Ank Smy Bul Arm Syr
syn keyword DiplomacySpace contained Spa Por Naf Tun Gre Ser
syn keyword DiplomacySpace contained Bel Hol Nor Swe Rum Gal
syn keyword DiplomacySpace contained Fin
syn keyword DiplomacySpace contained MAO EMS WMS TYS ION GoL

syn match DiplomacyMoveOrder "[AF]\s\+\a\+\s*->\s*\a\+" contains=DiplomacyUnitType,DiplomacyOrderType,DiplomacySpace
syn match DiplomacySupportOrder "[AF]\s\+\a\+\s\+S\s\+.*" contains=DiplomacyUnitType,DiplomacyOrderType,DiplomacySpace,DiplomacyMoveOrder,DiplomacyHoldOrder
syn match DiplomacyConvoyOrder "[AF]\s\+\a\+\s\+C\s\+.*" contains=DiplomacyUnitType,DiplomacyOrderType,DiplomacySpace,DiplomacyMoveOrder
syn match DiplomacyHoldOrder "[AF]\s\+\a\+\s\+H" contains=DiplomacyUnitType,DiplomacyOrderType,DiplomacySpace
syn match DiplomacyBuildOrder "B\s\+[AF]\s\+\a\+" contains=DiplomacyUnitType,DiplomacyOrderType,DiplomacySpace


hi def link DiplomacyOrderType Include
hi def link DiplomacyUnitType Constant
hi def link DiplomacySpace Identifier
hi def link DiplomacyMoveOrder Statement
hi def link DiplomacyHoldOrder Statement
hi def link DiplomacySupportOrder Statement
hi def link DiplomacyConvoyOrder Statement
hi def link DiplomacyBuildOrder Statement
hi def link DiplomacyError Error

let b:current_syntax = "diplomacy"

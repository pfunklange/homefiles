" Diplomacy orders syntax file

syn keyword DiplomacyUnitType contained A F
syn keyword DiplomacyOrderType contained C S H B
syn match DiplomacyOrderType contained "->"
syn keyword DiplomacyCoast contained sc ec nc
syn keyword DiplomacySpace contained Lon Edi Yor Lvp Bre Pic Par Bur Mar 
syn keyword DiplomacySpace contained MAO NAO EMS

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

let b:current_syntax = "diplomacy"

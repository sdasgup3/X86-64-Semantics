// Autogenerated using stratification.
requires "x86-configuration.k"

module RORQ-R64-CL
  imports X86-CONFIGURATION

  rule <k>
    execinstr (rorq %cl, R2:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> ror( getParentValue(R2, RSMap), concatenateMInt( mi(56, 0), andMInt( extractMInt( getParentValue(%rcx, RSMap), 56, 64), mi(8, 63))))

"CF" |-> (#ifMInt (((notBool eqMInt( andMInt( extractMInt( getParentValue(%rcx, RSMap), 56, 64), mi(8, 63)), mi(8, 0))) andBool eqMInt( extractMInt( ror( getParentValue(R2, RSMap), concatenateMInt( mi(56, 0), andMInt( extractMInt( getParentValue(%rcx, RSMap), 56, 64), mi(8, 63)))), 0, 1), mi(1, 1))) orBool ((notBool (notBool eqMInt( andMInt( extractMInt( getParentValue(%rcx, RSMap), 56, 64), mi(8, 63)), mi(8, 0)))) andBool eqMInt(getFlag("CF", RSMap), mi(1,1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"OF" |-> (#ifMInt ((eqMInt( andMInt( extractMInt( getParentValue(%rcx, RSMap), 56, 64), mi(8, 63)), mi(8, 1)) andBool (eqMInt( extractMInt( ror( getParentValue(R2, RSMap), concatenateMInt( mi(56, 0), andMInt( extractMInt( getParentValue(%rcx, RSMap), 56, 64), mi(8, 63)))), 0, 1), mi(1, 1)) xorBool eqMInt( extractMInt( ror( getParentValue(R2, RSMap), concatenateMInt( mi(56, 0), andMInt( extractMInt( getParentValue(%rcx, RSMap), 56, 64), mi(8, 63)))), 1, 2), mi(1, 1)))) orBool ((notBool eqMInt( andMInt( extractMInt( getParentValue(%rcx, RSMap), 56, 64), mi(8, 63)), mi(8, 1))) andBool (((notBool eqMInt( andMInt( extractMInt( getParentValue(%rcx, RSMap), 56, 64), mi(8, 63)), mi(8, 0))) andBool (undefBool)) orBool ((notBool (notBool eqMInt( andMInt( extractMInt( getParentValue(%rcx, RSMap), 56, 64), mi(8, 63)), mi(8, 0)))) andBool eqMInt(getFlag("OF", RSMap), mi(1,1)))))) #then mi(1, 1) #else mi(1, 0) #fi)
)

    </regstate>
    
endmodule

module RORQ-R64-CL-SEMANTICS
  imports RORQ-R64-CL
endmodule

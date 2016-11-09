#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;



#Global constants
my $home =  $ENV{'HOME'};
my $MCSEMA_HOME="";
my $ALLIN_HOME="${home}/Github/binary-decompilation/";
my $CC="clang";
my $CXX="clang++";
my $OPT="opt";
my $LLVMDIS="llvm-dis";
my $LLVMAS="llvm-as";
my $LLVMAS35="${home}/Install/llvm-3.5.0.release.install/bin/llvm-as";
my $LLC="llc";
my $outdir="Output/";
my $CC_OPTIONS="";
#"-fomit-frame-pointer";
#my $redirect = " &> ";


# Customizable inputs
my $help = "";
my $compiler="clang";
my $suffix="clang";
my $arch="64";
my $file="";
my $skip_mcsema="";
my $print="";
my $map="";
my $entry="";
my $incdir="";
my $libnone="";
my $cfg="";
my $bind="";

GetOptions (
            "help"          => \$help, 
            "print"         => \$print, 
            "skip_mcsema"   => \$skip_mcsema, 
            "cfg"           => \$cfg, 
            "bind"           => \$bind, 
            "compiler:s"    => \$compiler, 
            "home:s"       => \$MCSEMA_HOME, 
            "arch:s"        => \$arch, 
            "map:s"         => \$map, 
            "file:s"        => \$file, 
            "suffix:s"      => \$suffix, 
            "entry:s"       => \$entry, 
            "incdir:s"      => \$incdir, 
            "libnone:s"     => \$libnone, 
            ) or die("Error in command line arguments\n");

if($help) {
  print ("run.pl   \n");
  exit(1);
}

if ("" eq $file) {
  die "ERROR: Provide source file name\n";
}

#Derived paths
my $BIN_DESCEND_PATH="${MCSEMA_HOME}/build/mc-sema/bin_descend";
my $CFG_TO_BC_PATH="${MCSEMA_HOME}/build/mc-sema/bitcode_from_cfg/";
my $GCC_ARCH="";
my $BIN_ARCH="";
my $CFGBC_ARCH="";


if($arch eq "32") {
  $GCC_ARCH="-m32";
  $BIN_ARCH="-march=x86";
  $CFGBC_ARCH="-mtriple=i686-pc-linux-gnu";
} else {
  $GCC_ARCH="-m64";
  $BIN_ARCH="-march=x86-64";
  $CFGBC_ARCH="-mtriple=x86_64-pc-linux-gnu";
}

my $cfgext=".ida";
if("" ne $bind) {
  $cfgext="";
}

my ($basename, $ext) = split_filename($file);

if ("" ne $cfg) {
  generate_binary_from_source();
  generate_cfg();
} else {
  run_mcsema();
  generate_linked_binary();
  cleanup();
}

# Functions
sub generate_binary_from_source {
  if("asm" eq $ext) {
    execute("nasm -f elf64 -o ${outdir}${basename}.${suffix}.o $file ;");
  } 
  if("c" eq $ext) {
    execute("${compiler} -O0 ${CC_OPTIONS}  $file ${GCC_ARCH}  -c   -o ${outdir}${basename}.${suffix}.o");
  } 
  if("o" eq $ext) {
    execute("cp  $file  ${outdir}${basename}.${suffix}.o");
  } 
  if("ll" eq $ext) {
    execute("${compiler} -O0 ${CC_OPTIONS}  $file ${GCC_ARCH}  -c   -o ${outdir}${basename}.${suffix}.o");
  } 
  execute("objdump -d ${outdir}${basename}.${suffix}.o 1>${outdir}${basename}.${suffix}.objdump 2>&1");
}


sub generate_linked_binary {
  execute("${LLC} ${BIN_ARCH} -filetype=obj -o ${outdir}${basename}.${suffix}.lifted.o ${outdir}${basename}.${suffix}.opt.ll");
  execute("${CC}  -g ${GCC_ARCH} -I${incdir} -o ${outdir}${basename}.${suffix}.lifted.exe driver_64.c ${outdir}${basename}.${suffix}.lifted.o ${libnone}");
}

sub generate_cfg {
  #execute("IDA_PATH=${home}/ida-6.95 ${BIN_DESCEND_PATH}/bin_descend_wrapper.py -d ${BIN_ARCH} -func-map=${map} -entry-symbol=${entry} -i=${outdir}${basename}.${suffix}.o"); 
  #execute("${home}/ida-6.95/idal64 -B \"-S${BIN_DESCEND_PATH}/get_cfg.py --std-defs ${map} --batch --entry-symbol ${entry} --output ${outdir}${basename}.${suffix}.cfg --debug --debug_output ${outdir}${basename}.${suffix}.ida.log \" ${outdir}${basename}.${suffix}.o "); 
  execute("${BIN_DESCEND_PATH}/bin_descend  ${BIN_ARCH} -d -i=${outdir}${basename}.${suffix}.o -func-map=${map}  -entry-symbol=${entry} &> /tmp/bd.log ");
}

sub run_mcsema {
  if("" ne $skip_mcsema) {
    return;
  }
  if(-e "${outdir}${basename}.${suffix}${cfgext}.cfg") {
    execute("rm -rf ${outdir}${basename}.${suffix}.bc ${outdir}${basename}.${suffix}.opt.bc ${outdir}${basename}.${suffix}.ll ${outdir}${basename}.${suffix}.opt.ll");
    execute("${CFG_TO_BC_PATH}/cfg_to_bc -ignore-unsupported ${CFGBC_ARCH}  -i ${outdir}${basename}.${suffix}${cfgext}.cfg  -o ${outdir}${basename}.${suffix}.bc  -driver=mcsema_main,${entry},raw,return,C 1>/tmp/cfgbc.log 2>&1");
    execute("${OPT} -O3    ${outdir}${basename}.${suffix}.bc  -o=${outdir}${basename}.${suffix}.opt.bc"); 
    execute("${LLVMDIS}   ${outdir}${basename}.${suffix}.bc -o=${outdir}${basename}.${suffix}.ll");
    execute("${LLVMDIS}   ${outdir}${basename}.${suffix}.opt.bc -o=${outdir}${basename}.${suffix}.opt.ll");
  } else {
    print "CFG Missing : ${outdir}${basename}.${suffix}${cfgext}.cfg\n\n" ;
    exit(1);
  }
}

sub cleanup {
  # Clean Up
  execute("rm -rf  ${outdir}${basename}.${suffix}.lifted.o");  
  execute("rm -rf  ${outdir}${basename}.${suffix}.o"); 
  execute("rm -rf  ${outdir}${basename}.${suffix}.bc"); 
  execute("rm -rf  ${outdir}${basename}.${suffix}.opt.bc");
}

# Utilities
sub execute {
  my $args = shift @_;
  if("" ne $print) {
    print "$args \n";
  }
  system("$args");
}

sub display {
  my $args = shift @_;
  print "\t$args \n";
}

sub split_filename {
    my $arg = shift @_;

    if("" eq $arg) {
      return ("", "");
    }
    my @components = split (/\//, ${arg}); 
    my $filename = $components[@components -1];
    @components = split (/\./, ${filename}); 
    my $file = $components[0];
    my $ext = $components[1];
    return ($file,$ext);
}

# Add all the variables we wanted to dump for inspect
sub printall {
  print "\n\n";
  print "\n\n";
}

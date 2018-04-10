import angr
proj = angr.Project('./instructions/xchgl_eax_r32/xchgl_eax_r32.o')
print proj.arch
print proj.entry
print proj.filename
irsb = proj.factory.block(proj.entry).vex
irsb.pp()
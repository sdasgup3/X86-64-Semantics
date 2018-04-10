import angr
proj = angr.Project('./instructions/sall_r32_cl/sall_r32_cl.o')
print proj.arch
print proj.entry
print proj.filename
irsb = proj.factory.block(proj.entry).vex
irsb.pp()
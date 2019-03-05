import numpy as np
import sys
if sys.version_info[0] < 3:
    import tcl
else:
    import tcl.tcl as tcl

print("Testing float64")
for i in range(100):
    A = np.random.rand(4,3)
    B = np.random.rand(3,3)
    C = np.zeros((4,3), dtype=np.float)
    np_result = np.einsum('ij,jk->ik', A, B)
    tcl_result = tcl.einsum('ij,jk->ik', A, B)
    tcl.tensorMult(1., A, 'i,j', B, 'j,k', 0., C, 'i,k')
    assert(np.linalg.norm(np_result - tcl_result ) < 1e-15)
    assert(np.linalg.norm(np_result - C) < 1e-15)

print("Test success")

print("Testing complex128")
for i in range(100):
    A = np.random.rand(4,3) + 1j*np.random.rand(4,3)
    B = np.random.rand(3,3) + 1j*np.random.rand(3,3)
    C = np.zeros((4,3), dtype=A.dtype)
    np_result = np.einsum('ij,jk->ik', A, B)
    tcl_result = tcl.einsum('ij,jk->ik', A, B)
    tcl.tensorMult(1., A, 'i,j', B, 'j,k', 0., C, 'i,k')
    assert(np.linalg.norm(np_result - tcl_result ) < 1e-14)
    assert(np.linalg.norm(np_result - C) < 1e-14)

print("Test success")

print("Testing multiple Indices")
for i in range(100):
    U = np.random.rand(2, 2, 4)
    T = np.random.rand(2, 2, 2, 2, 2)
    np_result = np.einsum('pqa,qldru->pldrua', U, T)
    tcl_result = tcl.einsum('pqa,qldru->pldrua', U, T)
    assert(np.linalg.norm(np_result - tcl_result) < 1e-15)

print("Test success")


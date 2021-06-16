include("gaussian_kernel.jl")

"""
ConstantKernel
"""

struct ConstantKernel <: Kernel end

function ker(k::ConstantKernel, x1, x2)
    return 1.0
end
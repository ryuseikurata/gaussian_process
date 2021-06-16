include("gaussian_kernel.jl")
"""
LinearKernel
"""

struct LinearKernel <: Kernel  end

function ker(k::LinearKernel, x1, x2)
    return 1.0 + dot(x1, x2)
end
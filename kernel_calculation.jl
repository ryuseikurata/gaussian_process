import Base: +, *
include("gaussian_kernel.jl")
"""
ScalarProduct
"""

mutable struct KernelScalarProd <: Kernel
    coef::Float64
    kernel::Kernel
end

function ker(k::KernelScalarProd, x1, x2)
    k.coef * ker(k.kernel,x1, x2)
end

"""
Sum
"""
mutable struct KernelSum <: Kernel
    kernel1::Kernel
    kernel2::Kernel
end

